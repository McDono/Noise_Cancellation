clc;


total=0;
s = 0;
for k = 1:3
    s = 1.2 * sin(2*pi*k/3 + 3*pi/2) * 1.2 * sin(2*pi*(k-1) / 3)
    m = 1.2 * sin(2*pi*k/3 - pi/2) * 1.2 * sin(2*pi*(k-1) / 3)
    total = total + s
end

total = total/3

