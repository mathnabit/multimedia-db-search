function [mat_image]=stocker_images_cmc(nbre_images)
mat_image=zeros(128,128,60);
S=fspecial('prewitt');
for i=1:nbre_images
    imag=['/MATLAB Drive/im/',int2str(i),'.png'];
    mat_image(:,:,i)=imfilter((im2double(imread(imag))),S);   
end


