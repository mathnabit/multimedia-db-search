function [mat_ocurr] =co_occurence(mat_image)
mat_ocurr=zeros(128,128,60);
for p=1:60
    for i=1:128
        for j=1:127 %si on met 256 "b=mat_image(i,j+1)" va depasser la dimension
            a=mat_image(i,j,p);
            b=mat_image(i,j+1,p);
            if(a~=0 && b~=0) %(0,0)c'est un paire qui n'existe pas dans la matrice occurence
               mat_ocurr(a,b,p)=mat_ocurr(a,b,p)+1;
            end
        end
    end
end