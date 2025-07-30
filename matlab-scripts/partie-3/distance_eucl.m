function[dist]=distance_eucl(I1,I2)
dist=sqrt(sum((I1-I2).^2));
end