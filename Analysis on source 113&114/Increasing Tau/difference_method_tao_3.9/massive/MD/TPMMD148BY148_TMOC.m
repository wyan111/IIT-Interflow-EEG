%Condition TMOC
for ichan1 = 1:148
    for ichan2 = ichan1:148
 [fre, TPM] = tpm1con('TMOC21.mat','TMOC22.mat','TMOC23.mat','TMOC24.mat','TMOC25.mat','TMOC26.mat',ichan1,ichan2);
 fre_MDTMOC(ichan1,ichan2) = {fre};
 TPM_MDTMOC(ichan1,ichan2) = {TPM};
end
end

save('fre_MDTMOC.mat','fre_MDTMOC')
save('TPM_MDTMOC.mat','TPM_MDTMOC')
