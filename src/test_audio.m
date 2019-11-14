info = audioinfo('NN.m4a')

[y,Fs] = audioread('NN.m4a');


% sound(y,Fs)

t = 0:seconds(1/Fs):seconds(info.Duration);
t = t(1:end-9);

size(y)
size(t)

plot(t,y)
xlabel('Time')
ylabel('Audio Signal')

