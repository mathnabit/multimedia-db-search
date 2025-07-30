function [mat_dist]=stocke_dist_cmc(mat_desc)
%Fonction qui calcule la distance entre chacune des images requetes et
%les autres images cibles

mat_dist=zeros(30,30);
n=1;
m=1;

for i=1:2:60
    for j=2:2:60
        mat_dist(m,n)=distance_eucl(mat_desc(:,i),mat_desc(:,j));
n=n+1;
    end
n=1;
m=m+1;
end




% %%%%%%%
% A=mat_desc(:,1:2:60);
% B=mat_desc(:,2:2:60);
% for i=1:30
%     for j=1:30
%         L=sqrt(sum((A(:,i)-B(:,j)).^2));
%         mat_dist(i,j)=L;
%     end
% end
% 
% end
