clc;clear;close all

x=ones(1,7);
h=2*(ones(1,4));
y = filter(h,1,x)

x=[zeros(1,2) x zeros(1,8)]
y = filter(h,1,x)
