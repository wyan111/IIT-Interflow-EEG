%Condition TM
for ichan1 = 1:1
    for ichan2 = ichan1:1
 [fre, TPM] = tpm1con('TM21.mat','TM22.mat','TM23.mat','TM24.mat','TM25.mat','TM26.mat',ichan1,ichan2);
 fre_MDTM(ichan1,ichan2) = {fre};
 TPM_MDTM(ichan1,ichan2) = {TPM};
end
end
% 
% save('fre_MDTM.mat','fre_MDTM')
% save('TPM_MDTM.mat','TPM_MDTM')
