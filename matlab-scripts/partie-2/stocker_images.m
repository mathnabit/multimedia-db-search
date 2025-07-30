function [mat_image]=stocker_images(nbr_image,chemin_bd)
%initialisation de la matrice mat_image
mat_image=zeros(256,384,nbr_image);

for i=1:nbr_image
    imag=imread([chemin_bd,int2str(i),'.jpg']);
    imag=im2double(rgb2gray(imag));
    mat_image(:,:,i)=imag;
end
