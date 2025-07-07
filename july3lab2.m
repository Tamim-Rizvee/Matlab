fs = 1000;
t = linspace(0 , 1 , 1000);

fm = 10;
am = 1;
message_signal = am * sin(2 * pi * fm .* t);

fc = 100;
ac = 2;
carrier_signal = ac * sin(2 * pi * fc .*t);

%frequency deviated constant
kf = 25;

%perform frequency modulation
modulated_signal = ac * sin(2 * pi * fc .* t + kf * message_signal);

%% plotting
figure;
subplot(4 , 1 ,1);
plot(t , message_signal);
title('Carrier Siganl');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;
%

subplot(4 , 1 ,2);
plot(t , carrier_signal);
title('Carrier Siganl');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;
%

subplot(4 , 1 ,3);
plot(t , modulated_signal);
title('Modulated Siganl');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;
%

demodulated_signal = [diff(modulated_signal) 0] * fs;
rectified_signal = abs(demodulated_signal);

figure;

subplot(2 , 1, 1);
plot(t , demodulated_signal);
title('Demodulated Siganl');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;

%
subplot(2 , 1, 2);
plot(t , rectified_signal);
title('Rectified Siganl');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;
%

%% filtering
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





























