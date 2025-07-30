function [contras] =contraste(imag)
[l,c]=size(imag);
contras=0;
for i=1:l
    for j=1:c
        contras=contras+((i-j)^2)*imag(i,j);
    end
end
end