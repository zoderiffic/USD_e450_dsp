clc;clear;close all

amp = 1;
fs = 1000;
fm = 1;
t = 0:1/fs:5;

sig = sin(2*pi*fm*t);

plot(sig)
hold on;
acc=xcorr(sig,5000)/2500;
plot(acc)


mean_zeros= mean(acc==0);
wanted_freq = mean_zeros*5000*2

