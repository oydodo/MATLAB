function [f,g] = fE3_5(x)
%FE3_5 Summary of this function goes here
%   Detailed explanation goes here
    f=100*(x(2)-x(1)^2)^2+(1-x(1))^2;
    g=[-400*x(1)*(x(2)-x(1)^2)-2*(1-x(1));
       200*(x(2)-x(1)^2)];
end

