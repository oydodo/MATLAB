clc,clear;
c=[3 8 2 10 3;8 7 2 9 7;6 4 2 7 5;8 4 2 3 5;9 10 6 9 10];
c=c(:); % convert c into column vector
a=zeros(10,25);
intcon=1:25; % address of integer variable
 for i=1:5
     a(i,(i-1)*5+1:5*i)=1; %: operator execute latest,(i-1)*5+1:5*i=(i-1)*5+1):(5*i)
     a(5+i,i:5:25)=1; %=sigma_(i)(Xij)=1,j=1,...,5 sigma_(j)(Xij)=1,j=1,...,5
 end
 b=ones(10,1);
 lb=zeros(25,1);
 ub=ones(25,1);
 x=intlinprog(c,intcon,[],[],a,b,lb,ub);
 %c'*x;
 x=reshape(x,[5,5])
% a
