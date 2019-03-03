%Condition TM
for ichan1 = 1:148
    for ichan2 = ichan1:148
 [fre, TPM] = tpm1con('TM11.mat','TM12.mat','TM13.mat','TM14.mat','TM15.mat','TM16.mat',ichan1,ichan2);
 fre_WLTM(ichan1,ichan2) = {fre};
 TPM_WLTM(ichan1,ichan2) = {TPM};
end
end

save('fre_WLTM.mat','fre_WLTM')
save('TPM_WLTM.mat','TPM_WLTM')
