clc,clear
c=1:4; c=[c,c]';
a=[1,-1 -1 1;1 -1 1 -3;1 -1 -2 3];
a=[a,-a];
b=[-2 -1 -1/2]';
[y,z]=linprog(c,a,b,[],[],zeros(8,1))
x=y(1:4)-y(5:end)