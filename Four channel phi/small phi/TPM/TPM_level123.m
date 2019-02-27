data = load('TPM_OC13.mat');
TPM_OC13 = data.TPM;
data = load('TPM_TM13.mat');
TPM_TM13 = data.TPM;
data = load('TPM_RV13.mat');
TPM_RV13 = data.TPM;
data = load('TPM_OC2.mat');
TPM_OC2 = data.TPM;
data = load('TPM_TM2.mat');
TPM_TM2 = data.TPM;
data = load('TPM_RV2.mat');
TPM_RV2 = data.TPM;


TPM_OC(:,1:2) = TPM_OC13(:,1:2);
TPM_OC(:,3:34) = TPM_OC2;
TPM_OC(:,35:70) = TPM_OC13(:,3:38);

TPM_TM(:,1:2) = TPM_TM13(:,1:2);
TPM_TM(:,3:34) = TPM_TM2;
TPM_TM(:,35:70) = TPM_TM13(:,3:38);

TPM_RV(:,1:2) = TPM_RV13(:,1:2);
TPM_RV(:,3:34) = TPM_RV2;
TPM_RV(:,35:70) = TPM_RV13(:,3:38);