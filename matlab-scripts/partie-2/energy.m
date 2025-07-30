function [Enrg] = energy(imag)
Enrg=sum(sum(imag.^2));
end