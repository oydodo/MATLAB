clc,clear;
h=2*[2,-2;-2,4]; 
f=[-6;-3];
A=[1,1;4,1];
b=[3,9];
lb=zeros(2,1);
[x,value]=quadprog(h,f,A,b,[],[],lb)