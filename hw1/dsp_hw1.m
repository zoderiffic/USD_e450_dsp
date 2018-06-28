clc;clear;close all;
 
 
%%Constants
 
fs = 1;  
cont_time = 0:1/1000:8;
disc_time = 0:1/fs:8; %based on the sample rate;
f1 = 1/8;
f2 = -7/8;
 
 
%%signals
sig1_cont  = sin(2*pi*f1*cont_time);
sig2_cont  = sin(2*pi*f2*cont_time);
sig1_disc  = sin(2*pi*f1*disc_time);
sig2_disc  = sin(2*pi*f2*disc_time);
samp_hold1 = sin(2*pi*f1*floor(cont_time));
samp_hold2 = sin(2*pi*f2*floor(cont_time));

 
 
error_1 = samp_hold1 - sig1_cont;
error_2 = samp_hold2 - sig2_cont;
error_rate1 = mean(abs(error_1))
error_rate2 = mean(abs(error_2))
 
 
 
%%Plotting 
figure (1)
plot (cont_time, sig1_cont)
hold on;
plot (cont_time, sig2_cont)
hold on;
plot (disc_time, sig1_disc,'gd');
hold on;
plot (disc_time, sig2_disc,'c*');
legend('1/8 Hz continuous','9/8 Hz continuous','1/8 Hz discrete', '9/8 Hz discrete');
 
title ('DSP Assignment #1.1');
xlabel ('Time(s)');
 
figure (2);
plot (cont_time, sig1_cont);
hold on;
plot (cont_time,samp_hold1);
legend ('1/8 Hz continuous','Sample and hold');
ylim ([-1.1 1.1]);
xlim ([0 8.1]);
xlabel ('Time(s)');
title ('DSP Assignment #1.2');
 
 
figure (3);
subplot (2,1,1);
plot (cont_time, sig1_cont);
hold on;
plot (cont_time,samp_hold1);
hold on;
plot (cont_time,error_1,'g--');
 
ylim ([-1.1 1.1]);
xlim ([0 8.1]);
legend ('1/8 Hz continuous','Sample and hold','Error');
xlabel ('Time(s)');
title ('DSP Assignment #1.3a');
 
 
subplot (2,1,2);
plot (cont_time, sig2_cont);
hold on;
plot (cont_time,samp_hold2);
hold on;
plot (cont_time,error_2,'g--');
%ylim ([-1.1 1.1]);
xlim ([0 8.1]);
legend ('-7/8 Hz continuous','Sample and hold','Error');
xlabel ('Time(s)');
title ('DSP Assignment #1.3b');
 
