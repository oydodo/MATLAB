clc,clear;
a = [ 1,0; 1,1; 3,2; 4,3; 2,5];
y = pdist(a,'cityblock')
yc = squareform(y)
z = linkage(y)
dendrogram(z)
T = cluster(z,'maxclust',3)
for i = 1:3
    tm = find(T == i)
    tm = reshape( tm,1,length(tm) );
    fprintf( '%s are in %dth cluster\n',int2str(tm),i );
end