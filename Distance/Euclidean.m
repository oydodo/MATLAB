function [ dis ] = Euclidean( X,Y )
%EUCLIDEAN distance between two vectors X,Y
    dis = sqrt( sum( (X - Y).^2 ) );
end

