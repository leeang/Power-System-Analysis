syms V_3 delta_2 delta_3;

eqn1 = '1.5 = 17.22 + 32.76 * delta_2 - 16.64 * V_3 + 33.28 * V_3 * (delta_2 - delta_3)';
eqn2 = '-4 = -27.14 * V_3 + 21 * V_3 * delta_3 + 33.28 * V_3 * (delta_3 - delta_2) + 26 * V_3^2';
eqn3 = '-2.5 = -10.5 * V_3 * delta_3 - 54.28 * V_3 - 16.64 * V_3 * (delta_3 - delta_2) + 52 * V_3^2';

[V_3, delta_2, delta_3] = solve(eqn1, eqn2, eqn3);

V_3 = double(V_3);
delta_2 = double(delta_2);
delta_3 = double(delta_3);

delta_2 = rad2deg(delta_2);
delta_3 = rad2deg(delta_3);

fprintf('V_3:\t\t%f\t%f\n', V_3);
fprintf('delta_2:\t%f\t%f\n', delta_2);
fprintf('delta_3:\t%f\t%f\n', delta_3);
