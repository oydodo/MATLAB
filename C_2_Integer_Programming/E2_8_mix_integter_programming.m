%p18 example 2.8
clc,clear;
f=[-3;-2;-1];
intcon=3; % adress of integer variable
A=[1 1 1];
b=7;
Aeq=[4 2 1];
beq=12;
lb=zeros(3,1);
ub=[inf;inf;1];
x=intlinprog(f,intcon,A,b,Aeq,beq,lb,ub)