clc,clear;
c=[4 2 3 4;
   6 4 5 5;
   7 6 7 6;
   7 8 8 6;
   7 9 8 6;
   7 10 8 6];
c=c';
c=c(:);
x=zeros(24,1);
intcon=1:24;
b=ones(6,1);
A=zeros(6,24);
for i=1:6
    A(i,(i-1)*4+1:4*i)=1;
end
lb=zeros(24,1);
ub=ones(24,1);
 x=intlinprog(-c,intcon,A,b,[],[],lb,ub);
 x=reshape(x,[6,4])
    