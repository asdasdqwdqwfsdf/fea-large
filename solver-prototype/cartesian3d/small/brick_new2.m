function [nodes,elements,boundary]=brick_new2
nodes = [
1.000000,1.000000,0.000000;
0.000000,1.000000,0.000000;
0.750000,1.000000,0.000000;
0.500000,1.000000,0.000000;
0.250000,1.000000,0.000000;
1.000000,1.000000,1.000000;
1.000000,1.000000,0.750000;
1.000000,1.000000,0.500000;
1.000000,1.000000,0.250000;
0.000000,1.000000,1.000000;
0.250000,1.000000,1.000000;
0.500000,1.000000,1.000000;
0.750000,1.000000,1.000000;
0.000000,1.000000,0.250000;
0.000000,1.000000,0.500000;
0.000000,1.000000,0.750000;
0.180116,1.000000,0.820532;
0.472791,1.000000,0.327638;
0.672791,1.000000,0.527638;
0.530944,1.000000,0.669944;
0.600829,1.000000,0.849412;
0.850829,1.000000,0.599412;
0.850829,1.000000,0.849412;
0.502078,1.000000,0.498758;
0.821962,1.000000,0.428226;
0.571962,1.000000,0.178226;
0.821962,1.000000,0.178226;
0.330944,1.000000,0.469944;
0.400829,1.000000,0.149412;
0.150829,1.000000,0.399412;
0.150829,1.000000,0.149412;
0.180116,1.000000,0.570532;
0.430116,1.000000,0.820532;
0.360231,1.000000,0.641065;
0.301657,1.000000,0.298824;
0.643924,1.000000,0.356452;
0.701657,1.000000,0.698824;
1.000000,7.000000,1.000000;
1.000000,1.250000,1.000000;
1.000000,1.500000,1.000000;
1.000000,1.750000,1.000000;
1.000000,2.000000,1.000000;
1.000000,2.250000,1.000000;
1.000000,2.500000,1.000000;
1.000000,2.750000,1.000000;
1.000000,3.000000,1.000000;
1.000000,3.250000,1.000000;
1.000000,3.500000,1.000000;
1.000000,3.750000,1.000000;
1.000000,4.000000,1.000000;
1.000000,4.250000,1.000000;
1.000000,4.500000,1.000000;
1.000000,4.750000,1.000000;
1.000000,5.000000,1.000000;
1.000000,5.250000,1.000000;
1.000000,5.500000,1.000000;
1.000000,5.750000,1.000000;
1.000000,6.000000,1.000000;
1.000000,6.250000,1.000000;
1.000000,6.500000,1.000000;
1.000000,6.750000,1.000000;
0.000000,7.000000,1.000000;
0.750000,7.000000,1.000000;
0.500000,7.000000,1.000000;
0.250000,7.000000,1.000000;
0.000000,6.750000,1.000000;
0.000000,6.500000,1.000000;
0.000000,6.250000,1.000000;
0.000000,6.000000,1.000000;
0.000000,5.750000,1.000000;
0.000000,5.500000,1.000000;
0.000000,5.250000,1.000000;
0.000000,5.000000,1.000000;
0.000000,4.750000,1.000000;
0.000000,4.500000,1.000000;
0.000000,4.250000,1.000000;
0.000000,4.000000,1.000000;
0.000000,3.750000,1.000000;
0.000000,3.500000,1.000000;
0.000000,3.250000,1.000000;
0.000000,3.000000,1.000000;
0.000000,2.750000,1.000000;
0.000000,2.500000,1.000000;
0.000000,2.250000,1.000000;
0.000000,2.000000,1.000000;
0.000000,1.750000,1.000000;
0.000000,1.500000,1.000000;
0.000000,1.250000,1.000000;
0.502002,1.295503,1.000000;
0.502130,6.704497,1.000000;
0.585474,6.506980,1.000000;
0.583943,6.851639,1.000000;
0.833943,6.601639,1.000000;
0.833943,6.851639,1.000000;
0.419717,6.508197,1.000000;
0.168187,6.602857,1.000000;
0.418187,6.852857,1.000000;
0.168187,6.852857,1.000000;
0.584709,1.493020,1.000000;
0.833816,1.398361,1.000000;
0.583816,1.148361,1.000000;
0.833816,1.148361,1.000000;
0.419079,1.491803,1.000000;
0.418187,1.147143,1.000000;
0.168187,1.397143,1.000000;
0.168187,1.147143,1.000000;
0.502807,1.963708,1.000000;
0.502456,2.493056,1.000000;
0.501882,2.999009,1.000000;
0.502679,3.500005,1.000000;
0.502679,4.000031,1.000000;
0.502680,4.500181,1.000000;
0.502682,5.001052,1.000000;
0.502705,5.506120,1.000000;
0.502893,6.035562,1.000000;
0.251531,6.405340,1.000000;
0.251531,6.155340,1.000000;
0.251363,5.880222,1.000000;
0.251363,5.630222,1.000000;
0.251342,5.375898,1.000000;
0.251342,5.125898,1.000000;
0.251340,4.875154,1.000000;
0.251340,4.625154,1.000000;
0.251340,4.375026,1.000000;
0.251340,4.125026,1.000000;
0.251340,3.875005,1.000000;
0.251340,3.625005,1.000000;
0.251340,3.375001,1.000000;
0.251340,3.125001,1.000000;
0.250542,2.874008,1.000000;
0.250542,2.624008,1.000000;
0.251914,2.369048,1.000000;
0.251914,2.119048,1.000000;
0.250893,1.844660,1.000000;
0.250893,1.594660,1.000000;
0.750893,1.594660,1.000000;
0.750893,1.844660,1.000000;
0.751914,2.119048,1.000000;
0.751914,2.369048,1.000000;
0.750542,2.624008,1.000000;
0.750542,2.874008,1.000000;
0.751340,3.125001,1.000000;
0.751340,3.375001,1.000000;
0.751340,3.625005,1.000000;
0.751340,3.875005,1.000000;
0.751340,4.125026,1.000000;
0.751340,4.375026,1.000000;
0.751340,4.625154,1.000000;
0.751340,4.875154,1.000000;
0.751342,5.125898,1.000000;
0.751342,5.375898,1.000000;
0.751363,5.630222,1.000000;
0.751363,5.880222,1.000000;
0.751531,6.155340,1.000000;
0.751531,6.405340,1.000000;
0.503061,6.310680,1.000000;
0.502725,5.760444,1.000000;
0.502684,5.251796,1.000000;
0.502680,4.750308,1.000000;
0.502679,4.250053,1.000000;
0.502679,3.750009,1.000000;
0.502679,3.250002,1.000000;
0.501085,2.748016,1.000000;
0.503828,2.238095,1.000000;
0.501785,1.689320,1.000000;
0.336373,1.294286,1.000000;
0.667632,1.296721,1.000000;
0.336373,6.705714,1.000000;
0.667887,6.703279,1.000000;
1.000000,7.000000,0.000000;
1.000000,6.750000,0.000000;
1.000000,6.500000,0.000000;
1.000000,6.250000,0.000000;
1.000000,6.000000,0.000000;
1.000000,5.750000,0.000000;
1.000000,5.500000,0.000000;
1.000000,5.250000,0.000000;
1.000000,5.000000,0.000000;
1.000000,4.750000,0.000000;
1.000000,4.500000,0.000000;
1.000000,4.250000,0.000000;
1.000000,4.000000,0.000000;
1.000000,3.750000,0.000000;
1.000000,3.500000,0.000000;
1.000000,3.250000,0.000000;
1.000000,3.000000,0.000000;
1.000000,2.750000,0.000000;
1.000000,2.500000,0.000000;
1.000000,2.250000,0.000000;
1.000000,2.000000,0.000000;
1.000000,1.750000,0.000000;
1.000000,1.500000,0.000000;
1.000000,1.250000,0.000000;
1.000000,7.000000,0.250000;
1.000000,7.000000,0.500000;
1.000000,7.000000,0.750000;
1.000000,6.705476,0.500793;
1.000000,1.294524,0.500665;
1.000000,6.509524,0.584706;
1.000000,6.603571,0.833852;
1.000000,6.853571,0.583852;
1.000000,6.853571,0.833852;
1.000000,6.507857,0.417796;
1.000000,6.851905,0.416941;
1.000000,6.601905,0.166941;
1.000000,6.851905,0.166941;
1.000000,1.490476,0.584068;
1.000000,1.146429,0.583852;
1.000000,1.396429,0.833852;
1.000000,1.146429,0.833852;
1.000000,1.492143,0.417030;
1.000000,1.398095,0.166814;
1.000000,1.148095,0.416814;
1.000000,1.148095,0.166814;
1.000000,6.036905,0.498940;
1.000000,5.506944,0.497544;
1.000000,5.000991,0.498118;
1.000000,4.499995,0.497321;
1.000000,3.999968,0.497322;
1.000000,3.499816,0.497330;
1.000000,2.998928,0.497375;
1.000000,2.493761,0.497635;
1.000000,1.963724,0.499145;
1.000000,1.844048,0.750216;
1.000000,1.594048,0.750216;
1.000000,2.369676,0.748928;
1.000000,2.119676,0.748928;
1.000000,2.874085,0.748706;
1.000000,2.624085,0.748706;
1.000000,3.374843,0.748668;
1.000000,3.124843,0.748668;
1.000000,3.874973,0.748662;
1.000000,3.624973,0.748662;
1.000000,4.374995,0.748660;
1.000000,4.124995,0.748660;
1.000000,4.874999,0.748660;
1.000000,4.624999,0.748660;
1.000000,5.375992,0.749458;
1.000000,5.125992,0.749458;
1.000000,5.880952,0.748086;
1.000000,5.630952,0.748086;
1.000000,6.405952,0.750854;
1.000000,6.155952,0.750854;
1.000000,6.155952,0.250854;
1.000000,6.405952,0.250854;
1.000000,5.630952,0.248086;
1.000000,5.880952,0.248086;
1.000000,5.125992,0.249458;
1.000000,5.375992,0.249458;
1.000000,4.624999,0.248660;
1.000000,4.874999,0.248660;
1.000000,4.124995,0.248660;
1.000000,4.374995,0.248660;
1.000000,3.624973,0.248662;
1.000000,3.874973,0.248662;
1.000000,3.124843,0.248668;
1.000000,3.374843,0.248668;
1.000000,2.624085,0.248706;
1.000000,2.874085,0.248706;
1.000000,2.119676,0.248928;
1.000000,2.369676,0.248928;
1.000000,1.594048,0.250216;
1.000000,1.844048,0.250216;
1.000000,1.688095,0.500433;
1.000000,2.239352,0.497857;
1.000000,2.748170,0.497413;
1.000000,3.249686,0.497336;
1.000000,3.749946,0.497323;
1.000000,4.249991,0.497321;
1.000000,4.749998,0.497321;
1.000000,5.251984,0.498915;
1.000000,5.761905,0.496172;
1.000000,6.311905,0.501709;
1.000000,1.296190,0.333627;
1.000000,1.292857,0.667703;
1.000000,6.703810,0.333882;
1.000000,6.707143,0.667703;
0.000000,7.000000,0.000000;
0.250000,7.000000,0.000000;
0.500000,7.000000,0.000000;
0.750000,7.000000,0.000000;
0.000000,1.250000,0.000000;
0.000000,1.500000,0.000000;
0.000000,1.750000,0.000000;
0.000000,2.000000,0.000000;
0.000000,2.250000,0.000000;
0.000000,2.500000,0.000000;
0.000000,2.750000,0.000000;
0.000000,3.000000,0.000000;
0.000000,3.250000,0.000000;
0.000000,3.500000,0.000000;
0.000000,3.750000,0.000000;
0.000000,4.000000,0.000000;
0.000000,4.250000,0.000000;
0.000000,4.500000,0.000000;
0.000000,4.750000,0.000000;
0.000000,5.000000,0.000000;
0.000000,5.250000,0.000000;
0.000000,5.500000,0.000000;
0.000000,5.750000,0.000000;
0.000000,6.000000,0.000000;
0.000000,6.250000,0.000000;
0.000000,6.500000,0.000000;
0.000000,6.750000,0.000000;
0.502002,6.704497,0.000000;
0.502130,1.295503,0.000000;
0.584709,6.506980,0.000000;
0.583816,6.851639,0.000000;
0.833816,6.601639,0.000000;
0.833816,6.851639,0.000000;
0.419079,6.508197,0.000000;
0.168187,6.602857,0.000000;
0.418187,6.852857,0.000000;
0.168187,6.852857,0.000000;
0.585474,1.493020,0.000000;
0.833943,1.398361,0.000000;
0.583943,1.148361,0.000000;
0.833943,1.148361,0.000000;
0.419717,1.491803,0.000000;
0.418187,1.147143,0.000000;
0.168187,1.397143,0.000000;
0.168187,1.147143,0.000000;
0.502807,6.036292,0.000000;
0.502456,5.506944,0.000000;
0.501882,5.000991,0.000000;
0.502679,4.499995,0.000000;
0.502679,3.999969,0.000000;
0.502680,3.499819,0.000000;
0.502682,2.998948,0.000000;
0.502705,2.493880,0.000000;
0.502893,1.964438,0.000000;
0.251531,1.844660,0.000000;
0.251531,1.594660,0.000000;
0.251363,2.369778,0.000000;
0.251363,2.119778,0.000000;
0.251342,2.874102,0.000000;
0.251342,2.624102,0.000000;
0.251340,3.374846,0.000000;
0.251340,3.124846,0.000000;
0.251340,3.874974,0.000000;
0.251340,3.624974,0.000000;
0.251340,4.374995,0.000000;
0.251340,4.124995,0.000000;
0.251340,4.874999,0.000000;
0.251340,4.624999,0.000000;
0.250542,5.375992,0.000000;
0.250542,5.125992,0.000000;
0.251914,5.880952,0.000000;
0.251914,5.630952,0.000000;
0.250893,6.405340,0.000000;
0.250893,6.155340,0.000000;
0.750893,6.155340,0.000000;
0.750893,6.405340,0.000000;
0.751914,5.630952,0.000000;
0.751914,5.880952,0.000000;
0.750542,5.125992,0.000000;
0.750542,5.375992,0.000000;
0.751340,4.624999,0.000000;
0.751340,4.874999,0.000000;
0.751340,4.124995,0.000000;
0.751340,4.374995,0.000000;
0.751340,3.624974,0.000000;
0.751340,3.874974,0.000000;
0.751340,3.124846,0.000000;
0.751340,3.374846,0.000000;
0.751342,2.624102,0.000000;
0.751342,2.874102,0.000000;
0.751363,2.119778,0.000000;
0.751363,2.369778,0.000000;
0.751531,1.594660,0.000000;
0.751531,1.844660,0.000000;
0.503061,1.689320,0.000000;
0.502725,2.239556,0.000000;
0.502684,2.748204,0.000000;
0.502680,3.249692,0.000000;
0.502679,3.749947,0.000000;
0.502679,4.249991,0.000000;
0.502679,4.749998,0.000000;
0.501085,5.251984,0.000000;
0.503828,5.761905,0.000000;
0.501785,6.310680,0.000000;
0.336373,1.294286,0.000000;
0.667887,1.296721,0.000000;
0.336373,6.705714,0.000000;
0.667632,6.703279,0.000000;
0.000000,7.000000,0.750000;
0.000000,7.000000,0.500000;
0.000000,7.000000,0.250000;
0.000000,6.704497,0.502002;
0.000000,1.295503,0.502130;
0.000000,6.506980,0.584709;
0.000000,6.601639,0.833816;
0.000000,6.851639,0.583816;
0.000000,6.851639,0.833816;
0.000000,6.508197,0.419079;
0.000000,6.852857,0.418187;
0.000000,6.602857,0.168187;
0.000000,6.852857,0.168187;
0.000000,1.493020,0.585474;
0.000000,1.148361,0.583943;
0.000000,1.398361,0.833943;
0.000000,1.148361,0.833943;
0.000000,1.491803,0.419717;
0.000000,1.397143,0.168187;
0.000000,1.147143,0.418187;
0.000000,1.147143,0.168187;
0.000000,6.036292,0.502807;
0.000000,5.506944,0.502456;
0.000000,5.000991,0.501882;
0.000000,4.499995,0.502679;
0.000000,3.999969,0.502679;
0.000000,3.499819,0.502680;
0.000000,2.998948,0.502682;
0.000000,2.493880,0.502705;
0.000000,1.964438,0.502893;
0.000000,1.594660,0.251531;
0.000000,1.844660,0.251531;
0.000000,2.119778,0.251363;
0.000000,2.369778,0.251363;
0.000000,2.624102,0.251342;
0.000000,2.874102,0.251342;
0.000000,3.124846,0.251340;
0.000000,3.374846,0.251340;
0.000000,3.624974,0.251340;
0.000000,3.874974,0.251340;
0.000000,4.124995,0.251340;
0.000000,4.374995,0.251340;
0.000000,4.624999,0.251340;
0.000000,4.874999,0.251340;
0.000000,5.125992,0.250542;
0.000000,5.375992,0.250542;
0.000000,5.630952,0.251914;
0.000000,5.880952,0.251914;
0.000000,6.155340,0.250893;
0.000000,6.405340,0.250893;
0.000000,6.405340,0.750893;
0.000000,6.155340,0.750893;
0.000000,5.880952,0.751914;
0.000000,5.630952,0.751914;
0.000000,5.375992,0.750542;
0.000000,5.125992,0.750542;
0.000000,4.874999,0.751340;
0.000000,4.624999,0.751340;
0.000000,4.374995,0.751340;
0.000000,4.124995,0.751340;
0.000000,3.874974,0.751340;
0.000000,3.624974,0.751340;
0.000000,3.374846,0.751340;
0.000000,3.124846,0.751340;
0.000000,2.874102,0.751342;
0.000000,2.624102,0.751342;
0.000000,2.369778,0.751363;
0.000000,2.119778,0.751363;
0.000000,1.844660,0.751531;
0.000000,1.594660,0.751531;
0.000000,1.689320,0.503061;
0.000000,2.239556,0.502725;
0.000000,2.748204,0.502684;
0.000000,3.249692,0.502680;
0.000000,3.749947,0.502679;
0.000000,4.249991,0.502679;
0.000000,4.749998,0.502679;
0.000000,5.251984,0.501085;
0.000000,5.761905,0.503828;
0.000000,6.310680,0.501785;
0.000000,1.294286,0.336373;
0.000000,1.296721,0.667887;
0.000000,6.705714,0.336373;
0.000000,6.703279,0.667632;
0.820486,7.000000,0.820486;
0.526597,7.000000,0.326597;
0.326597,7.000000,0.526597;
0.470000,7.000000,0.670000;
0.399514,7.000000,0.849514;
0.149514,7.000000,0.599514;
0.149514,7.000000,0.849514;
0.670000,7.000000,0.470000;
0.599514,7.000000,0.149514;
0.849514,7.000000,0.399514;
0.849514,7.000000,0.149514;
0.497569,7.000000,0.497569;
0.177083,7.000000,0.427083;
0.427083,7.000000,0.177083;
0.177083,7.000000,0.177083;
0.820486,7.000000,0.570486;
0.570486,7.000000,0.820486;
0.640972,7.000000,0.640972;
0.354167,7.000000,0.354167;
0.699028,7.000000,0.299028;
0.299028,7.000000,0.699028;
0.501845,2.494343,0.501262;
0.500291,2.999110,0.500097;
0.499903,3.999903,0.499903;
0.581493,6.664252,0.340947;
0.335014,6.670950,0.574482;
0.495436,6.038779,0.498932;
0.428432,1.329049,0.335014;
0.665569,1.328467,0.573899;
0.503399,1.961221,0.495436;
0.501845,5.505657,0.498738;
0.501845,5.001084,0.500291;
0.750923,2.621257,0.499338;
0.750923,2.497172,0.750631;
0.750923,2.366848,0.499560;
0.500688,2.873563,0.750049;
0.750542,2.748093,0.748706;
0.750146,2.873640,0.498755;
0.750146,2.999555,0.750049;
0.250146,2.873657,0.501391;
0.250146,3.124401,0.501388;
0.250146,2.999555,0.250049;
0.501485,3.124556,0.750049;
0.251340,3.249847,0.751340;
0.250146,2.999555,0.750049;
0.500097,3.499506,0.500000;
0.249951,3.624797,0.501291;
0.501291,3.624952,0.749951;
0.542277,6.487466,0.670474;
0.419038,6.490815,0.787241;
0.458254,6.667601,0.457714;
0.538465,6.351516,0.419940;
0.499249,6.174730,0.749466;
0.415225,6.354865,0.536707;
0.467830,6.832126,0.347557;
0.344590,6.835475,0.464324;
0.611233,6.832126,0.490960;
0.487993,6.835475,0.607727;
0.640260,6.832126,0.319988;
0.540747,6.832126,0.170474;
0.418400,6.490815,0.287241;
0.541639,6.487466,0.170474;
0.498611,6.174730,0.249466;
0.790747,6.488079,0.421328;
0.790747,6.684031,0.337415;
0.750893,6.311293,0.250854;
0.750893,6.507245,0.166941;
0.458933,6.684983,0.170474;
0.335694,6.688332,0.287241;
0.624562,6.683766,0.170474;
0.833816,6.703544,0.166941;
0.714216,1.312620,0.334321;
0.832784,1.312329,0.453763;
0.547000,1.328758,0.454456;
0.536178,1.164525,0.345733;
0.821962,1.148095,0.345040;
0.654747,1.164233,0.465176;
0.832784,1.508281,0.537166;
0.714216,1.508572,0.417723;
0.465915,1.645135,0.415225;
0.584484,1.644844,0.534667;
0.751699,1.824658,0.497934;
0.394332,1.164525,0.488039;
0.512900,1.164233,0.607482;
0.214216,1.312885,0.501450;
0.180116,1.148361,0.654476;
0.332784,1.312594,0.620893;
0.214216,1.509185,0.419038;
0.332784,1.508893,0.538480;
0.251699,1.825271,0.499249;
0.251531,1.491803,0.168187;
0.251531,1.689320,0.251531;
0.168187,1.294286,0.168187;
0.750923,5.502828,0.749369;
0.750923,5.633781,0.497455;
0.502285,5.633050,0.749369;
0.751363,5.761174,0.748086;
0.502836,5.633781,0.249369;
0.750923,5.502828,0.249369;
0.501465,5.378820,0.249369;
0.751914,5.761905,0.248086;
0.747718,5.900342,0.497552;
0.747718,6.175342,0.500320;
0.747718,6.019389,0.749466;
0.751531,6.311293,0.750854;
0.498640,5.772218,0.498835;
0.499632,5.900342,0.249466;
0.250923,5.633781,0.501283;
0.247718,5.900342,0.501380;
0.251914,5.761905,0.251914;
0.247718,6.019389,0.749466;
0.499081,5.899611,0.749466;
0.251363,5.761174,0.751914;
0.747718,6.019389,0.249466;
0.247718,6.019389,0.249466;
0.247718,6.174730,0.500359;
0.250923,2.497172,0.750631;
0.501465,2.621180,0.750631;
0.250923,2.621274,0.501973;
0.250542,2.748110,0.751342;
0.583677,1.508893,0.786950;
0.502592,1.825271,0.747718;
0.250893,1.689320,0.751531;
0.750893,1.688707,0.750216;
0.503230,1.825271,0.247718;
0.751699,1.980611,0.247718;
0.751531,1.688707,0.250216;
0.751699,2.100287,0.496646;
0.751699,1.980611,0.747718;
0.250923,2.366950,0.501994;
0.250923,2.497172,0.250631;
0.502285,2.366950,0.250631;
0.251363,2.239556,0.251363;
0.503062,2.100389,0.247718;
0.251699,1.980611,0.247718;
0.251699,2.100389,0.499081;
0.251699,1.980611,0.747718;
0.750923,4.875541,0.498806;
0.750923,5.126534,0.499603;
0.750923,5.000542,0.750146;
0.500874,4.500494,0.500097;
0.249951,4.374951,0.501291;
0.250923,4.875541,0.501485;
0.502262,4.875541,0.250146;
0.501291,4.374951,0.249951;
0.251340,4.749998,0.251340;
0.250923,5.000542,0.250146;
0.250923,5.126534,0.500688;
0.501845,5.253371,0.499514;
0.502265,5.126440,0.750146;
0.502265,5.378726,0.749369;
0.250923,5.378820,0.499911;
0.251342,5.251890,0.750542;
0.751342,5.251890,0.749458;
0.750923,5.000542,0.250146;
0.501465,5.126534,0.250146;
0.250923,5.502828,0.249369;
0.249951,3.999951,0.249951;
0.249951,4.124947,0.501291;
0.249951,3.874925,0.501291;
0.833816,1.294789,0.833852;
0.345270,6.852857,0.177083;
0.168187,6.705714,0.168187;
0.177083,6.852857,0.345270;
0.683330,6.851639,0.149514;
0.849514,6.851905,0.316455;
0.149514,6.851639,0.683330;
0.168187,6.704497,0.833816;
0.317701,6.852857,0.849514;
0.167507,6.687115,0.621057;
0.167507,6.835475,0.537241;
0.167507,6.688332,0.455427;
0.820486,6.851905,0.487427;
0.317021,6.835475,0.636755;
0.488673,6.852857,0.820486;
0.833943,6.705211,0.833852;
0.654430,6.851639,0.820486;
0.502836,2.366219,0.750631;
0.249951,3.999951,0.749951;
0.501291,4.124978,0.749951;
0.251340,4.250022,0.751340;
0.250923,5.502828,0.749369;
0.503613,2.099658,0.747718;
0.502622,2.227782,0.498349;
0.751914,2.238724,0.748928;
0.251914,2.238826,0.751363;
0.251340,3.749978,0.751340;
0.501291,3.874956,0.749951;
0.251340,4.500026,0.751340;
0.250893,6.310680,0.250893;
0.335694,6.688332,0.787241;
0.790747,6.685698,0.504325;
0.820486,6.853571,0.654338;
0.251531,6.310680,0.750893;
0.751340,4.749998,0.248660;
0.749951,4.374951,0.498612;
0.250542,5.251984,0.250542;
0.251340,4.249991,0.251340;
0.251340,4.499995,0.251340;
0.250923,5.000542,0.750146;
0.251340,4.750153,0.751340;
0.501488,2.873657,0.250049;
0.251342,2.748204,0.251342;
0.251340,3.499819,0.251340;
0.251340,3.749947,0.251340;
0.251340,3.499974,0.751340;
0.251340,3.249692,0.251340;
0.501291,3.874925,0.249951;
0.501291,4.124947,0.249951;
0.180116,1.147143,0.488719;
0.214216,1.311668,0.335694;
0.365044,1.164525,0.316919;
0.150829,1.147143,0.317599;
0.465746,1.509185,0.167507;
0.502265,2.621274,0.250631;
0.501068,2.746727,0.500680;
0.751342,2.748187,0.248706;
0.250893,1.493020,0.833943;
0.500971,1.311376,0.786950;
0.168187,1.295503,0.833943;
0.832784,1.310662,0.620801;
0.850829,1.146429,0.683264;
0.683613,1.164233,0.636362;
0.832784,1.164233,0.536950;
0.666600,1.312594,0.786950;
0.684645,1.148361,0.849412;
0.382402,1.311668,0.167507;
0.464216,1.164525,0.167507;
0.319015,1.147143,0.149412;
0.167507,6.490815,0.538134;
0.250893,6.508197,0.168187;
0.168187,6.508197,0.750893;
0.501486,3.124401,0.250049;
0.501291,3.624797,0.249951;
0.751340,3.249689,0.248668;
0.751340,3.499819,0.248662;
0.750146,3.124398,0.498717;
0.750146,3.374528,0.498710;
0.751340,4.249991,0.248660;
0.750923,5.378820,0.498827;
0.750542,5.251984,0.249458;
0.749951,3.999951,0.249951;
0.751340,4.499995,0.248660;
0.502262,4.875696,0.750146;
0.751340,3.749947,0.248662;
0.548159,1.312885,0.167507;
0.655906,1.148361,0.178226;
0.348302,1.147143,0.820532;
0.833943,1.296456,0.166814;
0.751363,2.239454,0.248928;
0.751340,3.249844,0.748668;
0.751340,3.499974,0.748662;
0.750146,2.999555,0.250049;
0.749951,4.124947,0.498612;
0.502262,4.625569,0.750146;
0.751340,4.750153,0.748660;
0.751340,4.500026,0.748660;
0.750923,2.497172,0.250631;
0.749951,3.874925,0.498613;
0.751340,4.250022,0.748660;
0.501450,6.687115,0.787241;
0.624690,6.683766,0.670474;
0.749951,3.999951,0.749951;
0.751340,3.749978,0.748662;
0.751531,1.492755,0.166814;
0.513932,1.148361,0.820532;
0.833943,6.507592,0.750854;
0.833816,1.492408,0.750216;
];
elements = [
491,266,44,265,502,229,503,504,222,226;
492,163,266,46,505,506,507,508,141,228;
492,458,459,289,509,413,510,511,421,422;
492,162,459,81,512,513,510,514,129,449;
492,459,162,493,510,513,512,515,516,517;
492,458,81,459,509,450,514,510,413,449;
494,156,495,496,518,519,520,521,522,523;
494,488,495,487,524,525,520,526,481,527;
494,489,280,488,528,478,529,524,471,483;
494,495,381,496,520,530,531,521,523,532;
273,494,276,381,533,534,203,535,531,536;
494,381,495,384,531,530,520,537,311,538;
381,494,276,385,531,534,536,307,539,540;
497,274,498,36,541,542,543,544,545,546;
497,498,264,499,543,547,548,549,550,551;
497,34,498,467,552,553,543,554,555,556;
497,498,499,456,543,550,549,557,558,559;
497,498,456,467,543,558,557,554,556,399;
466,372,283,456,560,333,404,403,561,416;
382,372,283,466,319,333,321,562,560,404;
500,56,272,157,563,241,564,565,152,566;
500,380,176,379,567,354,568,569,324,357;
500,176,380,272,568,354,567,564,246,570;
496,272,273,58,571,215,572,573,240,243;
496,273,156,58,572,574,522,573,243,154;
500,496,380,464,575,576,567,577,578,579;
500,380,496,272,567,576,575,564,570,571;
496,69,464,157,580,438,578,581,118,582;
496,174,381,273,583,352,532,572,244,535;
496,464,301,380,578,433,584,576,579,348;
496,380,381,174,576,323,532,583,355,352;
496,464,69,465,578,438,580,585,407,437;
496,301,464,465,584,433,578,585,434,407;
491,83,163,458,586,131,587,588,451,589;
497,264,498,274,548,547,543,541,211,542;
498,499,456,165,550,559,558,590,591,592;
498,499,165,264,550,591,590,547,551,593;
499,372,190,264,594,371,595,551,596,263;
499,265,42,264,597,227,598,551,223,224;
491,457,287,373,599,419,600,601,602,334;
499,373,190,372,603,368,595,594,331,371;
499,264,42,165,551,224,598,591,593,137;
499,285,457,373,604,418,605,603,335,602;
499,85,456,165,606,454,559,591,134,592;
499,457,285,456,605,418,604,559,415,417;
499,85,457,456,606,453,605,559,454,415;
501,270,271,54,607,217,608,609,236,239;
501,493,462,378,610,611,612,613,614,615;
501,378,462,297,613,615,612,616,344,429;
501,462,463,297,612,409,617,616,429,430;
500,501,158,463,618,619,620,621,617,622;
501,271,158,54,608,623,619,609,239,150;
501,178,378,379,624,359,613,625,356,325;
500,299,463,464,626,431,621,577,432,408;
293,493,461,460,627,628,426,425,629,411;
491,287,457,458,600,419,599,588,420,414;
6,275,167,40,210,630,102,39,209,100;
278,384,488,468,314,631,484,398,632,633;
489,170,385,280,480,310,634,478,281,308;
494,488,487,489,524,481,526,528,471,477;
489,170,276,385,480,206,635,634,310,540;
387,278,488,468,388,484,482,396,398,633;
62,469,490,168,394,636,476,98,637,638;
495,469,387,468,639,393,640,641,389,396;
494,489,385,280,528,634,539,529,478,308;
494,487,276,489,526,642,534,528,477,635;
495,387,490,488,640,475,643,525,482,472;
494,273,496,381,533,572,521,531,535,532;
490,168,487,64,638,644,473,474,97,486;
38,169,277,60,94,645,202,61,93,200;
38,487,169,64,470,646,94,63,486,92;
487,64,168,169,486,97,644,646,92,90;
491,83,164,163,586,132,647,587,131,108;
77,493,461,160,648,628,445,125,649,650;
77,461,493,460,445,628,648,446,411,629;
500,71,158,157,651,120,620,565,119,114;
491,457,83,458,599,452,586,588,414,451;
491,164,499,265,647,652,653,504,654,597;
491,457,499,164,599,605,653,647,655,652;
77,161,460,493,126,656,446,648,657,629;
461,462,75,160,410,443,444,650,658,124;
496,301,465,381,584,434,585,532,351,659;
495,490,168,487,643,638,660,527,473,644;
494,276,487,277,534,642,526,661,197,662;
500,299,464,380,626,432,577,567,349,579;
500,71,463,158,651,440,621,620,120,622;
496,156,465,69,522,663,585,580,117,437;
501,378,270,493,613,664,607,610,614,665;
501,379,297,463,625,347,616,617,666,430;
461,377,295,378,667,342,427,668,326,345;
77,79,460,161,78,447,446,126,127,656;
461,462,378,295,410,615,668,427,428,345;
500,299,379,463,626,346,569,621,431,666;
501,73,158,463,669,121,619,617,441,622;
462,160,159,75,658,112,670,443,124,123;
492,374,458,289,671,672,509,511,336,421;
459,291,460,376,423,424,412,673,341,674;
459,460,79,162,412,447,448,513,675,128;
77,493,160,161,648,649,125,126,657,111;
459,291,376,375,423,341,673,676,338,328;
293,493,376,377,627,677,340,343,678,327;
460,79,162,161,447,128,675,656,127,110;
293,461,377,295,426,667,343,294,427,342;
497,34,466,35,552,679,680,681,28,682;
497,372,499,264,683,594,549,548,596,551;
491,287,374,373,600,337,684,601,334,330;
492,458,163,81,509,589,505,514,450,130;
491,492,266,374,685,507,502,684,671,686;
498,165,467,166,590,687,556,688,103,689;
498,275,37,8,690,691,692,693,208,22;
497,498,34,36,543,553,552,544,546,24;
498,37,275,167,692,691,690,694,695,630;
499,372,456,285,594,561,559,604,332,417;
456,87,467,165,455,401,399,592,135,687;
497,382,4,35,696,320,697,681,698,29;
495,496,465,381,523,585,699,530,532,659;
38,487,277,169,470,662,202,94,646,645;
468,465,303,381,395,435,397,700,659,350;
495,490,469,168,643,636,639,660,638,637;
62,490,64,168,476,474,65,98,638,97;
299,464,380,301,432,579,349,300,433,348;
465,495,168,156,699,660,701,663,519,95;
468,384,381,303,632,311,700,397,312,350;
495,387,488,468,640,482,525,641,396,633;
278,468,303,384,398,397,304,314,632,312;
465,303,381,301,435,350,659,434,302,351;
461,378,493,377,668,614,628,667,326,678;
500,379,501,463,569,625,618,621,666,617;
299,463,297,379,431,430,298,346,666,347;
492,459,493,375,510,516,515,702,676,703;
375,267,268,492,704,220,705,702,706,707;
491,492,458,163,685,509,588,587,505,589;
459,291,375,289,423,338,676,422,290,339;
377,182,180,269,360,181,361,708,252,253;
500,501,379,271,618,625,569,709,608,710;
495,468,488,384,641,633,525,538,632,631;
494,495,488,384,520,525,524,537,538,631;
500,271,379,176,709,710,569,568,249,357;
377,182,493,376,360,711,678,327,363,677;
168,465,67,469,701,436,96,637,391,392;
500,496,464,157,575,578,577,565,581,582;
462,378,295,297,615,345,428,429,344,296;
377,180,270,269,361,250,712,708,253,218;
501,178,379,271,624,356,625,608,248,710;
501,462,159,73,612,670,713,669,442,122;
500,271,56,158,709,238,563,620,623,151;
459,493,460,162,516,629,412,513,517,675;
375,376,268,184,328,714,705,365,362,254;
459,493,375,376,516,703,676,673,677,328;
293,461,493,377,426,628,627,343,667,678;
287,289,458,374,288,421,420,337,336,672;
501,378,178,270,613,359,624,607,664,251;
287,373,457,285,334,602,419,286,335,418;
374,186,266,188,367,259,686,366,187,258;
466,382,35,2,562,698,682,406,322,31;
497,4,383,36,697,317,715,544,26,716;
456,283,285,372,416,284,417,561,333,332;
492,374,289,375,671,336,511,702,329,339;
498,467,34,166,556,555,553,688,689,717;
497,383,382,372,715,306,696,683,315,319;
383,1,274,36,318,214,718,716,27,545;
372,497,466,382,683,680,560,319,696,562;
456,497,466,372,557,680,403,561,683,560;
499,457,85,164,605,453,606,652,655,133;
496,272,380,174,571,570,576,583,247,355;
377,180,378,270,361,358,326,712,250,664;
491,44,266,163,503,229,502,587,140,506;
495,468,381,465,641,700,530,699,395,659;
489,276,170,195,635,206,480,479,204,194;
494,280,385,384,529,308,539,537,313,305;
465,69,156,67,437,117,663,436,68,116;
381,273,174,172,535,244,352,353,245,173;
276,381,172,273,536,353,205,203,535,245;
170,276,385,172,206,540,310,171,205,309;
499,265,264,190,597,223,551,595,260,263;
372,190,264,192,371,263,596,370,191,262;
376,184,182,268,362,183,363,714,254,255;
492,266,267,46,507,221,706,508,228,231;
499,285,373,372,604,335,603,594,332,331;
373,188,265,190,369,261,719,368,189,260;
375,186,184,267,364,185,365,704,256,257;
492,267,268,162,706,220,707,512,720,721;
492,186,375,267,722,364,702,706,256,704;
377,493,182,269,678,711,360,708,723,252;
377,378,493,270,326,614,678,712,664,665;
379,271,178,176,710,248,356,357,249,177;
494,156,496,273,518,522,521,533,574,572;
501,159,160,270,713,112,724,607,725,726;
495,465,496,156,699,585,523,519,663,522;
501,462,73,463,612,442,669,617,409,441;
491,373,374,188,601,330,684,727,369,366;
491,164,265,44,647,654,504,503,139,226;
491,374,266,188,684,686,502,727,366,258;
492,374,186,266,671,367,722,507,686,259;
492,267,266,186,706,221,507,722,256,259;
491,265,188,266,504,261,727,502,222,258;
375,268,376,493,705,714,328,703,728,677;
376,493,268,182,677,728,714,363,711,255;
269,160,50,52,729,146,235,234,147,51;
182,268,269,493,255,219,252,711,728,723;
467,166,10,34,689,106,402,555,717,17;
491,492,163,266,685,505,587,502,507,506;
496,381,380,301,532,323,576,584,351,348;
500,158,501,271,620,619,618,709,623,608;
500,176,272,271,568,246,564,709,249,216;
385,381,172,276,307,353,309,540,536,205;
495,169,487,168,730,646,527,660,90,644;
494,169,277,487,731,645,661,526,646,662;
500,272,56,271,564,241,563,709,216,238;
462,75,159,73,443,123,670,442,74,122;
501,159,270,54,713,725,607,609,149,236;
269,270,493,160,218,665,723,729,726,649;
270,52,159,160,237,148,725,726,147,112;
501,271,270,178,608,217,607,624,248,251;
269,50,493,268,235,732,723,219,232,728;
270,54,159,52,236,149,725,237,53,148;
459,81,162,79,449,129,513,448,80,128;
268,492,493,375,707,515,728,705,702,703;
491,374,287,458,684,337,600,588,672,420;
268,48,161,162,233,144,733,721,143,110;
268,161,50,493,733,145,232,728,657,732;
497,264,274,372,548,211,541,683,596,734;
499,265,164,42,597,654,652,598,227,138;
492,163,46,162,505,141,508,512,109,142;
497,4,382,383,697,320,696,715,317,306;
372,192,264,274,370,262,596,734,212,211;
383,1,192,274,318,193,316,718,214,212;
498,274,8,36,542,213,693,546,545,25;
266,46,163,44,228,141,506,229,45,140;
492,162,46,267,512,142,508,706,720,231;
498,275,274,264,690,198,542,547,207,211;
498,166,34,167,688,717,553,694,89,735;
498,37,167,34,692,695,694,553,20,735;
497,372,456,499,683,561,557,549,594,559;
6,37,275,8,23,691,210,7,22,208;
293,460,291,376,425,424,292,340,674,341;
494,495,156,169,520,519,518,731,730,91;
500,157,158,56,565,114,620,563,152,151;
71,464,69,157,439,438,70,119,582,118;
487,195,277,276,485,201,662,642,204,197;
495,468,465,469,641,395,699,639,389,391;
494,276,277,273,534,197,661,533,203,199;
495,487,488,490,527,481,525,643,473,472;
496,156,157,58,522,115,581,573,154,153;
494,381,384,385,531,311,537,539,307,305;
272,157,56,58,566,152,241,240,153,57;
278,488,384,280,484,631,314,279,483,313;
38,487,195,277,470,485,196,202,662,201;
273,169,156,60,736,91,574,242,93,155;
491,492,374,458,685,671,684,588,509,672;
273,277,169,60,199,645,736,242,200,93;
71,463,158,73,440,622,120,72,441,121;
494,385,489,276,539,634,528,534,540,635;
271,158,54,56,623,150,239,238,151,55;
469,495,168,465,639,660,637,391,699,701;
269,50,160,493,235,146,729,723,732,649;
162,492,493,268,512,515,517,721,707,728;
500,463,71,464,621,440,651,577,408,439;
491,44,163,164,503,140,587,647,139,108;
466,382,2,283,562,322,406,404,321,282;
497,383,372,274,715,315,683,541,718,734;
267,48,162,46,230,143,720,231,47,142;
456,87,165,85,455,135,592,454,86,134;
83,85,457,164,84,453,452,132,133,655;
461,378,462,493,668,615,410,628,614,611;
460,493,161,162,629,657,656,675,517,110;
491,373,499,457,601,603,653,599,602,605;
501,159,158,73,713,113,619,669,122,121;
500,496,157,272,575,581,565,564,571,566;
268,50,161,48,232,145,733,233,49,144;
269,270,160,52,218,726,729,234,237,147;
462,159,160,501,670,112,658,612,713,724;
77,160,461,75,125,650,445,76,124,444;
268,493,162,161,728,517,721,733,657,110;
50,161,160,493,145,111,146,732,657,649;
167,264,40,275,737,225,100,630,207,209;
491,164,83,457,647,132,586,599,655,452;
383,372,274,192,315,734,718,316,370,212;
83,458,81,163,451,450,82,131,589,130;
265,42,44,164,227,43,226,654,138,139;
496,157,272,58,581,566,571,573,153,240;
499,373,265,190,603,719,597,595,368,260;
499,85,165,164,606,134,591,652,133,107;
492,162,81,163,512,129,514,505,109,130;
275,498,167,264,690,694,630,207,547,737;
491,373,265,499,601,719,504,653,603,597;
293,493,460,376,627,629,425,340,677,674;
497,274,36,383,541,545,544,715,718,716;
500,379,299,380,569,346,626,567,324,349;
500,71,157,464,651,119,565,577,439,582;
267,48,268,162,230,233,220,720,143,721;
494,495,169,487,520,730,731,526,527,646;
499,164,165,42,652,107,591,598,138,137;
270,501,493,160,607,610,665,726,724,649;
461,493,462,160,628,611,410,650,649,658;
160,501,493,462,724,610,649,658,612,611;
378,180,178,270,358,179,359,664,250,251;
496,69,157,156,580,118,581,522,117,115;
489,487,276,195,477,642,635,479,485,204;
273,60,156,58,242,155,574,243,59,154;
495,468,384,381,641,632,538,530,700,311;
494,273,277,169,533,199,661,731,736,645;
156,465,67,168,663,436,116,95,701,96;
494,273,169,156,533,736,731,518,574,91;
495,169,168,156,730,90,660,519,91,95;
501,158,159,54,619,113,713,609,150,149;
496,174,273,272,583,244,572,571,247,215;
495,387,469,490,640,393,639,643,475,636;
62,469,168,67,394,637,98,66,392,96;
387,62,469,490,386,394,393,475,476,636;
498,8,274,275,693,213,542,690,208,198;
467,165,87,166,687,135,401,689,103,105;
166,167,12,34,89,101,104,717,735,33;
467,87,10,166,401,88,402,689,105,106;
459,460,493,376,412,629,516,673,674,677;
498,165,166,167,590,103,688,694,99,89;
498,165,456,467,590,592,558,556,687,399;
6,12,167,37,13,101,102,23,21,695;
494,488,280,384,524,483,529,537,631,313;
165,264,40,167,593,225,136,99,737,100;
274,1,8,36,214,9,213,545,27,25;
497,35,466,382,681,682,680,696,698,562;
6,275,37,167,210,691,23,102,630,695;
467,15,34,10,400,32,555,402,16,17;
466,35,15,2,682,30,405,406,31,14;
383,1,36,4,318,27,716,317,3,26;
501,378,297,379,613,344,616,625,325,347;
497,34,467,466,552,555,554,680,679,390;
264,40,42,165,225,41,224,593,136,137;
498,36,8,37,546,25,693,692,19,22;
498,37,34,36,692,20,553,546,19,24;
166,12,10,34,104,11,106,717,33,17;
167,37,12,34,695,21,101,735,20,33;
382,4,35,2,320,29,698,322,5,31;
466,34,467,15,679,555,390,405,32,400;
375,267,184,268,704,257,365,705,220,254;
466,34,15,35,679,32,405,682,28,30;
492,459,375,289,510,676,702,511,422,339;
491,265,373,188,504,719,601,727,261,369;
497,456,466,467,557,403,680,554,399,390;
377,493,269,270,678,723,708,712,665,218;
492,186,374,375,722,367,671,702,364,329;
264,498,167,165,547,694,737,593,590,99;
497,35,36,34,681,18,544,552,28,24;
380,174,272,176,355,247,570,354,175,246;
497,36,35,4,544,18,681,697,26,29;
];
boundary = [
1,0,0,0,7;
2,0,0,0,7;
3,0,0,0,7;
4,0,0,0,7;
5,0,0,0,7;
6,0,0,0,7;
7,0,0,0,7;
8,0,0,0,7;
9,0,0,0,7;
10,0,0,0,7;
11,0,0,0,7;
12,0,0,0,7;
13,0,0,0,7;
14,0,0,0,7;
15,0,0,0,7;
16,0,0,0,7;
17,0,0,0,7;
18,0,0,0,7;
19,0,0,0,7;
20,0,0,0,7;
21,0,0,0,7;
22,0,0,0,7;
23,0,0,0,7;
24,0,0,0,7;
25,0,0,0,7;
26,0,0,0,7;
27,0,0,0,7;
28,0,0,0,7;
29,0,0,0,7;
30,0,0,0,7;
31,0,0,0,7;
32,0,0,0,7;
33,0,0,0,7;
34,0,0,0,7;
35,0,0,0,7;
36,0,0,0,7;
37,0,0,0,7;
38,0,0.050000,0,7;
62,0,0.050000,0,7;
63,0,0.050000,0,7;
64,0,0.050000,0,7;
65,0,0.050000,0,7;
170,0,0.050000,0,7;
194,0,0.050000,0,7;
195,0,0.050000,0,7;
196,0,0.050000,0,7;
278,0,0.050000,0,7;
279,0,0.050000,0,7;
280,0,0.050000,0,7;
281,0,0.050000,0,7;
386,0,0.050000,0,7;
387,0,0.050000,0,7;
388,0,0.050000,0,7;
470,0,0.050000,0,7;
471,0,0.050000,0,7;
472,0,0.050000,0,7;
473,0,0.050000,0,7;
474,0,0.050000,0,7;
475,0,0.050000,0,7;
476,0,0.050000,0,7;
477,0,0.050000,0,7;
478,0,0.050000,0,7;
479,0,0.050000,0,7;
480,0,0.050000,0,7;
481,0,0.050000,0,7;
482,0,0.050000,0,7;
483,0,0.050000,0,7;
484,0,0.050000,0,7;
485,0,0.050000,0,7;
486,0,0.050000,0,7;
487,0,0.050000,0,7;
488,0,0.050000,0,7;
489,0,0.050000,0,7;
490,0,0.050000,0,7;
];
