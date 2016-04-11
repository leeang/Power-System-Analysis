clear;

y12 = (0.01 + 0.03j)^-1;
y13 = (0.02 + 0.04j)^-1;
y23 = (0.0125 + 0.025j)^-1;

Y = zeros(3);

Y(1, 1) = y12 + y13;
Y(1, 2) = -y12;
Y(1, 3) = -y13;

Y(2, 1) = -y12;
Y(2, 2) = y12 + y23;
Y(2, 3) = -y23;

Y(3, 1) = -y13;
Y(3, 2) = -y23;
Y(3, 3) = y13 + y23;

G = real(Y);
B = imag(Y);

P_G2 = 2;
P_D2 = 0.5;
P_2 = P_G2 - P_D2;

P_D3 = 4;
P_3 = -P_D3;

Q_D3 = 2.5;
Q_3 = -Q_D3;

V(1) = 1.05;
delta(1) = 0;

V(2) = 1.04;

S_D1 = 0.8 + 0.3j;
S_D2 = 0.5 + 0.25j;
S_D3 = 4 + 2.5j;

%% Initial guess
V(3) = 1;
delta(2) = 0;
delta(3) = 0;
