clc;

W = [0 2];
b = 0;
alpha = 0.12;

NBR_EPOCH = 100;
ERROR_MAX = 0.0001;

epoch = 1;
k = 0;
e = 1;

%Plotting variables
original = [v_signal(0)];
output = [0];
error = [0]
x = [0];
W1 = [0];
W2 = [2];

% while (abs(e) > ERROR_MAX && epoch < NBR_EPOCH)
while (epoch < NBR_EPOCH)
  
    s = 4*rand()-2
    p = [v_signal(k-1); v_signal(k)]
    t = m_signal(k) + s
            

    a = W * p
    e =  m_signal(k) - a

    W = W + 2 * alpha * e * p'

    k = k + 1
    epoch = epoch + 1
    
    %Plotting variables
    original(epoch) = s;
    error(epoch) = e;
    output(epoch) = t - e;
    x(epoch) = k;
    W1(k) = W(1);
    W2(k) = W(2);

end


figure
% plot(x, original, x, error, x, output)
plot(x, error)
figure
plot(x, original, x, output)

x1 = linspace(-2,2);
x2 = x1';
f = 0.72 * (x1.^2 + x2.^2 - x1 .* x2) + 0.1248 .* x2 + 0.0205;
figure
contour(x1,x2,f)
hold on
plot(W1, W2)
hold off
grid on



function v = v_signal(k)
    v = 1.2 * sin(2*pi*k / 3);
end

function m = m_signal(k)
    m = 0.12 * sin(2*pi*k / 3 + pi/2);
end


