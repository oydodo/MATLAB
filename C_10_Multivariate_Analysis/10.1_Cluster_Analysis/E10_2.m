clc,clear;
a = textread('E10_2_input.txt');
d = 1-abs(a);
d = tril(d);
b = nonzeros(d);
b = b';
z = linkeage(b,'complete');
y = cluster(z,'maxclust',2)
ind1 = find( y == 1); ind1 = ind1'
ind2 = find( y == 2); ind2 = ind2'
h = dendrogram(z); % draw pic
set(h,'Color','k','LineWidth',1.3);
