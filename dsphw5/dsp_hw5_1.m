clc; clear;close all;
n = 0:49;
x = [1, zeros(1,length(n)-1)];


%CLEAR VARIABLES
y_last = 0;
y_before_last=0;


%COEFICIENT
a1 =-0.8;
a2 =0.64;
b0 =0.866;
a= [1 a1 a2];


h_n = filter (b0,a,x);


figure 
stem(h_n)
grid on
title("Impulse Response");


n = 1:100;
x=ones(1,length(n));
s_n = filter (b0,a,x);

figure
plot(s_n,'o')
grid on
title ("Step Response");

h_n_fir = [h_n(1:20) zeros(1,30)];

figure 
stem(h_n_fir)
grid on
title("Impulse response H_{fir}");

s_n_fir = filter(h_n_fir,1,x)

figure
plot(s_n_fir,'o')
grid on
title ("Step response S_{fir}");

figure
plot(n,s_n,n,s_n_fir,'o')

legend('Step Reponse','Step Response_{fir}');


figure
plot (n,h_n,n,h_n_fir);

