clc,clear;
options=optimset('GradObj','on','GradConstr','on');
[x,y]=fmincon(@ f1E3_14,rand(2,1),[],[],[],[],[],[],@ f2E3_14,options)