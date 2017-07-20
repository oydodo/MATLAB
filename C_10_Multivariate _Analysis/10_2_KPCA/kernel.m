function k=kernel(x,y,i,sigma)
if i==1
   k=exp(-norm(x-y)/(sigma^2)); 
end
if i==2
   k=(sum(x.*y)+1)^sigma; 
end