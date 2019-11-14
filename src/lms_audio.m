
clc;

W = [0 -0.1];
b = 0;
alpha = 0.12;


ERROR_MAX = 0.0001;

epoch = 1;
k = 1;
e = 1;

info = audioinfo('NN.m4a');
[y,Fs] = audioread('NN.m4a');
NBR_EPOCH =236544 

%Plotting variables
original = y(1)
output = [0];
error = [0];
noise = [0];
contaminated = [0];
x = [0];
W1 = W(1);
W2 = W(2);

% while (abs(e) > ERROR_MAX && epoch < NBR_EPOCH)
while (k < NBR_EPOCH)
  
    s = y(k);
    p = [v_signal(k); v_signal(k-1)];
    t = m_signal(k) + s;
            
    a = W * p;
    e = m_signal(k) - a;

    W = W + 2 * alpha * e * p';

    k = k + 1
    
    
    %Plotting variables

    original(epoch) = s;
    error(epoch) = e;
    output(epoch) = t - a;
    noise(epoch) = m_signal(k-1);
    contaminated(epoch) = t;
    x(epoch) = k;
    W1(epoch) = W(1);
    W2(epoch) = W(2);
    x(epoch) = epoch;
    epoch = epoch + 1;


       

end

% figure()
% t = 0:seconds(1/Fs):seconds(info.Duration);
% t = t(1:end-9);
% plot(t,y) 
% xlabel('Time')
% ylabel('Audio Signal')
figure('Name', 'Original', 'NumberTitle', 'off')
plot(x, original)
figure('Name', 'Noise', 'NumberTitle', 'off')
plot(x, noise)
figure('Name', 'Original and Noise', 'NumberTitle', 'off')
plot(x, original+noise)
figure('Name', 'Restored Signal', 'NumberTitle', 'off')
plot(x, output)

sound(original,Fs)
pause(6)
sound(noise,Fs)
pause(6)
sound(original+noise,Fs)
pause(6)
sound(output,Fs)


function v = v_signal(k)
    v = 1.2 * sin(2*pi*k / 3);
end

function m = m_signal(k)
     m = 0.12 * sin(2*pi*k/3 + 3*pi/2);
end


