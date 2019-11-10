clc;

W = [0 2];
b = 0;
alpha = 0.1;
NBR_EPOCH = 100;
ERROR_MAX = 0.0001;
error = 1;
epoch = 1;
k = 0;
e = 1;

original = [v_signal(0)];
output = [0];
x = [0];

while (abs(e) > ERROR_MAX && k < NBR_EPOCH)
% while (k < NBR_EPOCH)
  
    p = [v_signal(k); v_signal(k-1)]
    t = m_signal(k) + unifpdf(k, -2, 2)
            

    a = W * p
    e = t - a

    W = W + 2 * alpha * e * p'

    k = k + 1
    original(k) = v_signal(k);
    output(k) = e;
    x(k) = k;

end


figure
plot(x, original, x, output)


