function [mat_desc]=stocker_desc_cmc(mat_image)
mat_desc=zeros(256,60);
for i=1:60
    mat_desc(:,i)=histoN(mat_image(:,:,i));
end


