function [ inwater ] = inwater( t )
%INWATER Summary of this function goes here
%   Detailed explanation goes here
    inwater=[4-3,3+2*(1-cos(t*3.14/180))-2,2+2*(1-sin(t*3.14/180))];

end

