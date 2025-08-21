clear all;
clc;
close all;

fs = 10000;
fm = 100;
time = linspace(0 , 1000/fs , 1001);
x = 5*sin(2 * pi * 100 .* time);
plot(time , x);
hold on;

y = [0];
xr = 0;
del = .4;
for i = 1 : length(x) - 1
    if xr(i) <= x(i)
        d = 1;
        xr(i+ 1) = xr(i) + del;
    else 
        d = 0;
        xr(i + 1) = xr(i) - del;
    end
    y = [y d];
end

stairs(time , xr);
title('Staircase Approximated signal');
hold off;



MSE = sum((x - xr) .^ 2) / length(x);
disp(['MSE : ' , num2str(MSE)]);


%% 
figure;
subplot(3 , 1 , 1);
plot(time , y);
title('Delta modulated signal');

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


subplot(3 , 1 , 2);
plot(time , y_demod);
title('Delta modulated signal before filtering');

filter_order = 20;
f_coeff = fir1(filter_order , fm/(fs/2), 'low');
filtered_signal = filter(f_coeff , 1 , y_demod);

subplot(3 ,1, 3);
plot(time , filtered_signal);
title('Filterted demodulated signal');









