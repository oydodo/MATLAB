clc,clear;
% coe=[1 -1 2 -3]; %polunomial is defined by its coefficients;
% x0=roots(coe)

% symbolic solve

syms x;
x0=solve(x^3-x^2+2*x-3);
x0=vpa(x0,5) %convert into decimal
