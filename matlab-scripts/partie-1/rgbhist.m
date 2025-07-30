function [HR,HG,HB]=rgbhist(imag)
HR=imhist(imag(:,:,1));
HG=imhist(imag(:,:,2));
HB=imhist(imag(:,:,3));

%affichage

subplot(3,1,1);bar(HR,'r');title('histogramme du plan rouge');
subplot(3,1,2);bar(HG,'g');title('histogramme du plan vert');
subplot(3,1,3);bar(HB,'b');title('histogramme du plan bleu');

end