function [ f,df] = f1E3_14( x )
%F1E3_14 Summary of this function goes here
%   Detailed explanation goes here
    f=exp(x(1))*(4*x(1)^2+2*x(2)^2+4*x(1)*x(2)+2*x(2)+1);
    df=[exp(x(1))*(4*x(1)^2+2*x(2)^2+4*x(1)*x(2)+8*x(1)+6*x(2)+1)
        exp(x(1))*(4*x(1)+4*x(2)+2)];
end

