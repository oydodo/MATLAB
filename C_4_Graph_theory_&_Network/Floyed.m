function [distance,path] = Floyed( a,s,e )
%FLOYED Summary of this function goes here
%   Detailed explanation goes here
    n=size(a,1);
    dis=a;
    for k=1:n
      for i=1:n
        for j=1:n
            if dis(i,j)>dis(i,k)+dis(k,j) && i~=j && j~=k
            %dis(i,j)=min(dis(i,j),dis(i,k)+dis(k,j));
                dis(i,j)=dis(i,k)+dis(k,j);
                p(i,j)=k;
            end
        end
      end
    end
    distance=dis(s,e)
    parent=p(s,:); 
    parent(parent==0)=s;
    path=e; t=e;
    while t~=s
        t=parent(t);
        path=[t,path];
    end
    path
end

