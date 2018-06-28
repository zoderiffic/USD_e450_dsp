clear; close all;

load quiz4.mat


fs= 1;

%Emil's signal is #3

input_signal = signal(3,:);


n=40
auto_1 = xcorr(input_signal,n)/8000;

stem (auto_1)

[vals loc]=findpeaks(auto_1,'MinPeakwidth',9);


avg_between_peaks= loc(1,[1:length(loc)-1])-loc(1,[2:length(loc)])