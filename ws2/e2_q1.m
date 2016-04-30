clear;

figure;

load('e1_q2.mat')
plot(P_vector, V);
hold on;

load('e1_q4.mat')
plot(P_vector, V);

load('e1_q5.mat')
plot(P_vector, V);

legend('1', '1 (unstable)', '0.8 lagging', '0.8 lagging (unstable)', '0.8 leading', '0.8 leading (unstable)', 'Location', 'southeast');
xlabel('P (pu)');
ylabel('V (pu)');
title('P-V curve');
