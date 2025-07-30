function[rang,proba]=calacul_CMC(mat_dist)

[sorted,index]=sort(mat_dist);

[l,c]=size(sorted);
rang=zeros(1,l);
proba=zeros(1,l);

%%%%%%%%
for i=1:l
    for j=1:c
        if(j==index(i,j))
            rang(i)=rang(i)+1;
        end
    end
end
%%%%%%%%%%%

% for j=1:c
%     i=1;
%     while(j~=index(i,j) && i<=l)
%         i=i+1;
%     end
%     rang(i)=rang(i)+1;
% end

for i=1:l
   proba(i)=sum(rang(1:i))/sum(rang);     
end

disp('les rangs :')
disp(rang);

for i=2:l
    rang(i)=rang(i-1)+rang(i);
end

figure(1);
plot(rang,proba);
title('Courbe CMC');
xlabel('rang');
ylabel('taux');

end