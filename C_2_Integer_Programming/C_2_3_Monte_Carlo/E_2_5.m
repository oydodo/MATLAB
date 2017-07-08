clc,clear;
x=unifrnd(0,12,[1,10000000]);
y=unifrnd(0,9,[1,10000000]);
f=sum(y<x.^2 & x<=3)+sum(y<12-x & x>=3)
area_appr=12*9*f/10^7