%Condition TM
for ichan1 = 1:1
    for ichan2 = 1:1
 [fre,TPM] = tpm1con('TM11.mat','TM21.mat','TM12.mat','TM22.mat','TM13.mat','TM23.mat','TM14.mat','TM24.mat','TM15.mat','TM25.mat','TM16.mat','TM26.mat',ichan1,ichan2);
 fre_TM(ichan1,ichan2) = {fre};
 TPM_TM(ichan1,ichan2) = {TPM};
end
end

% save('fre_TM.mat','fre_TM')
% save('TPM_TM.mat','TPM_TM')

