function [ insalt ] = insalt( t,c )
%IN summary of thic function goes here
%   Detailed explanation goes here
    insalt=[4-3*c(t-1,1),3*c(t-1,1)+2*(1-cos(t*3.14/180))-2*c(t-1,2),...
            2*c(t-1,2)+2*(1-sin(t*3.14/180))-c(t-1,3)];
    
end

