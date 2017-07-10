options=optimset('GradObj','on');
[z,y]=fminunc('fE3_5',rand(1,2),options)