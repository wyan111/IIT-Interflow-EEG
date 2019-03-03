%Condition TMOC
for ichan1 = 1:148
    for ichan2 = 1:148
 [fre,TPM] = tpm1con('TMOC11.mat','TMOC21.mat','TMOC12.mat','TMOC22.mat','TMOC13.mat','TMOC23.mat','TMOC14.mat','TMOC24.mat','TMOC15.mat','TMOC25.mat','TMOC16.mat','TMOC26.mat',ichan1,ichan2);
 fre_TMOC(ichan1,ichan2) = {fre};
 TPM_TMOC(ichan1,ichan2) = {TPM};
end
end

save('fre_TMOC.mat','fre_TMOC')
save('TPM_TMOC.mat','TPM_TMOC')