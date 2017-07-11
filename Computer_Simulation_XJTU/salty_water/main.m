clc,clear;
v=ones(1,3)*1000; % represent v1 v2 v3 
s=zeros(1,3);    
c=zeros(1,3); % same to v
for t=2:200
    s=[s;s(t-1,:)+insalt(t,c)];
    v=[v;v(t-1,:)+inwater(t)];
    c=[c;s(t,:)./v(t,:)];
end
x=1:200;
x=x';
figure(1); plot(x,v(:,1),'blue',x,v(:,2),'red',x,v(:,3),'green'); 
xlabel('Time Elapse/t'); ylabel('Water Volume/m^3')
figure(2); plot(x,s(:,1),'blue',x,s(:,2),'red',x,s(:,3),'green');
xlabel('Time Elapse/t'); ylabel('Salinity/m^3');
figure(3); plot(x,c(:,1),'blue',x,c(:,2),'red',x,c(:,3),'green');
xlabel('Time Elapse/t'); ylabel('Salty Concentration/m^3');