function [var] =variance(imag)
[l,c]=size(imag);
moy=mean2(imag); %calcul de la moyenne par la fonction mean2
var=(1/(l*c))*sum(sum((imag-moy).^2));
end