clc;
clear all;
close all;

bitstream = load('input.txt');
%step basic parameters
fc = input('Enter Frequency: ');
tb = 1;
fs = 100;
t = 0 : 1/fs : tb-(1/fs);
A = 5;
ASK = [];
PSK = [];
FSK = [];

%implementation
for i = 1:length(bitstream)
    if bitstream(i) == 1
        ask =2* A * cos(2*pi*fc*t);
        fsk = A * cos(2 *pi*3*fc*t);
        psk = A * cos(2 * pi * fc * t);
    else 
        ask = .5 * A * cos(2 * pi * fc * t);
        psk = A * cos(2 * pi * fc * t + pi);
        fsk = A * cos(2 * pi * fc/2 * t );
    end
    ASK = [ASK ask];
    PSK = [PSK psk];
    FSK = [FSK fsk];
end

figure;
subplot(3 , 1 , 1);
plot(ASK , 'color' , 'magenta');
title("ASK");
grid on;

subplot(3 , 1 , 2)
plot(PSK , color = 'cyan');
title("PSK");
grid on;

subplot(3 , 1 , 3)
plot(FSK , color = 'green');
title("FSK");
grid on;






