clear;

P_D = 0.1;
lambda = 4;

BETA = 0;
V_2 = solve_eq3(P_D*lambda, BETA);
fprintf('%f\tpf = 1\n', max(V_2));

pf = 0.8;
BETA = sqrt(1 - pf^2) / pf;
V_2 = solve_eq3(P_D*lambda*pf, BETA);
fprintf('%f\tpf = 0.8 lagging\n', max(V_2));

pf = 0.8;
BETA = -sqrt(1 - pf^2) / pf;
V_2 = solve_eq3(P_D*lambda*pf, BETA);
fprintf('%f\tpf = 0.8 leading\n', max(V_2));
