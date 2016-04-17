VA_b = 100E6;
V_b = 15E3;

I_b = VA_b / V_b;
Z_b = V_b / I_b;

frequency = 50;

R12 = 0.01 * Z_b;
L12 = 0.03 * Z_b / (2 * pi * frequency);

R13 = 0.02 * Z_b;
L13 = 0.04 * Z_b / (2 * pi * frequency);

R23 = 0.0125 * Z_b;
L23 = 0.025 * Z_b / (2 * pi * frequency);

disp '=== Line 12 ===';
fprintf('[%e %e]\n', R12, L12);
fprintf('[%e %e]\n', R12*2, L12*2);

disp '=== Line 13 ===';
fprintf('[%e %e]\n', R13, R13*2);
fprintf('[%e %e]\n', L13, L13*2);

disp '=== Line 23 ===';
fprintf('[%e %e]\n', R23, R23*2);
fprintf('[%e %e]\n', L23, L23*2);
