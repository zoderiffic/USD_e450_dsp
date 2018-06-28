Fs = 8000
 
N = 65536
L=512
 
el = 0:L-1;
 
w_n = 0:2*pi/N:pi-2*pi/N;
f_n = 0:Fs/N:Fs/2 -(Fs/N);
 
f_1 = 35;
f_2 = 200;
f_3 = 500;
 
w_1 = f_1 / Fs * 2 * pi;
w_2 = f_2 / Fs * 2 * pi;
w_3 = f_3 / Fs * 2 * pi;
 
a_0_dB = 20;
a_1_dB = 0;
a_2_dB = -40;
a_3_dB = -60;
 
a_0 = 10^(a_0_dB/20);
a_1 = 10^(a_1_dB/20);
a_2 = 10^(a_2_dB/20);
a_3 = 10^(a_3_dB/20);
 
 
x = a_0 + a_1 * cos(w_1 .* el) + a_2 * cos(w_2 .* el) + a_3 * cos(w_3 .* el);

x_not_dc = x-mean(x);
ham_1 = hamming(L);
hann_1 = hann(L);
rect = rectwin(L);

y_1 = 




