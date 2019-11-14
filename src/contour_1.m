clc;

R = [0.72 -0.36; -0.36 0.72]
A = 2*R
[l,u] = eig(A)
R_1 = inv(R)
h = [0; -0.0624]

min = R_1 * h

x1 = linspace(-2,2);
x2 = x1';

f = 0.72 * (x1.^2 + x2.^2 - x1 .* x2) + 0.1248 .* x2 + 0.0205;
contour(x1,x2,f)
grid on

