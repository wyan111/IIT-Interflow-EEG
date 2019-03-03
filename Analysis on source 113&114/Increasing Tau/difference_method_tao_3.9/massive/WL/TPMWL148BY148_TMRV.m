%Condition TMRV
for ichan1 = 1:148
    for ichan2 = ichan1:148
 [fre, TPM] = tpm1con('TMRV11.mat','TMRV12.mat','TMRV13.mat','TMRV14.mat','TMRV15.mat','TMRV16.mat',ichan1,ichan2);
 fre_WLTMRV(ichan1,ichan2) = {fre};
 TPM_WLTMRV(ichan1,ichan2) = {TPM};
end
end

save('fre_WLTMRV.mat','fre_WLTMRV')
save('TPM_WLTMRV.mat','TPM_WLTMRV')
