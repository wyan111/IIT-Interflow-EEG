clear
%histog(filename,condition of the first channel,condition of the second
%channel,condition of the third channel,condition of the fourth channel,
%channel number,channel number,channel number,channel number)
%1&2 are for TM condition; 3&4 are for RV condition; 5&6 are for OC
%condition
[TPM1,fre1] = histog('sld170811.mat',3,4,4,4,75,76,113,114);
[TPM2,fre2] = histog('sld170811.mat',3,4,4,4,75,75,76,114);
[TPM3,fre3] = histog('sld170811.mat',3,4,4,4,75,75,113,114);
[TPM4,fre4] = histog('sld170811.mat',3,4,4,4,75,76,113,114);

[TPM5,fre5] = histog('sld170811.mat',3,4,4,4,76,75,76,113);
[TPM6,fre6] = histog('sld170811.mat',3,4,4,4,76,75,76,114);
[TPM7,fre7] = histog('sld170811.mat',3,4,4,4,76,75,113,114);
[TPM8,fre8] = histog('sld170811.mat',3,4,4,4,76,76,113,114);

[TPM9,fre9] = histog('sld170811.mat',3,4,4,4,113,75,76,113);
[TPM10,fre10] = histog('sld170811.mat',3,4,4,4,113,75,76,114);
[TPM11,fre11] = histog('sld170811.mat',3,4,4,4,113,75,113,114);
[TPM12,fre12] = histog('sld170811.mat',3,4,4,4,113,76,113,114);

[TPM13,fre13] = histog('sld170811.mat',3,4,4,4,114,75,76,113);
[TPM14,fre14] = histog('sld170811.mat',3,4,4,4,114,75,76,114);
[TPM15,fre15] = histog('sld170811.mat',3,4,4,4,114,75,113,114);
[TPM16,fre16] = histog('sld170811.mat',3,4,4,4,114,76,113,114);

[TPM17,fre17] = histog('sld170811.mat',3,3,3,4,75,76,113,75);
[TPM18,fre18] = histog('sld170811.mat',3,3,3,4,75,76,114,75);
[TPM19,fre19] = histog('sld170811.mat',3,3,3,4,75,113,114,75);
[TPM20,fre20] = histog('sld170811.mat',3,3,3,4,76,113,114,75);

[TPM21,fre21] = histog('sld170811.mat',3,3,3,4,75,76,113,76);
[TPM22,fre22] = histog('sld170811.mat',3,3,3,4,75,76,114,76);
[TPM23,fre23] = histog('sld170811.mat',3,3,3,4,75,113,114,76);
[TPM24,fre24] = histog('sld170811.mat',3,3,3,4,76,113,114,76);

[TPM25,fre25] = histog('sld170811.mat',3,3,3,4,75,76,113,113);
[TPM26,fre26] = histog('sld170811.mat',3,3,3,4,75,76,114,113);
[TPM27,fre27] = histog('sld170811.mat',3,3,3,4,75,113,114,113);
[TPM28,fre28] = histog('sld170811.mat',3,3,3,4,76,113,114,113);

[TPM29,fre29] = histog('sld170811.mat',3,3,3,4,75,76,113,114);
[TPM30,fre30] = histog('sld170811.mat',3,3,3,4,75,76,114,114);
[TPM31,fre31] = histog('sld170811.mat',3,3,3,4,75,113,114,114);
[TPM32,fre32] = histog('sld170811.mat',3,3,3,4,76,113,114,114);

TPM(1,1) = {TPM1};
TPM(1,2) = {TPM2};
TPM(1,3) = {TPM3};
TPM(1,4) = {TPM4};
TPM(1,5) = {TPM5};
TPM(1,6) = {TPM6};
TPM(1,7) = {TPM7};
TPM(1,8) = {TPM8};
TPM(1,9) = {TPM9};
TPM(1,10) = {TPM10};
TPM(1,11) = {TPM11};
TPM(1,12) = {TPM12};
TPM(1,13) = {TPM13};
TPM(1,14) = {TPM14};
TPM(1,15) = {TPM15};
TPM(1,16) = {TPM16};
TPM(1,17) = {TPM17};
TPM(1,18) = {TPM18};
TPM(1,19) = {TPM19};
TPM(1,20) = {TPM20};
TPM(1,21) = {TPM21};
TPM(1,22) = {TPM22};
TPM(1,23) = {TPM23};
TPM(1,24) = {TPM24};
TPM(1,25) = {TPM25};
TPM(1,26) = {TPM26};
TPM(1,27) = {TPM27};
TPM(1,28) = {TPM28};
TPM(1,29) = {TPM29};
TPM(1,30) = {TPM30};
TPM(1,31) = {TPM31};
TPM(1,32) = {TPM32};


TPM(2,1) = {fre1};
TPM(2,2) = {fre2};
TPM(2,3) = {fre3};
TPM(2,4) = {fre4};
TPM(2,5) = {fre5};
TPM(2,6) = {fre6};
TPM(2,7) = {fre7};
TPM(2,8) = {fre8};
TPM(2,9) = {fre9};
TPM(2,10) = {fre10};
TPM(2,11) = {fre11};
TPM(2,12) = {fre12};
TPM(2,13) = {fre13};
TPM(2,14) = {fre14};
TPM(2,15) = {fre15};
TPM(2,16) = {fre16};
TPM(2,17) = {fre17};
TPM(2,18) = {fre18};
TPM(2,19) = {fre19};
TPM(2,20) = {fre20};
TPM(2,21) = {fre21};
TPM(2,22) = {fre22};
TPM(2,23) = {fre23};
TPM(2,24) = {fre24};
TPM(2,25) = {fre25};
TPM(2,26) = {fre26};
TPM(2,27) = {fre27};
TPM(2,28) = {fre28};
TPM(2,29) = {fre29};
TPM(2,30) = {fre30};
TPM(2,31) = {fre31};
TPM(2,32) = {fre32};

imagesc(TPM1, [0 1]);
figure_FontSize=16;
set(gca,'ytick',[1:16]);
set(gca,'xtick',[1:4]);
set(gca,'xticklabel',{'A','B','C','D'});
set(gca,'yticklabel',{'0000','1000','0100','1100','0010','1010','0110','1110','0001','1001','0101','1101','0011','1011','0111','1111'})
colormap(gray);colorbar;
set(gca,'FontSize',figure_FontSize);

xlabel('Current State');ylabel('Next state');title('State By Node TPM')