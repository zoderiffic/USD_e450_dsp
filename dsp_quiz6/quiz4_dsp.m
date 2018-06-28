clear; close all;clc

load quiz4.mat


fs= 1;

%Emil's signal is #3

input_signal = signal(3,:);




plot(input_signal)

fft_signal = fft(input_signal);

signal_power = abs(fft_signal/length(fft_signal));
ss_power = signal_power(1:length(signal_power)/2+1); %Single sided power 

freq_vector = fs*(0:length(signal_power)/2);


[~,I] = max(ss_power);

fprintf('Maximum occurs at %d Hz.\n',freq_vector(I));



plot (freq_vector, ss_power)

fir_filt = fir1(50,0.6);


filtered_signal= filter(fir_filt,1,input_signal);

plot(input_signal)
hold on
plot(filtered_signal)

legend ('Input signal', 'Filtered signal')
hold off

figure
periodogram(input_signal)





n = 100;                    % Filter order
f = [0 0.01  0.3 1];         % Frequency band edges
a = [0  1  0 0];           % Amplitudes
b = firpm(n,f,a);
bb = firls(n,f,a);


fvtool(b,1,bb,1)


% close all; 
% 
% filtered_sig= filter(b,1,input_signal);
% 
% figure 
% 
% plot(input_signal);
% plot(filtered_signal);
% 
% 
% 
