clc;

R = [0.72 -0.36; -0.36 0.72]
A = 2*R
[l,u] = eig(A)
R_1 = inv(R)
h = [0 ; -0.0624]
min = R_1 * h
c = 0.0205

x1 = linspace(-2,2);
% x1 = [0 1 2 3];
x2 = x1';

x = [x1; x2']
y1 = 1;
y2 = 2;
y = [y1; y2]
x' * R * x
f = x' * R * x - 2 * x'*h ; 
contour(x1,x2,f)
grid on

% -----------------TEST ZONE----------------
rand()