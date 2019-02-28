%Just change the name of mat-file
clear
%OC
phi1 = load('/Users/soliyan3261/Desktop/phi corr 170811/sld_phi_diff/PHI_OC.mat');
phi1 = phi1.phi;
phi1temp = phi1';
phi1new = reshape(phi1temp(~eye(size(phi1temp))), size(phi1, 2)-1, [])';
phi1_c = reshape(phi1new,296*295,1);
con1 = load('/Users/soliyan3261/Desktop/phi corr 170811/sld_corr_cont/R2_OC.mat');
con1 = con1.R2;
con1temp = con1';
con1new = reshape(con1temp(~eye(size(con1temp))), size(con1, 2)-1, [])';
con1_c = reshape(con1new,296*295,1);
bin1 = load('/Users/soliyan3261/Desktop/phi corr 170811/sld_corr_diff/R2_OC.mat');
bin1 = bin1.R2;
bin1temp = bin1';
bin1new = reshape(bin1temp(~eye(size(bin1temp))), size(bin1, 2)-1, [])';
bin1_c = reshape(bin1new,296*295,1);
cond1 = load('/Users/soliyan3261/Desktop/phi corr 170811/sld_corr_cont_diff/R2_OC_condiff.mat');
cond1 = cond1.R2;
cond1temp = cond1';
cond1new = reshape(cond1temp(~eye(size(cond1temp))), size(cond1, 2)-1, [])';
cond1_c = reshape(cond1new,296*295,1);
corr_P_C1 = corr([phi1_c,con1_c]);
corr_P_B1 = corr([phi1_c,bin1_c]);
corr_B_C1 = corr([bin1_c,con1_c]);
corr_P_CD = corr([phi1_c,cond1_c]);
corr_CD_C1 = corr([cond1_c,con1_c]);
corr_CD_B1 = corr([cond1_c,bin1_c]);


% con1 = load('/Users/soliyan3261/Desktop/R2_OC_condiff.mat');
% con1 = con1.R2;
% con1temp = con1';
% con1new = reshape(con1temp(~eye(size(con1temp))), size(con1, 2)-1, [])';
% con1_c = reshape(con1new,296*295,1);
% bin1 = load('/Users/soliyan3261/Desktop/phi corr 170811/sld_corr_diff/R2_OC.mat');
% bin1 = bin1.R2;
% bin1temp = bin1';
% bin1new = reshape(bin1temp(~eye(size(bin1temp))), size(bin1, 2)-1, [])';
% bin1_c = reshape(bin1new,296*295,1);
% 
% corr_B_C1 = corr([bin1_c,con1_c]);
