function [homgn] =moment(imag)
homgn=0;
[l,c]=size(imag);
for i=1:l
    for j=1:c
        homgn=homgn+sum(sum(imag(i,j)/(1+abs(i-j))));
    end
end
end
