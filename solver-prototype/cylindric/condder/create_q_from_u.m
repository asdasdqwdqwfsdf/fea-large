function q = create_q_from_u(IDX,X,index)
	% function q = create_q_from_u(IDX,X,index)
	% Create individual displacements vector q for element 
	% with index 'index' using global displacements vector X
	% and index matrix IDX
	q = zeros(12,1);
	for j = 1:12
		q(j) = X(IDX(index,j));	
	end

