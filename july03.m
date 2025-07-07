f = 10;
fs = 2000;
TimeAxis = 0 : 1/ fs : 1;
signal = sin(2 * pi * f * TimeAxis);
plot(TimeAxis , signal);
xlabel('Time in sec');
ylabel('Amplitude of the signal');
title('Analog signal in sine form');
grid on;