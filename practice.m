clear all
clc

%time parameter
fs = 1000;
t = linspace(0 , 1, 1000);

%message signal parameter
fm = 10;
am = 1;
message_signal = am * sin(2 * pi * fm.*t);

%carrier signal parameter
fc = 100;
ac = 2;
carrier_signal = ac * sin(2 * pi * fc.* t);

%perform amplitude modulation 
modulated_signal = (1 + message_signal) .* carrier_signal;

%% plotting
figure 
subplot(3 , 1 , 1)
plot(t , message_signal)
title('message_signal')
xlabel('Time(s)')
ylabel('Amplitude')
grid on

subplot(3 , 1 , 2)
plot(t , carrier_signal)
title('Carrier signal')
xlabel('Time(s)')
ylabel('Amplitude')
grid on

subplot(3 ,1, 3)
plot(t , modulated_signal)
title('Modulated signal')
xlabel('Time(s)')
ylabel('Amplitude')
grid on
%Demodulation
rectified_signal = abs(modulated_signal);
%% ploting
figure;
subplot(2 , 1 ,1)
plot(t , modulated_signal);
title('Modulated Signal')
xlabel('time(S)');
ylabel('Amplitude')
grid on

subplot(2 , 1, 2);
plot(t , rectified_signal)
title('Rectified Signal')
xlabel('Time(s)');
ylabel('Amplitude');
grid on

%low pass filter parameters
cutoff_freq = 20;
numtaps = 20;
normalized_cuttoff_freq = cutoff_freq / (fs / 2);
fir_coeff= fir1(numtaps-1, normalized_cuttoff_freq, "low");
filetered_signal = filter(fir_coeff, 1, rectified_signal);

%% ploting
figure;
subplot(2 , 1 , 1);
plot(t , rectified_signal);
title('Rectified Signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;

subplot(2 , 1, 2);
plot(t , filetered_signal);
title('Filtered Signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on





















