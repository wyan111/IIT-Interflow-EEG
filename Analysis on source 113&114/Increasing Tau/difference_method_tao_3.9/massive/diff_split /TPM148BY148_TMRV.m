%Condition TMRV
for ichan1 = 1:148
    for ichan2 = 1:148
 [fre, TPM] = tpm1con('TMRV11.mat','TMRV21.mat','TMRV12.mat','TMRV22.mat','TMRV13.mat','TMRV23.mat','TMRV14.mat','TMRV24.mat','TMRV15.mat','TMRV25.mat','TMRV16.mat','TMRV26.mat',ichan1,ichan2);
 fre_TMRV(ichan1,ichan2) = {fre};
 TPM_TMRV(ichan1,ichan2) = {TPM};
end
end

save('fre_TMRV.mat','fre_TMRV')
save('TPM_TMRV.mat','TPM_TMRV')
