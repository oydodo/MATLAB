function [ dis ] = Minkowski( X,Y,q )
%MINKOWSKI distance between two vectors X,Y
    dis = (sum(abs((X - Y).^q))).^(1/q);
end

