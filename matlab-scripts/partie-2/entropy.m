function [entrp] = entropy(imag)
entrp=-(sum(sum(imag.*log2(imag))));
end
