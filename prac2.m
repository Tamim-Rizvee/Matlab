clear all;
clc;

fs = 1000;
time = linspace(0 , 1 , fs);

fm = 10;
am = 1;
message_signal = am * sin(2 * pi * fm .* time);

fc = 100;
ac = 2;
carrier_signal = ac * sin(2 * pi * fc .* time );

kf = 25;
modulated_signal = ac * sin(2 * pi * fc .* time + kf * message_signal);

%% ploting
figure;
subplot(3 , 1 , 1);
plot(time , message_signal);
title('Message Signal');
xlabel('Time(s)');
ylabel('Amplitude');

subplot(3 , 1 , 2);
plot(time , carrier_signal);
title('Carrier Signal');
xlabel('Time(s)');
ylabel('Amplitude');

subplot(3 , 1 , 3);
plot(time , modulated_signal);
title('Modulated Signal');
xlabel('Time(s)');
ylabel('Amplitude');


%% 
rectified_signal = [diff(modulated_signal) 0] * fs;
%rectified_signal = abs(demodulated_signal);
figure;
subplot(2 , 1 , 1);
plot(time , modulated_signal);
title('Demodulated Signal');
xlabel('Time(s)');
ylabel('Amplitude');

subplot(2 , 1 , 2);
plot(time , rectified_signal);
title('Rectified Signal');
xlabel('Time(s)');
ylabel('Amplitude');

cutoff_freq = 20;
numtaps = 20;
normalized_cutoff_freq = cutoff_freq / (fs / 2);
fir_coeff = fir1(numtaps-1 , normalized_cutoff_freq , "low");
filtered_signal = filter(fir_coeff , 1 , rectified_signal);

%%
figure;
subplot(2 , 1 , 1);
plot(time , rectified_signal);
title('Rectified Signal');
xlabel('Time(s)');
ylabel('Amplitude');

subplot(2 , 1 , 2);
plot(time , filtered_signal);
title('Filtered Signal');
xlabel('Time(s)');
ylabel('Amplitude');














