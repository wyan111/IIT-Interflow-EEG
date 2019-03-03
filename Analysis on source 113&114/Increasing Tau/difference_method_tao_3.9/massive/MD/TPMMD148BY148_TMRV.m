%Condition TMRV
for ichan1 = 1:148
    for ichan2 = ichan1:148
 [fre, TPM] = tpm1con('TMRV21.mat','TMRV22.mat','TMRV23.mat','TMRV24.mat','TMRV25.mat','TMRV26.mat',ichan1,ichan2);
 fre_MDTMRV(ichan1,ichan2) = {fre};
 TPM_MDTMRV(ichan1,ichan2) = {TPM};
end
end

save('fre_MDTMRV.mat','fre_MDTMRV')
save('TPM_MDTMRV.mat','TPM_MDTMRV')
