y12 = (0.01 + 0.03j)^-1;
y13 = (0.02 + 0.04j)^-1;
y23 = (0.0125 + 0.025j)^-1;

Y = zeros(3);

Y(1, 1) = y12 + y13;
Y(1, 2) = -y12;
Y(1, 3) = -y13;

Y(2, 1) = -y12
Y(2, 2) = y12 + y23;
Y(2, 3) = -y23;

Y(3, 1) = -y13;
Y(3, 2) = -y23;
Y(3, 3) = y13 + y23;

G = real(Y);
B = imag(Y);
