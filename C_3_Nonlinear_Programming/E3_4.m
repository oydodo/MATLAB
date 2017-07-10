clc,clear
f= @(x) x(1)^3-x(2)^3+3*x(1)^2+3*x(2)^2-9*x(1);
g= @(x) -f(x);
[xy1,z1]=fminunc(f,rand(2,1))
[xy2,z2]=fminsearch(g,rand(2,1));
xy2,z2=-z2