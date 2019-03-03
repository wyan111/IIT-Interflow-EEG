file = 'sld170820.mat';
%cross brain
%Condition TM
for ichan1 = 1:148
for ichan2 = 1:148
 [ifre,iTPM] = tpm1con(file,1,2,ichan1,ichan2);
 fre(ichan1,ichan2) = {ifre};
 TPM(ichan1,ichan2) = {iTPM};
end
end
save('fre_TM.mat','fre')
save('TPM_TM.mat','TPM')
%Condition RV
for ichan1 = 1:148
for ichan2 = 1:148
 [ifre,iTPM] = tpm1con(file,3,4,ichan1,ichan2);
 fre(ichan1,ichan2) = {ifre};
 TPM(ichan1,ichan2) = {iTPM};
end
end
save('fre_RV.mat','fre')
save('TPM_RV.mat','TPM')
% %Condition OC
for ichan1 = 1:148
for ichan2 = 1:148
 [ifre,iTPM] = tpm1con(file,5,6,ichan1,ichan2);
 fre(ichan1,ichan2) = {ifre};
 TPM(ichan1,ichan2) = {iTPM};
end
end
save('fre_OC.mat','fre')
save('TPM_OC.mat','TPM')
%Within first Participant
%Condition TM
for ichan1 = 1:148
for ichan2 = ichan1:148
 [ifre,iTPM] = tpm1con(file,1,1,ichan1,ichan2);
 fre(ichan1,ichan2) = {ifre};
 TPM(ichan1,ichan2) = {iTPM};
end
end
save('fre_TM_P1.mat','fre')
save('TPM_TM_P1.mat','TPM')
%Condition RV
for ichan1 = 1:148
for ichan2 = ichan1:148
 [ifre,iTPM] = tpm1con(file,3,3,ichan1,ichan2);
 fre(ichan1,ichan2) = {ifre};
 TPM(ichan1,ichan2) = {iTPM};
end
end
save('fre_RV_P1.mat','fre')
save('TPM_RV_P1.mat','TPM')
%Condition OC
for ichan1 = 1:148
for ichan2 = ichan1:148
 [ifre,iTPM] = tpm1con(file,5,5,ichan1,ichan2);
 fre(ichan1,ichan2) = {ifre};
 TPM(ichan1,ichan2) = {iTPM};
end
end
save('fre_OC_P1.mat','fre')
save('TPM_OC_P1.mat','TPM')
%within second participants
%Condition TM
for ichan1 = 1:148
for ichan2 = ichan1:148
 [ifre,iTPM] = tpm1con(file,2,2,ichan1,ichan2);
 fre(ichan1,ichan2) = {ifre};
 TPM(ichan1,ichan2) = {iTPM};
end
end
save('fre_TM_P2.mat','fre')
save('TPM_TM_P2.mat','TPM')
%Condition RV
for ichan1 = 1:148
for ichan2 = ichan1:148
 [ifre,iTPM] = tpm1con(file,4,4,ichan1,ichan2);
 fre(ichan1,ichan2) = {ifre};
 TPM(ichan1,ichan2) = {iTPM};
end
end
save('fre_RV_P2.mat','fre')
save('TPM_RV_P2.mat','TPM')
%Condition OC
for ichan1 = 1:148
for ichan2 = ichan1:148
 [ifre,iTPM] = tpm1con(file',6,6,ichan1,ichan2);
 fre(ichan1,ichan2) = {ifre};
 TPM(ichan1,ichan2) = {iTPM};
end
end
save('fre_OC_P2.mat','fre')
save('TPM_OC_P2.mat','TPM')