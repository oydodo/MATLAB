function [distance,path] = dijkstra(a,s,e)
% Dijkstra algorithm using adjacency matrix
% input a: adjacency matrix in which a(i,j) implies that distance between i,j
%       s : starting point    e : ending point
% output distance: shortest distance between s & e
%       path : corresponding path of shortest distance
%   dis : shortest distance between s & any other point
%   n : number of point 
%   b : record that if b(p) visited
%   pre : father node of the present one
    n=size(a,1);
    dis=ones(1,n).*inf; 
    b(1:n)=0; % put all point in set V-S
    dis(s)=0; b(s)=1; u=s; % add s to set S
    pre(1:n)=0; 
    for i=1:n-1
        id = find(b==0); % find all point in V-S
        for v = id
            if dis(u)+ a(u,v) < dis(v)
                dis(v)=dis(u)+a(u,v);
                pre(v)=u;
            end % update dis using node u
        end
        
        temp=dis;
        temp(b==1)=inf;
        [t,u]=min(temp); % choose the unvisited minimum dis point as next u
                         % t return dis ,u return point
        b(u)=1; % mark u as visited
    end
    path=[];
    if pre(e)~=0
        t=e;
        while t~=s
            path=[t,path];
            t=pre(t);
        end
    end
    distance=dis(e);
end


