function []=DescCouleur()

choix = 1;
while (choix == 1 || choix==2)
disp('--> 1 : Calculer la similarité avec distance Euclidienne');
disp('--> 2 : Calculer la similarité avec distance Manhattan');
disp('--> 0 : Exit');  
choix=input('choisir : ');

if (choix==1 || choix==2)
disp('--> Choisir une image requete');
[filename,chemin]=uigetfile('*.*');
imag_r=imread([chemin filename]);

figure(1);
imshow(imag_r);
title('L image requete');

Distance1=[];    %pour les cannaux rouges
Distance2=[];    %pour les cannaux verts
Distance3=[];    %pour les cannaux blues
DistanceNames={};  %pour les noms des images

%histogrammes de l'image requete
figure(2);
[HR,HG,HB]=rgbhist(imag_r);

disp('--> Calcule des distances entre les histogrammes ...');

for i=1:66
    imag_name=['/MATLAB Drive/image_database/',int2str(i),'.jpg'];
    imag=imread(imag_name);
    [hr,hg,hb]=rgbhist(imag);                %histogrammes de l'image de la BDM
    
    if (choix==1)
        [Distance1(i),Distance2(i),Distance3(i)]=distance(HR,HG,HB,hr,hg,hb);  %calcul des distances
    elseif (choix==2)
        [Distance1(i),Distance2(i),Distance3(i)]=distance_manhat(HR,HG,HB,hr,hg,hb);  
    end
    
DistanceNames(i)={imag_name}; %les noms des images
end

%le tri

[sortedD1,index1]=sort(Distance1);
[sortedD2,index2]=sort(Distance2);
[sortedD3,index3]=sort(Distance3);

%affichage des huits images similaires
disp('--> Affichage des images similaires');

figure(3);
fprintf('\n----les distances selon R----');
for i=1:8
  subplot(2,4,i);imshow(char(DistanceNames(index1(i))));title(index1(i));
  sgtitle('Les images similaires selon R');
  %fprintf('\nla distance entre l"image requete et l"image %d selon R =%f',i,sortedD1(i));
end
disp(sortedD1(1:8));

figure(4);
fprintf('\n\n----les distances selon G----');
for i=1:8
  subplot(2,4,i);imshow(char(DistanceNames(index2(i))));title(index2(i));
  sgtitle('Les images similaires selon G')
  %fprintf('\nla distance entre l"image requete et l"image %d selon G =%f',i,sortedD2(i));
end
disp(sortedD2(1:8));

figure(5);
fprintf('\n\n----les distances selon B----');
for i=1:8
  subplot(2,4,i);imshow(char(DistanceNames(index3(i))));title(index3(i));
  sgtitle('Les images similaires selon B')
  %fprintf('\nla distance entre l"image requete et l"image %d selon B =%f',i,sortedD3(i));
end
disp(sortedD3(1:8));

fprintf('\n');

end

end