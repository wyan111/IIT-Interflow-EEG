%TPM single median per trial
%TMRV condition
%24-25-25-24-25-25
i = [1 25 50 75 99 124];
j = [24 49 74 98 123 148];
%import data
data = load('alldata.mat');
alldata = data.alldata;
%Binarize data
for iTri = 1:6
dataset1 = cell2mat(alldata(3,iTri));
dataset2 = cell2mat(alldata(4,iTri));
matrix1_1 = squeeze(dataset1(113,:,:))';
matrix1_2 = squeeze(dataset1(114,:,:))';
matrix2_1 = squeeze(dataset2(113,:,:))';
matrix2_2 = squeeze(dataset2(114,:,:))';
matrix1_1_bin(i(iTri):j(iTri),:) = tobin_smpt(matrix1_1);
matrix1_2_bin(i(iTri):j(iTri),:) = tobin_smpt(matrix1_2);
matrix2_1_bin(i(iTri):j(iTri),:) = tobin_smpt(matrix2_1);
matrix2_2_bin(i(iTri):j(iTri),:) = tobin_smpt(matrix2_2);
end
[sbnTPM1,sbsTPM1,fre1] = tpm(matrix1_1_bin,matrix1_2_bin);
[sbnTPM2,sbsTPM2,fre2] =tpm(matrix1_1_bin,matrix2_1_bin);
[sbnTPM3,sbsTPM3,fre3] =tpm(matrix1_1_bin,matrix2_2_bin);
[sbnTPM4,sbsTPM4,fre4] =tpm(matrix1_2_bin,matrix2_1_bin);
[sbnTPM5,sbsTPM5,fre5] =tpm(matrix1_2_bin,matrix2_2_bin);
[sbnTPM6,sbsTPM6,fre6] =tpm(matrix2_1_bin,matrix2_2_bin);
%state-by-node TPM
TPM(1,1) = {sbnTPM1};
TPM(1,2) = {sbnTPM2};
TPM(1,3) = {sbnTPM3};
TPM(1,4) = {sbnTPM4};
TPM(1,5) = {sbnTPM5};
TPM(1,6) = {sbnTPM6};
%State-by-state TPM
TPM(2,1) = {sbsTPM1};
TPM(2,2) = {sbsTPM2};
TPM(2,3) = {sbsTPM3};
TPM(2,4) = {sbsTPM4};
TPM(2,5) = {sbsTPM5};
TPM(2,6) = {sbsTPM6};
%Frequency
TPM(3,1) = {fre1};
TPM(3,2) = {fre2};
TPM(3,3) = {fre3};
TPM(3,4) = {fre4};
TPM(3,5) = {fre5};
TPM(3,6) = {fre6};