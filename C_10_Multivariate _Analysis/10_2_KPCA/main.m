clc,clear;
load('matlab1.mat', 'A_normal');
[egi_vec,egi_val,dim]=kpca(A_normal,85);