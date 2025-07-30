function [dr,dg,db]=distance_manhat(HR,HG,HB,hr,hg,hb)

dr=sum(abs(HR-hr));
dg=sum(abs(HG-hg));
db=sum(abs(HB-hb));

end