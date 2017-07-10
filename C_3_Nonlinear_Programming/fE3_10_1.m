function [g] = fE3_10_1(x)
%FE3_10_1 Summary of this function goes here
%   Detailed explanation goes here
    M=50000;
    f=x(1)^2+x(2)^2+8;
    g=f-M*min(x(1),0)-M*min(x(2),0)-M*min(x(1)^2-x(2),0)+M*abs(-x(1)-x(2)^2+2);
end

