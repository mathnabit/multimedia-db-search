function [dr,dg,db]=distance(HR,HG,HB,hr,hg,hb)
dr=sqrt(sum((HR-hr).^2));
dg=sqrt(sum((HG-hg).^2));
db=sqrt(sum((HB-hb).^2));
end