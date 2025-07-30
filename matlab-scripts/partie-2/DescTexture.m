function []=DescTexture()

choix = 1;

while (choix == 1)
    
disp('--> 1 : Lancer le traitement');
disp('--> 0 : Exit');
choix=input('Choisir : ');

if(choix==0)
break;
end

[filename,chemin]=uigetfile('*.*');
imag_r=imread([chemin filename]);
figure(1);
imshow(imag_r);
title('L image requete');

mat_dist=zeros(66,66);


%stockage des images de la BDM
mat_imag=stocker_images(66,'/MATLAB Drive/image_database/');

% choix du nbre de regions
disp('--> 4 regions\n --> 16 regions\n --> 5 regions\n');
N=input('choisissez le nombre de regions : ');

% choix du descripteur
disp('1: Moyenne 2: Variance 3: Moment 4: Contraste 5: Energie 6: Entropie');
ch=input('choisissez le descripteur a utiliser : ');

%initialisation,stockage et tri du vecteur de distances
desc=stocker_desc(mat_imag,N,ch);

%Calcule de la similarité par la distance euclidienne
for j=1:66
for i=1:66
    mat_dist(j,i)=dist_eucli(desc(:,j),desc(:,i)); 
end
end

%Ordonner les distances
[mat_dist,index]=sort(mat_dist);

j=input('choisir le numero de l image requete : ');
%affichage de l image requete
% imag_name=['/MATLAB Drive/image_database/',int2str(j),'.jpg'];
% imag_req=imread(imag_name);


%affichade du resultat
figure(2);

for i=1:4
    subplot(2,2,i);imshow(mat_imag(:,:,index(i,j)));title(index(i,j));
end
sgtitle('Les images similaires à l image requete');

end %end while