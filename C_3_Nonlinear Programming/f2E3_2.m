
function [g,h] = f2E3_2(x)
%F2E3_2 Summary of this function goes here
%   Detailed explanation goes here
    g=[-x(1)^2+x(2)-x(3)^2;
       x(1)+x(2)^2+x(3)^3-20];
    h=[-x(1)-x(2)^2+2;
       x(2)+2*x(3)^2-3];
end

