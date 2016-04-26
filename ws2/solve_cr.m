BETA = 0;
P_D_cr = solve_eq1(BETA);
fprintf('pf = 0\t\t\t%.10f\n', P_D_cr);

pf = 0.8;
BETA = sqrt(1 - pf^2) / pf;
P_D_cr = solve_eq1(BETA);
fprintf('pf = 0.8 lagging\t%.10f\n', P_D_cr);

pf = 0.8;
BETA = - sqrt(1 - pf^2) / pf;
P_D_cr = solve_eq1(BETA);
fprintf('pf = 0.8 leading\t%.10f\n', P_D_cr);
