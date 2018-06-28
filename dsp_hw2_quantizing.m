%% Signal set up

clc;clear;close all;

%Constants

amp         = 1 ; %amplitude
fm          = 1/8; %message frequency
time_start  = 0;
time_end    = 12;
fs          = 1000;% Sampling frequency Hz
time        = time_start:1/fs:time_end;
bits_to_use= 6:8; %
bits        =   bits_to_use(1:1:length(bits_to_use));time_start  = 0;

type        = 2;    %Quantization method floor = 1, round =2, ceiling = 3;

%Create a signal
sig_cont     = sin(2*pi*time*fm);


%Allocate memory for error and SQNR arrays;
error        = zeros(length(bits),length(sig_cont));
SQNR         = zeros(1,length(bits));


%% Plotting multiple levels of quantization
for index = 1:length(bits);
    L= 2^(bits(index));

[sig_q,SQNR(index)] = quant(sig_cont,L,type);
error(index,:)        = sig_cont-sig_q;
%if a value is within range of 
min_err = min(error(1,:));
max_err = max(error(1,:));

%Original Signal
time_start  = 0;
figure(1)
subplot (3,3,index +(index-1)*2)
plot (time,sig_cont);
title (['Original Signal']);
xlabel ('Time(s)')
ylim ([(-amp-amp/10) (amp+amp/10)]);

%Quantization Signal
subplot (3,3,index + 1+ (index-1)*2)
plot (time,sig_q,'--r')
title (['Quatizaiton with ', num2str(L), ' levels']);
xlabel ('Time(s)')
ylim ([(-amp-amp/10) (amp+amp/10)]);

%Error values
subplot (3,3,index+2+(index-1)*2)
plot (time,error(index,:),'black')
title (['Error rate using ', num2str(L), ' levels']);
xlabel ('Time(s)')
ylim ( [ (min_err - min_err/10) (max_err + max_err/10)])

end
% 

%% SQNR Comparison
for index = 1:length(bits)
    L=2^(bits(index));
    [sig_q, SQNR(index)]= quant(sig_cont,L,type);
end;
SQNR_theory = 1.76+6.02*(bits)
SQNR
figure
plot (bits+1,SQNR_theory,'--',bits+1,SQNR,'*');
title ('SQNR Theoretical vs Caclulated ')
ylabel ('SQNR(db)');
xlabel ('Bits used');
legend ('Theory','Calculated');


%% SQNR
SQNR



%% END 



