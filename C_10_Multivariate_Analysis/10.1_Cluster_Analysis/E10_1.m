clc,clear;
a = [1,0;1,1;3,2;4,3;2,5];
[m,n] = size(a);
d = zeros(m);
d = mandist(a'); % madist calc Manhattan distance between every pair of column vectors
d = tril(d); % Lower triangular of D
nd = nonzeros(d);
nd = union([],nd);
for i = 1:m-1
    nd_min = min(nd);
    [ row , col ] = find( d == nd_min ); tm = union( row , col );
    tm = reshape( tm,1,length(tm) );
    fprintf('the %dth times clustering, clustering result is:%s when the height is %d\n', ...
        i,int2str(tm),nd_min );
    nd( nd == nd_min ) = [] ;
    if length(nd) == 0
        break
    end
end

     
    