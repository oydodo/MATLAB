function [ c,ceq,k1,k2,s ] = f2E3_12( x,s )
%F2E3_12 Summary of this function goes here
%   Detailed explanation goes here
    c=[];ceq=[];
    if isnan(s(1,1))
        s=[0.2,0;0.2,0];
    end
%sample
    w1=1:s(1,1):100;
    w2=1:s(2,1):100;
%semi-infinite constraint
    k1=sin(w1*x(1)).*cos(w1*x(2))-1/1000*(w1-50).^2-sin(w1*x(3))-x(3)-1;
    k2=sin(w2*x(2)).*cos(w2*x(1))-1/1000*(w2-50).^2-sin(w2*x(3))-x(3)-1;
%plot
    plot(w1,k1,'-',w2,k2,'+');
end

