%move_as_target
%recursion
function [x_p,y_p]=move_t(A,r,i,j)
sz=size(A);
x=0;
y=0;
ind=find(A==0);
if(~isempty(ind))
    ind_j=fix((ind-1)/sz(1))+1;
    ind_i=ind-(ind_j-1)*sz(1);
    ind_d=abs(ind_j-j)+abs(ind_i-i);
    if min(ind_d)<=r
        ind_min_ind=find(ind_d==min(ind_d));
        ind_final=ind_min_ind(randi(length(ind_min_ind)));
        x=ind_i(ind_final);
        y=ind_j(ind_final);
    end
end
if(x~=0||y~=0)
    dx=x-i;
    dy=y-j;
    x_p=[ones(abs(dx),1);zeros(abs(dy),1)];
    x_p=x_p(randperm(length(x_p)));
    y_p=ones((abs(dx)+abs(dy)),1)-x_p;
    x_p=x_p*sign(dx);
    y_p=y_p*sign(dy);
else
    x_p=0;
    y_p=0;
end
end