function [desc]=stocker_desc(mat_imag,N,ch)
%N: nombre de regions
desc=zeros(N,66);
[l,c]=size(mat_imag(:,:,1));
tail=l/sqrt(N); %taille de la region
if N==4 || N==16
matr=zeros(tail,tail,N);  %la matrice dans laquelle on va stocker les regions
for p=1:66
   
k=1;
for i=1:sqrt(N)
    for j=1:sqrt(N)
        matr(:,:,k)=mat_imag((i-1)*tail+1:i*tail,(j-1)*tail+1:j*tail,p);
    k=k+1;
    end
end
% 5 regions


for i=1:N
    if ch==1
        desc(i,p)=mean2(matr(:,:,i));
    elseif ch==2
        desc(i,p)=variance(matr(:,:,i));
    elseif ch==3
        desc(i,p)=moment(matr(:,:,i));
    elseif ch==4
        desc(i,p)=contraste(matr(:,:,i));
    elseif ch==5
        desc(i,p)=energy(matr(:,:,i));
    else
        desc(i,p)=entropy(matr(:,:,i));
    end
end
end
elseif N==5
    matr=zeros(l/2,c/2,5);
   for p=1:66
    r0=mat_imag((l/4)+1:(3/4*l),(c/4)+1:(3/4*c),p);
    matr(:,:,1)=r0;
    %
    r1=mat_imag(1:l/2,1:c/2,p);
    r1((l/4)+1:l/2,(c/4)+1:c/2)=0;
    matr(:,:,2)=r1;
     %
    r2=mat_imag(1:l/2,(c/2)+1:c,p);
    r2((l/4)+1:l/2,1:(c/4))=0;
    matr(:,:,3)=r2;
    %
    r3=mat_imag((l/2)+1:l,1:c/2,p);
    r3(1:l/4,(c/4)+1:c/2)=0;
    matr(:,:,4)=r3;
    %
    r4=mat_imag((l/2)+1:l,(c/2)+1:c,p);
    r4(1:l/4,1:c/4)=0;
    matr(:,:,5)=r4;
    
for i=1:N
    if ch==1
        desc(i,p)=mean2(matr(:,:,i));
    elseif ch==2
        desc(i,p)=variance(matr(:,:,i));
    elseif ch==3
        desc(i,p)=moment(matr(:,:,i));
    elseif ch==4
        desc(i,p)=contraste(matr(:,:,i));
    elseif ch==5
        desc(i,p)=energy(matr(:,:,i));
    else
        desc(i,p)=entropy(matr(:,:,i));
    end
end
    end
end