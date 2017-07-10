function [ c,ceq,dc,dceq ] = f2E3_14( x )
%F2E3_14 Summary of this function goes here
%   Detailed explanation goes here
    c=[x(1)*x(2)-x(1)-x(2)+1.5;-x(1)*x(2)-10];
    dc=[x(2)-1,-x(2);x(1)-1,-x(1)];
    ceq=[];dceq=[];
end

