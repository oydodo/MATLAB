clc,clear;
a=[0.1 5 5000 4.7
   0.2 6 6000 5.6
   0.4 7 7000 6.7
   0.9 10 10000 2.3
   1.2 2 400 1.8];
[m,n]=size(a);
x2=@(interval,lb,ub,x)(1-(interval(1)-x))./(interval(1)-lb).*(x>=lb && x <interval(1))+ ...
    (x>=interval(1) && x<=interval(2))+(1-(x-interval(2)))./(ub-interval(2)).*(x>interval(2) ...
    && x<=ub); 
interval=[5,6]; lb=2; ub=12;
for j=1:n
    b(:,j)=a(:,j)/norm(a(:,j)); % sqrt(sigma(a(i,j)^2)) 
end     %vector normalization
w=[0.2 0.3 0.4 0.1]; %weight
c=b.*repmat(w,m,1); %repmat(w,m,1) replicate matrix w by m*1 times
cstar=max(c); %return maxinum of each column of c
cstar(4)=min(c(:,4)); % positive ideal point
c0=min(c);
c0(4)=max(c(:,4)); %negative ideal point
for i=1:m
    Sstar(i)=norm(c(i,:)-cstar);
    s0(i)=norm(c(i,:)-c0);
end % calc Euclidean distance from positive/negative point
Sstar,s0
f=s0./(Sstar+s0)
[sf,ind]=sort(f,'descend')
[num,best]=min(ind);
fprintf('Best plan is %d',best)

    