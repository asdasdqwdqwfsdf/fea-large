#include <float.h>
#include <memory>
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <cmath>
#include <math.h>
#include <list>
#include <ctype.h>
#include <cassert>
#include <map>

#ifdef WIN32
	#define isnan(arg) _isnan(arg)
#endif

#ifndef M_PI
	#define M_PI       3.14159265358979323846
#endif 
//#define LOGGING

struct IIntegrator
{
	IIntegrator(double A, double B) : a_(A), b_(B){};

	virtual double integrator(double x,double arg1, double arg2) = 0;
	
	void set_limits(double A,double B)
	{
		a_ = A;
		b_ = B;
	}	
	double a_;
	double b_;
};

struct Utility
{
	static double f(double r,double k, double C)
	{
		if ( r*r/k + C < 0 )
		{
			std::cout<<"	sqrt from (-1): r*r/k = "<<r*r/k<<" C = "<<C <<std::endl;
			std::cout<<"	r = " << r << std::endl;
			if ( r < 2 )
			{
				std::cout <<" r < 2" <<std::endl;
			}
		}
		return sqrt(r*r/k + C);
	}
	
	static double integrate(IIntegrator* to_integrate, 
		double arg1, double arg2, int count)
	{
		if ( !(count&1) )
			return 0;
		int k = (count-1)/2;
		double result = 0.0;
		double H = (to_integrate->b_ - to_integrate->a_)/(6.0*k);
		int lim = 2*k;
		for ( int i = 1; i < lim; ++ i )
		{
			double x = (to_integrate->b_ - to_integrate->a_)*i/(count-1) 
				+ to_integrate->a_;
			result += i&1 ? 4*to_integrate->integrator(x,arg1,arg2) : 
					2*to_integrate->integrator(x,arg1,arg2); 
		}
		result += to_integrate->integrator(to_integrate->a_,arg1,arg2) + 
			to_integrate->integrator(to_integrate->b_,arg1,arg2); 
		
		result = result*H;
		return result;
	}
	
		// strains
	static double strain_eng(double k)
	{
		// The engineering strain is defined by: 
		// strain_eng = (L-L0) / L0
		return k - 1; // k = L/L0;
	}
	static double strain_true(double k)
	{
		// The true strain is defined by: 
		// strain_true = ln( L/L0 ) = ln(1 + strain_eng)
		return log(k);
	}
	static double k_from_strain_eng(double strain)
	{
		return strain+1;
	}
	static double k_from_strain_true(double strain)
	{
		return exp(strain);
	}

	// stresses
	static
	double stress_eng(double F, double k, double r1, double r2)
	{
		// The true stress is here converted from engineering stress assuming incompressibility, hence: 
		// stress_eng = F / A0, 
		// for a uniaxial test.
		double A0 = 2*M_PI*(r2 - r1);
		return F/A0;
	}

	static
	double stress_true(double F, double k, double r1, double r2)
	{
		// stress_true = (L/L0) * stress_eng 
		return k*stress_eng(F,k,r1,r2);
	}

	static
	double pressureTzz_from_stress_eng(double S,double k,double r1,double r2)
	{
		double A0 = 2*M_PI*(r2 - r1);
		return S*A0;
	}
	static
	double pressureTzz_from_stress_true(double S,double k,double r1,double r2)
	{
		return pressureTzz_from_stress_eng(S,k,r1,r2)/k;
	}


private: 
	Utility(){};
};


struct AModel : public IIntegrator
{
	AModel(double param1, 
					double param2, 
					int n, 
					double r1, 
					double r2,
					int integrate_n = 100):
					param1_(param1),param2_(param2),n_(n),r1_(r1),r2_(r2),
					integrate_n_(integrate_n),
					IIntegrator(r1,r2) {};
	void set_params(double param1, double param2)
	{
		param1_ = param1;
		param2_ = param2;
	}
	void set_radius(double r1, double r2)
	{
		r1_ = r1;
		r2_ = r2;
		set_limits(r1,r2);
	}
	void set_n_model(int n)
	{
		assert(n == 1 || n ==  2 || n ==  4 || n == 5);
		n_ = n;
	}

	// Functions needed for solving nonlinear system 
	/** {P_\sigma}_r */
	virtual double func_Ps_r(double r, double k, double C) = 0;

	/** {P_\sigma}_\phi */
	virtual double func_Ps_phi(double r, double k, double C) = 0;

	/** {P_{\sigma}_z */
	virtual double func_Ps_z(double r, double k, double C) = 0;


	/** h(r) */
	double func_h(double r, double k, double C);

	// Functions needed for output 
	// Diagonal parts of Piola stress tensor
	double func_Pr(double r, double k, double C, double p0);

	double func_Pphi(double r, double k, double C, double p0);
	
	double func_Pz(double r, double k, double C, double p0);

	// Diagonal part of Cauchy stress tensor
	
	double func_Tr(double r, double k, double C, double p0);

	double func_Tphi(double r, double k, double C, double p0);
	
	double func_Tz(double r, double k, double C, double p0);


	
	virtual double integrator(double r,double k, double C) 
	{
		return func_h(r,k,C)/r; 
	}
	
	virtual	const char* model_name() const = 0;
	virtual const char* param_1_name() const = 0;
	virtual const char* param_2_name() const = 0;

protected:

	/** \frac{\partial {P_\sigma}_r}{\partial r} */
	double func_dPs_r(double r, double k, double C);

	/** p(r) */
	double func_p(double r, double k, double p0, double C);
	
protected:
	double param1_;
	double param2_;
	int n_;
	double r1_;
	double r2_;
	const int integrate_n_;
};


double AModel::func_h(double r, double k, double C)
{
	double	result = 0;

	result = r*func_dPs_r(r,k,C)+func_Ps_r(r,k,C)-func_Ps_phi(r,k,C);

	return result;
}
	
double AModel::func_Pr(double r, double k, double C, double p0)
{
	double result = 0;
	
	double f = Utility::f(r,k,C);
	result = -f*k*func_p(r,k,p0,C)/r + func_Ps_r(r,k,C);

	return result;
}

double AModel::func_Pphi(double r, double k, double C, double p0)
{
	double result = 0;
	
	double f = Utility::f(r,k,C);
	result = -r*func_p(r,k,p0,C)/f + func_Ps_phi(r,k,C);
	
	
	return result;
}
	
double AModel::func_Pz(double r, double k, double C, double p0)
{
	double result = 0;
	
	double f = Utility::f(r,k,C);
	result = -func_p(r,k,p0,C)/k + func_Ps_z(r,k,C);

	return result;
}


double AModel::func_Tr(double r, double k, double C, double p0)
{
	double result = 0;
	result = func_Pr(r,k,C,p0)*r/(Utility::f(r,k,C)*k);
	return result;
}

double AModel::func_Tphi(double r, double k, double C, double p0)
{
	double result = 0;
	result = func_Pphi(r,k,C,p0)*Utility::f(r,k,C)/r;
	return result;
}
	
double AModel::func_Tz(double r, double k, double C, double p0)
{
	double result = 0;
	result = func_Pz(r,k,C,p0)*k;
	return result;
}


double AModel::func_dPs_r(double r, double k, double C)
{
	double result = 0;
	double h = (r2_-r1_)/(integrate_n_*2);
	if ( r ==  r2_ || r >= r2_ - h*2 ) // backward derivative
	{
		double f2,f1,f0;
		f2 = func_Ps_r(r-2*h,k,C);
		f1 = func_Ps_r(r-h,k,C);
		f0 = func_Ps_r(r,k,C);
		result = (3*f0-4*f1+f2)/(2*h);
	}
	else // forward derivative
	{
		double f2,f1,f0;
		f2 = func_Ps_r(r+2*h,k,C);
		f1 = func_Ps_r(r+h,k,C);
		f0 = func_Ps_r(r,k,C);
		result = (-f2+4*f1-3*f0)/(2*h);
	}	

	return result;
}

double AModel::func_p(double r, double k, double p0, double C)
{
	double b = b_;
	set_limits(a_,r);
	double result = p0 + Utility::integrate(this,k,C,integrate_n_)/k;
	set_limits(a_,b);
	return result;
}


struct Model_B : public AModel
{
		Model_B(double m, // param1
					double b,  // param2
					int n, 
					double r1, 
					double r2,
					int integrate_n = 101):
					AModel(m,b,n,r1,r2,integrate_n) {};

	double func_Ps_r(double r, double k, double C)
	{
		double m = param1_;
		double b = param2_;
		double result = 0;
		double f = Utility::f(r,k,C);
		result = m*(n_-3)*pow(r/(f*k),n_-3-1)*
			(1+b + (1-b)*( pow(f/r,n_-3) + pow(k,(n_-3)) ) );
		return result;
	}
	double func_Ps_phi(double r, double k, double C)
	{
		double result = 0;
		double m = param1_;
		double b = param2_;
		double f = Utility::f(r,k,C);
		result = m*(n_-3)*pow(f/r,n_-3-1)*
			(1 + b + (1-b)*( pow(r/(f*k),n_-3) + pow(k,n_-3) ) );
		return result;
	}
	double func_Ps_z(double r, double k, double C)
	{
		double result = 0;
		double f = Utility::f(r,k,C);
		double m = param1_;
		double b = param2_;
		result = m*(n_-3)*pow(k,n_-3-1)*
			(1 + b + (1-b)*( pow(r/(f*k),n_-3) + pow(f/r,n_-3) ) );
		return result;
	}
	const char* model_name() const { return "B"; };
	const char* param_1_name() const { return "mu"; };
	const char* param_2_name() const { return "betta"; };
};

struct Model_A : public AModel
{
		Model_A(double l, // param1 = lambda
					double m,  // param2 = mu
					int n, 
					double r1, 
					double r2,
					int integrate_n = 101):
					AModel(l,m,n,r1,r2,integrate_n) {};

	double func_Ps_r(double r, double k, double C)
	{
		double result = 0;
		double l = param1_;
		double m = param2_;
		double f = Utility::f(r,k,C);
		double I1 = pow(r/(f*k),n_-3) + pow(f/r,n_-3) + pow(k,n_-3) - 3;
		result = (1.0/(n_-3))*pow(r/(f*k),n_-3-1)*
						(l*I1 + 2*m*(pow(r/(f*k),n_-3)-1));
		return result;
	}
	double func_Ps_phi(double r, double k, double C)
	{
		double result = 0;
		double l = param1_;
		double m = param2_;
		double f = Utility::f(r,k,C);
		double I1 = pow(r/(f*k),n_-3) + pow(f/r,n_-3) + pow(k,n_-3) - 3;
		result = (1.0/(n_-3))*pow(f/r,n_-3-1)*
						(l*I1 + 2*m*(pow(f/r,n_-3)-1));
		return result;
	}
	double func_Ps_z(double r, double k, double C)
	{
		double result = 0;
		double l = param1_;
		double m = param2_;
		double f = Utility::f(r,k,C);
		double I1 = pow(r/(f*k),n_-3) + pow(f/r,n_-3) + pow(k,n_-3) - 3;
		result = (1.0/(n_-3))*pow(k,n_-3-1)*
						(l*I1 + 2*m*(pow(k,n_-3)-1));
		return result;
	}
	const char* model_name() const { return "A"; };
	const char* param_1_name() const { return "lambda"; };
	const char* param_2_name() const { return "mu"; };
};


template<class Model>
struct Lame
{
	Lame(double q1, double q2, double k, int n,
			 double l1, double l2, 
			 double r1, double r2, double eps, int integrate_n = 101) :
		q1_(q1),q2_(q2),k_(k),n_(n), l1_(l1),l2_(l2),r1_(r1),r2_(r2),eps_(eps),
		integrate_n_(integrate_n),model_(new Model(l1,l2,n,r1,r2,integrate_n))
		{
			using std::cout;
			using std::endl;
			cout << "Lame task. Parameters: " << endl;
			cout << "Model: " << model_->model_name() << " where n = " << n_ << endl;
			cout << "Parameters:" << endl;
			cout << model_->param_1_name() << " = " << l1_ << endl;
			cout << model_->param_2_name() << " = " << l2_ << endl;
			cout << "Geometry: " << endl;
			cout << "r1 = " << r1_ << endl;
			cout << "r2 = " << r2_ << endl;
			cout << "Boundary conditions:" << endl;
			cout << "Inner pressure q1 = " << q1_ << endl;
			cout << "Outer pressure q2 = " << q2_ << endl;
			cout << "Extension strain k = " << k_ << endl;
		}

		const char* model_name() { return model_->model_name(); }
		const char* param_1_name() { return model_->param_1_name(); }
		const char* param_2_name() { return model_->param_2_name(); }

		void set_new_k(double k)
		{
			k_ = k;
		}
		void set_radius(double r1, double r2)
		{
			r1_ = r1;
			r2_ = r2;
			model_->set_radius(r1,r2);
		}
		void set_n_model(int n)
		{
			n_ = n;
			model_->set_n_model(n);
		}	
		void set_material_constants(double param1, double param2)
		{
			l1_ = param1;
			l2_ = param2;
			model_->set_params(param1,param2);
		}

		void calculate_p0_and_C(double& p0, double& C)
		{
			using std::cout;
			using std::endl;
#ifdef LOGGING
			cout << "Calculating p0 and C constants" << endl;
			cout << "(Newton's method used for calculations)" << endl;
			cout << "Initial approximation: " << endl;
			cout << "p0 = " << p0 << endl;
			cout << "C = " << C << endl;
#endif 
			double dp0 = 0, dC = 0;		
			int i = 0;
			do 
			{	
				double a,b,c,d;
				calculate_jacobi_2x2(p0,C,a,b,c,d);
				if (isnan(a) || isnan(b) || isnan(c) || isnan(d) )
				{
				}
				if (!calculate_inverse_2x2(a,b,c,d))
				{
					cout << "Singular jacobi matrix obtained at iteration " << i << endl;
					cout << "Calculation stopped." << endl;
					return;
				}
				if (isnan(a) || isnan(b) || isnan(c) || isnan(d) )
				{
					cout << "Singular jacobi matrix obtained at iteration " << i << endl;
					cout << "Calculation stopped." << endl;
					return;
				}
				dp0 = -a*F1(p0,C) - b*F2(p0,C);
				dC = -c*F1(p0,C) - d*F2(p0,C);
				p0 = p0 + dp0;
				double delta = r1_*r1_/k_ - (C + dC);
				if ( delta >= 0 )
					C = C + dC;
				else 
					cout << "leave previous value of C" << endl;
#ifdef LOGGING
				cout << "Iteration " << i << endl;
				cout << "dp0 = " << dp0 << " p0 = " << p0 << endl;
				cout << "dC = " << dC << " C = " << C << endl;
#endif
				i++;
			} while ( fabs(dp0) > eps_ || fabs(dC) > eps_ ); 
#ifdef LOGGING
			cout << "Final values: p0 = " << p0 << " C = " << C << endl;
#endif
#ifdef LOGGING
				cout << "Iterations: " << i << endl;
#endif
		}
		
		void piola_stresses(/* [in] */ double r, double p0, double C, 
									/* [out] */ double& Pr, double& Pphi, double& Pz)
		{
			Pr = model_->func_Pr(r,k_,C,p0);
			Pphi = model_->func_Pphi(r,k_,C,p0);
			Pz = model_->func_Pz(r,k_,C,p0);
		}

		struct Stress_z : public IIntegrator
		{
			Stress_z(Model& model,double k, double p0, double C,
														double r1,double r2) : 
				model_(model),k_(k), p0_(p0),C_(C),IIntegrator(r1,r2)
				{
					set_limits(Utility::f(r1,k,C),Utility::f(r2,k,C));
				}
			double integrator(double x,double arg1, double arg2)
			{
				double r = Utility::f(x,k_,C_);
//				return r*model_.func_Tz(x,k_,C_,p0_);
				double df = x/(k_*r);
				return r*model_.func_Tz(r,k_,C_,p0_)*df;
			}
//			void set_limits(double A,double B)
			private:
			Model& model_;
			double p0_;
			double C_;
			double k_;
		};
		
		double pressure_Tzz(double p0, double C)
		{
			Stress_z stress((*model_),k_,p0,C,r1_,r2_);
			return 2*M_PI*Utility::integrate(&stress,0,0,integrate_n_);
		}	

		// E**G(n)
		// Finger's strain measure 1st invariant E**B
		// B = F*F^T, F - deformation gradient
		double I1_Gn(double r, double C)
		{
			double result = 0;
			result = pow(r/(Utility::f(r,k_,C)*k_),n_-3)+
							pow(Utility::f(r,k_,C)/r,n_-3)+
							pow(k_,n_-3);
			return result;
		};
		double I2_Gn(double r, double C)
		{
			double result = 0;
			result = 0.5*(I1_Gn(r,C)-(pow(r/(Utility::f(r,k_,C)*k_),2*n_-6)+
							pow(Utility::f(r,k_,C)/r,2*n_-6)+
							pow(k_,2*n_-6)));
			return result;
		};
		double I3_Gn(double r, double C)
		{
			double result = 0;
			result = pow(r/(Utility::f(r,k_,C)*k_),n_-3)*
							pow(Utility::f(r,k_,C)/r,n_-3)*
							pow(k_,n_-3);
			return result;
		};

protected: 
		double F1(double p0, double C)
		{	
			return q1_ - p0*Utility::f(r1_,k_,C)*k_/r1_ 
				+ model_->func_Ps_r(r1_,k_,C);
		}
		double F2(double p0, double C)
		{
			return q2_ - p0*Utility::f(r2_,k_,C)*k_/r2_
				+ Utility::integrate(&(*model_),k_,C,integrate_n_)/k_
				+ model_->func_Ps_r(r2_,k_,C);
		}

		bool calculate_inverse_2x2(double& a, double& b, double& c, double& d)
		{
			double det = a*d-b*c;
#ifdef LOGGING
			std::cout << "determinant of Jacobi matrix = " << det << std::endl;
			std::cout << "a="<<a<<" b="<<b<<" c="<<c<<" d="<<d<<std::endl;
#endif
			if ( fabs(det) < eps_ )
				return false;
			double a1 = d/det;
			double b1 = -b/det;
			double c1 = -c/det;
			double d1 = a/det;			
			a = a1;
			b = b1;
			c = c1;
			d = d1;
			return true;
		}

		bool calculate_jacobi_2x2(double p0,double C,
			double& a, double& b, double& c, double& d)
		{
			// a = dF1/dp, b = dF1/dC,
			// c = dP2/dp, d = dF2/dC
			
			// derivatives by p0 can be obtained analytically
			a = -Utility::f(r1_,k_,C)*k_/r1_;
			c = -Utility::f(r2_,k_,C)*k_/r2_;
			
			// derivatives by C should be calculated numerically
			double h = eps_/100.0;
			double dF1 = 0,dF2 = 0;
			dF1 = (-F1(p0,C+2*h) +27*F1(p0,C+h) - 27*F1(p0,C) + F1(p0,C-h) )/(24*h);
			double numerator = 0, denominator = 0;
			double p1,p2,p3,p4;
			p1 = -F2(p0,C+2*h);
			p2 = 27*F2(p0,C+h);
			p3 = -27*F2(p0,C);
			p4 = F2(p0,C-h);
			numerator = p1 + p2 + p3 + p4;
			denominator = 24*h;
			dF2 = numerator/denominator;

			b = dF1;
			d = dF2;

			return true;
		}

private:
	std::auto_ptr<Model> model_;
	double q1_;
	double q2_;
	double k_;
	int n_;
	double l1_;
	double l2_;
	double r1_;
	double r2_;
	int integrate_n_;
	double eps_;
};


struct test : public IIntegrator
{
	test() : IIntegrator(1,3){}
	virtual double integrator(double x,double arg1, double arg2)
	{
		return x*x+x;
	}
};

void calculate_lame_task()
{
	using std::cout;
	using std::cin;
	using std::endl;

	const double eps = 0.00001;
	const int integration_n = 101;
	int n = 0;
	double q1 = 0.0;
	double q2 = 0.0;
	double mu = 200.0; // Bn l1 = mu
	double betta = 2.0; // Bn l2 = betta
	double lambda = 2.0; // Bn l2 = betta
	double r1 = 2.0;
	double r2 = 2.5;
	double k_begin = 1;
	double k_end = 5;
	int steps = 400;
	
	bool is_model_A = true;
	std::string mdl;

	cout << "Program for calculating Lame task for models A1,A2,A4,A5 and B1,B2,B4,B5" << endl;
	cout << "Please enter following parameters: " << endl;
	cout << "Name of model(for example A1, B5, A2 etc.): ";
	cin >> mdl;
	if ( mdl.length() != 2 )
	{
		cout << "Wrong model name! Should be in form 'An' or 'Bn', where n = [1,2,4,5]" << endl;
		return;
	}
	if ( mdl[0] == 'A' || mdl[0] == 'a' )
	{
		is_model_A = true;
	} 
	else if ( mdl[0] == 'B' || mdl[0] == 'b' )
	{
		is_model_A = false;
	}
	else
	{
		cout << "Wrong model name! Should be in form 'An' or 'Bn', where n = [1,2,4,5]" << endl;
		return;
	}
	n = atoi(mdl.c_str()+1);
	if (!(n == 1 || n == 2 || n == 4 || n == 5))
	{
		cout << "Wrong model name! Should be in form 'An' or 'Bn', where n = [1,2,4,5]" << endl;
		return;
	}

	cout << "Inner radius r1 = ";
	cin >> r1;
	cout << "Outer radius r2 = ";
	cin >> r2;
	cout << "Inner pressure q1 = ";
	cin >> q1;
	cout << "Outer pressure q2 = ";
	cin >> q2;
	cout << "Material constants:" << endl;
	cout << "Mu(model An,Bn) = ";
	cin >> mu;
	if ( is_model_A )
	{
		cout << "Lambda(model An) = ";
		cin >> lambda;
	}
	else
	{
		cout << "Betta(model Bn) = " ;
		cin >> betta;
	}
	cout << "Start value of strain k for iteration(could be 1.0 for example) = ";
	cin >> k_begin;
	cout << "Last value of strain k for iteration(could be 5.0 for 400% strain) = ";
	cin >> k_end;
	cout << "Number of iterations(could be 100 for example) = ";
	cin >> steps;
	cout << endl << "Calculating started. Please wait..." << endl;

//	for ( n = 4; n <= 4; ++ n )
	if ( is_model_A )
	{
		double k = k_begin;
		if ( n == 3 ) return; // continue;
		Lame<Model_A> lame(q1,q2,k,n,lambda,mu,r1,r2,eps,integration_n);

		std::ofstream file;
		std::stringstream fname;
		fname << lame.model_name() << n;
		fname << "_" << lame.param_1_name() << "_" << lambda;
		fname << "_" << lame.param_2_name() << "_" << mu;
		fname << "_r1_" << r1 << "_r2_" << r2;
		fname << ".txt";
		
		file.open(fname.str().c_str(),std::ios_base::out | std::ios_base::trunc);

		double p0 = 1, C = 0;
	
		double pressure_prev = 0;

		double step_k = (k_end - k_begin)/(double)steps;
		for ( int i = 0; i < steps; ++ i )
		{
			k += step_k;
			lame.set_new_k(k);
			lame.calculate_p0_and_C(p0,C);
			double pressure_Tzz = lame.pressure_Tzz(p0,C);
			double I1 = lame.I1_Gn((r1+r2)/2.0,C);
			double I2 = lame.I2_Gn((r1+r2)/2.0,C);
			double I3 = lame.I3_Gn((r1+r2)/2.0,C);
			if ( !isnan(pressure_Tzz) )
			{
				if ( i > 0 && fabs(pressure_Tzz - pressure_prev ) < 1e5 )
				{
					file << k << " " << pressure_Tzz << " I1 = " << I1;
					file << " I2 = " << I2 << endl;
				}
				pressure_prev = pressure_Tzz;
			}
		}			
		file.flush();
		file.close();

	}
	else
	//for ( n = 1; n <= 1; ++ n )
	{
		double k = k_begin;
		if ( n == 3 ) return; // continue;

		Lame<Model_B> lame(q1,q2,k,n,mu,betta,r1,r2,eps,integration_n);

		std::ofstream file;
		std::stringstream fname;
		fname << lame.model_name() << n;
		fname << "_" << lame.param_1_name() << "_" << mu;
		fname << "_" << lame.param_2_name() << "_" << betta;
		fname << "_r1_" << r1 << "_r2_" << r2;
		fname << ".txt";
		
		file.open(fname.str().c_str(),std::ios_base::out | std::ios_base::trunc);

		double p0 = 1, C = 0;
	
		double pressure_prev = 0;

		double step_k = (k_end - k_begin)/(double)steps;
		for ( int i = 0; i < steps; ++ i )
		{
			k += step_k;
			lame.set_new_k(k);
			lame.calculate_p0_and_C(p0,C);
			double pressure_Tzz = lame.pressure_Tzz(p0,C);
			double I1 = lame.I1_Gn((r1+r2)/2.0,C);
			double I2 = lame.I2_Gn((r1+r2)/2.0,C);
			double I3 = lame.I3_Gn((r1+r2)/2.0,C);
			if ( !isnan(pressure_Tzz) )
			{
				if ( i > 0 && fabs(pressure_Tzz - pressure_prev ) < 1e5 )
				{
					file << k << " " << pressure_Tzz << " I1 = " << I1;
					file << " I2 = " << I2 << endl;
				}
				pressure_prev = pressure_Tzz;
			}
		}			
		file.flush();
		file.close();

	}
}


int main(int argc, const char* argv[])
{
	calculate_lame_task();
	return 0;
}
