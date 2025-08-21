clear all;
close all;
clc;

fs = 10000;
time = linspace(0 , 1000/fs , 1001);

fm = 100;
am = 2;
x = am * sin(2 * pi * fm .* time);

figure;
plot(time , x);
hold on;

del = 0.4;
y = [0];
xr = 0;
for i = 1 : length(x) -1
    if xr(i) <= x(i)
        d = 1;
        xr(i + 1) = xr(i) + del;
    else
        d = 0;
        xr(i + 1) = xr(i) - del;
    end
    y = [y d];
end

stairs(time , xr);
title('Stair case approximate signal');
hold off;


MSE = sum((x - xr) .^2) / length(x);
disp(['MSE = ' , num2str(MSE)]);


figure;
subplot(3 , 1, 1);
plot(time , y);
title('delta modulated signal');

y_demod = [0];
xr_demod = 0;

for i = 2 : length(y)
    if y(i) == 1
        xr_demod = xr_demod + del;
    else 
        xr_demod = xr_demod - del;

    end

    y_demod = [y_demod xr_demod];
end

numsteps = 20;
f_coeff = fir1(numsteps , fm / (fs / 2) , "low");
filter_signal = filter(f_coeff , 1, y_demod);




subplot(3 , 1, 2);
plot(time , y_demod);
title('Message_signal');



subplot(3 , 1, 3);
plot(time , filter_signal);
title('Message_signal');
















