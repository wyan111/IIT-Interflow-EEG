%median split across all epochs per time point
%change the binarise function in this function tobin_***
function Dprime = dkp_twoTPM(for_tpm1_1,for_tpm1_2,for_tpm2_1,for_tpm2_2,channel11,channel12,channel21,channel22)
for_tpm1_1mat = cell2mat(for_tpm1_1);
for_tpm1_2mat = cell2mat(for_tpm1_2);
matrix1_1 = squeeze(for_tpm1_1mat(channel11,:,:))';
matrix1_2 = squeeze(for_tpm1_2mat(channel12,:,:))';
%cha
matrix1_1b = tobin_sm(matrix1_1);matrix1_2b = tobin_sm(matrix1_2);
tpm_1 = tpm(matrix1_1b,matrix1_2b);
for_tpm2_1mat = cell2mat(for_tpm2_1);
for_tpm2_2mat = cell2mat(for_tpm2_2);
matrix2_1 = squeeze(for_tpm2_1mat(channel21,:,:))';
matrix2_2 = squeeze(for_tpm2_2mat(channel22,:,:))';
matrix2_1b = tobin_sm(matrix2_1);matrix2_2b = tobin_sm(matrix2_2);
tpm_2 = tpm(matrix2_1b,matrix2_2b);
Dprime = dkl(tpm_1,tpm_2);
