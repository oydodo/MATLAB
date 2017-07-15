function [vec_out,eig_val,t] = kpca(data_in,goal)
% This function does principal component analysis (non-linear) on the given
% data set using the Kernel trick
%
% Data_in - Input data (d (dimensions) X N (# of points)
% vec_out - new vector in mapped space
% eig_val - eginvalues
% t - ammount of principle component
%
% ammount of principle component will be choosed according to the
% comtribution rate of total selected components,instead of fixxed
% manually
%
% Author:Ambarish Jash
% ambarish.jash@colorado.edu
% modified by dodo
% original website: http://cn.mathworks.com/matlabcentral/fileexchange/27319-kernel-pca

%% Checking to ensure output dimensions are lesser than input dimension.(no nessary now)
% if num_dim > size(data_in,1)
%     fprintf('\nDimensions of output data has to be lesser than the dimensions of input data\n');
%     fprintf('Closing program\n');
%     return
% end

%% Using the Gaussian Kernel to construct the Kernel K
% K(x,y) = -exp((x-y)^2/(sigma)^2)
% K is a symmetric Kernel

K = zeros(size(data_in,2),size(data_in,2));
m = size(K,1);

for i=1:m
    for j=1:m
       K(i,j) = kernel(data_in(:,i),data_in(:,j),1,2); 
    end
end

% We know that for PCA the data has to be centered. Even if the input data
% set 'X' lets say in centered, there is no gurantee the data when mapped
% in the feature space [phi(x)] is also centered. Since we actually never
% work in the feature space we cannot center the data. To include this
% correction a pseudo centering is done using the Kernel.

one_mat = ones(m);
K_center = K - one_mat*K/m - K*one_mat/m + one_mat*K*one_mat/(m*m);
%K_center = K - one_mat*K - K*one_mat + one_mat*K*one_mat;
%K_center=zscore(K);
clear K
%sum(K_center(:,1))

%% Obtaining the low dimensional projection
% The following equation needs to be satisfied for K
% N*lamda*K*alpha = K*alpha
% Thus lamda's has to be normalized by the number of points

% opts.issym = 1;                          
% opts.disp = 0; 
% opts.isreal = 1;
% [eigvec,eig_val] = eigs(K_center,m,'lm',opts);
 [eigvec,eig_val] = eig(K_center);
 eig_val=diag(eig_val);

% Again 1 = lamda*(alpha.alpha)
% Here '.' indicated dot product
for col = 1:size(eigvec,2)
    eigvec(:,col) = eigvec(:,col)./(sqrt(eig_val(col)));
end
[~, index] = sort(eig_val,'descend');
eigvec = eigvec(:,index);
%% Projecting the data in lower dimensions

tot=sum(eig_val);
c=eig_val/tot;
q=0;
t=0;
while q<goal/100 && t<m
    t=t+1;
    q=q+c(t);
end

 vec_out = zeros(t,size(data_in,2));
 for count = 1:t
     vec_out(count,:) = eigvec(:,count)'*K_center';
 end