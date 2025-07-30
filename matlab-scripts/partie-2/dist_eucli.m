function [dist]=dist_euclid(u,v)
dist=sqrt(sum((u-v).^2));
end