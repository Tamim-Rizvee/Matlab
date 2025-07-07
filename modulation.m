clear all;
clc;
% Time Parameters 
fs = 1000;                   %sampling frequency
t = linspace(0 , 1 , 1000); %

%Message signal parameteres
fm = 10;
Am = 1;
message_signal = Am * sin(2 * pi * fm.* t);


%carrier signal parameters
fc = 100;
Ac = 2;
carrier_signal = Ac * sin(2 * pi * fc.* t);

modulated_signal = (1 + message_signal) .* carrier_signal;

%% ploting
figure;
subplot(3 ,1, 1);
plot(t , message_signal);
title('Message Signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;
%
subplot(3 , 1 ,2);
plot(t , carrier_signal);
title('Carrier Siganl');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;
%
subplot(3 , 1 , 3);
plot(t , modulated_signal);
title('Modulated Signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;
%
%% Demodulation
%%Rectification process
rectified_signal = abs(modulated_signal);
%%ploting
figure;
subplot(2 , 1 ,1);
plot(t , modulated_signal);
title('Modulated signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;
%
subplot(2 , 1 ,2);
plot(t , rectified_signal);
title('Rectified Siganl');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;
%
%low pass signal parameter 
cutoff_freq = 20 ;%hz
%FIR filter design using window method
numtaps = 20; %number of taps in the FIR filter, a simple choice 
normalized_cutoff_freq = cutoff_freq / (fs/ 2);
fir_coeff = fir1(numtaps - 1, normalized_cutoff_freq, 'low');
filtered_signal = filter(fir_coeff , 1 , rectified_signal);

figure;
%subplot(2 , 1 ,2);
plot(t , filtered_signal);
title('Filtered Siganl');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;
%








