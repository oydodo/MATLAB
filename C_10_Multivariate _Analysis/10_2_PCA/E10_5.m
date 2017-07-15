%% initialization
clc,clear;
load sn.txt; %load data
[m,n]=size(sn);
x0=sn(:,[1:n-1]); y0=sn(:,n); % separate x,y
%% calc least squares regression coefficient
hg1=[ones(m,1),x0]\y0;
hg1=hg1';
fprintf('y=%f',hg1(1));
for i=2:n
    if hg1(i)>0
        fprintf(' +%f*x%d ',hg1(i),i-1);
    else
        fprintf(' %f*x%d ',hg1(i),i-1);
    end
end
fprintf('\n');

%% pca regression
r=corrcoef(x0); % coralation_coeffcient_matrix
xd=zscore(x0); 
yd=zscore(y0); % standardlize
[vec1,lamda,rate]=pcacov(r); 
% vec1 - eignvectors
% lamda - eignvalues
% rate - Contribution rate
f=repmat(sign(sum(vec1)),size(vec1,1),1);
% construct a vector consisted of -1 or 1, which is in the same dimension as vec1
vec2=vec1.*f; % so that all the eignvectors have a positive sum of its component
contr=cumsum(rate); % calc total contribution rate
df=xd*vec2;

for i=1:n
    if contr(i)>99
        num=i;
        break;
    end
end % select principal component

hg21=df(:,[1:num])\yd;
% calc each component's coefficient,note that the const term is zero
% because of standardization
hg22=vec2(:,1:num)*hg21; %calc each variable's coefficent
hg23=[mean(y0)-std(y0)*mean(x0)./std(x0)*hg22,std(y0)*hg22'./std(x0)];
% recover variable

fprintf('y=%f',hg23(1));    
for i=2:n
    if hg23(i)>0
        fprintf(' +%f*x%d ',hg23(i),i-1);
    else
        fprintf(' %f*x%d ',hg23(i),i-1);
    end
end
fprintf('\n');
rmse1=sqrt(sum((hg1(1)+x0*hg1(2:end)'-y0).^2)/(m-n));
rmse2=sqrt(sum((hg23(1)+x0*hg23(2:end)'-y0).^2)/(m-num));
% compare varience