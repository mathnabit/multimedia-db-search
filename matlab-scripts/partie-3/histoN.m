function [hn] = histoN(I)
hn=imhist(I);
[l,c]=size(I);
hn=hn./(l*c);
end
