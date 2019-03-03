%Condition TMOC
for ichan1 = 1:148
    for ichan2 = ichan1:148
 [fre, TPM] = tpm1con('TMOC11.mat','TMOC12.mat','TMOC13.mat','TMOC14.mat','TMOC15.mat','TMOC16.mat',ichan1,ichan2);
 fre_WLTMOC(ichan1,ichan2) = {fre};
 TPM_WLTMOC(ichan1,ichan2) = {TPM};
end
end

save('fre_WLTMOC.mat','fre_WLTMOC')
save('TPM_WLTMOC.mat','TPM_WLTMOC')
