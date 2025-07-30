%programme principal

nbre_images=60;
disp('Methodes de traitements');
disp('--> 1 : HISTOGRAMME CMC');
disp('--> 2 : CO-OCCURRENCE CMC');
choix=input('choisir la methode de traitement: ');

if (choix==1)
    mat_image=stocker_images_cmc(nbre_images);
    mat_desc=stocker_desc_cmc(mat_image);
    mat_dist=stocke_dist_cmc(mat_desc);
    [rang,proba]=calacul_CMC(mat_dist);
    disp('les rangs cumulés:')
    disp(rang);
    disp('les taux de reconnaissances:')
    disp(proba);
    
    elseif (choix==2)
    mat_image=stocker_images_cmc(nbre_images);
    mat_image=uint8(mat_image);
    mat_ocurr=co_occurence(mat_image);
    mat_desc=stocker_desc_cmc(mat_ocurr);
    mat_dist=stocke_dist_cmc(mat_desc);
    [rang,proba]=calacul_CMC(mat_dist);
    disp('les rangs cumulés:')
    disp(rang);
    disp('les taux de reconnaissances:')
    disp(proba);
end