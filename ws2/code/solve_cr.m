clear;

BETA = 0;
P_D_cr = solve_eq1(BETA);
V_2_cr = solve_eq2(P_D_cr, BETA);
fprintf('%.10f\t%f\tpf = 1\n', P_D_cr, V_2_cr);

pf = 0.8;
BETA = sqrt(1 - pf^2) / pf;
P_D_cr = solve_eq1(BETA);
V_2_cr = solve_eq2(P_D_cr, BETA);
fprintf('%.10f\t%f\tpf = 0.8 lagging\n', P_D_cr, V_2_cr);

pf = 0.8;
BETA = - sqrt(1 - pf^2) / pf;
P_D_cr = solve_eq1(BETA);
V_2_cr = solve_eq2(P_D_cr, BETA);
fprintf('%.10f\t%f\tpf = 0.8 leading\n', P_D_cr, V_2_cr);
