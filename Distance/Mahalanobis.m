function [ dis ] = Mahalanobis( x,y,Z )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    if size(x,1) == 1 
        x = x';
    end
    
    if size(y,1) == 1 
        y = y';
    end
    
    co_mat = cov(Z);
    dis = sqrt( (x - y)' * co_mat^(-1) * (x - y) );
end

