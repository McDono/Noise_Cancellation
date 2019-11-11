clc;

W = [0 2];
b = 0;
alpha = 0.12;
NBR_EPOCH = 100;
ERROR_MAX = 0.0001;

epoch = 1;
k = 0;
e = 1;

original = [v_signal(0)];
output = [0];
error = [0]
x = [0];

while (abs(e) > ERROR_MAX && epoch < NBR_EPOCH)
% while (epoch < NBR_EPOCH)
  
    s = 4*rand()-2
    p = [v_signal(k-1); v_signal(k)]
    t = m_signal(k) + s
            

    a = W * p
    e =  m_signal(k) - a

    W = W + 2 * alpha * e * p'

    k = k + 1
    epoch = epoch + 1
    original(epoch) = s;
    error(epoch) = e;
    x(epoch) = k;
    output(epoch) = t - e;

end


figure
plot(x, original, x, error, x, output)


