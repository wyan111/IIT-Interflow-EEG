data = load('/Users/soliyan3261/Desktop/phi corr 170811/brch_corr_cont/R2_TM.mat');
con_raw = data.R2;
con_raw_acr = con_raw(1:63,64:126);
con_raw_acr_m = mean(con_raw_acr(:));
con_raw_acr_reshape = reshape(con_raw_acr,1,63*63);
con_raw_acr_std = std(con_raw_acr_reshape);
con_raw_wit_m = (sum(con_raw(:))-con_raw_acr_m*(63*63)*2-126)/7812;
con_raw_wit_reshape = [];
for i = 1:62
for j = i+1:63
    mat1 = con_raw(i,j);
    mat2 = [con_raw_wit_reshape,mat1];
    con_raw_wit_reshape = mat2;
end
end
for m = 64:125
for n = m+1:126
    mat3 = con_raw(m,n);
    mat4 = [con_raw_wit_reshape,mat3];
    con_raw_wit_reshape = mat4;
end
end
con_raw_wit_std = std(con_raw_wit_reshape);
data = load('/Users/soliyan3261/Desktop/phi corr 170811/brch_corr_cont_diff/R2_TM_condiff.mat');
con_diff = data.R2;
con_diff_acr = con_diff(1:63,64:126);
con_diff_acr_m = mean(con_diff_acr(:));
con_diff_acr_reshape = reshape(con_diff_acr,1,63*63);
con_diff_acr_std = std(con_diff_acr_reshape);
con_diff_wit_m = (sum(con_diff(:))-con_diff_acr_m*(63*63)*2-126)/7812;
con_diff_wit_reshape = [];
for i = 1:62
for j = i+1:63
    mat1 = con_diff(i,j);
    mat2 = [con_diff_wit_reshape,mat1];
    con_diff_wit_reshape = mat2;
end
end
for m = 64:125
for n = m+1:126
    mat3 = con_diff(m,n);
    mat4 = [con_diff_wit_reshape,mat3];
    con_diff_wit_reshape = mat4;
end
end
con_diff_wit_std = std(con_diff_wit_reshape);
data = load('/Users/soliyan3261/Desktop/phi corr 170811/brch_corr_diff/R2_TM.mat');
con_diff_bin = data.R2;
con_diff_bin_acr = con_diff_bin(1:63,64:126);
con_diff_bin_acr_m = mean(con_diff_bin_acr(:));
con_diff_bin_acr_reshape = reshape(con_diff_bin_acr,1,63*63);
con_diff_bin_acr_std = std(con_diff_bin_acr_reshape);
con_diff_bin_wit_m = (sum(con_diff_bin(:))-con_diff_bin_acr_m*(63*63)*2-126)/7812;
con_diff_bin_wit_reshape = [];
for i = 1:62
for j = i+1:63
    mat1 = con_diff_bin(i,j);
    mat2 = [con_diff_bin_wit_reshape,mat1];
    con_diff_bin_wit_reshape = mat2;
end
end
for m = 64:125
for n = m+1:126
    mat3 = con_diff(m,n);
    mat4 = [con_diff_bin_wit_reshape,mat3];
   con_diff_bin_wit_reshape = mat4;
end
end
con_diff_bin_wit_std = std(con_diff_bin_wit_reshape);
data = load('/Users/soliyan3261/Desktop/phi corr 170811/brch_phi_diff/PHI_TM.mat');
phi_diff = data.phi;
phi_diff_acr = phi_diff(1:63,64:126);
phi_diff_acr_m = mean(phi_diff_acr(:));
phi_diff_acr_reshape = reshape(phi_diff_acr,1,63*63);
phi_diff_acr_std = std(phi_diff_acr_reshape);
phi_diff_wit_m = (sum(phi_diff(:))-phi_diff_acr_m*(63*63)*2)/7812;
phi_diff_wit_reshape = [];
for i = 1:62
for j = i+1:63
    mat1 = phi_diff(i,j);
    mat2 = [phi_diff_wit_reshape,mat1];
    phi_diff_wit_reshape = mat2;
end
end
for m = 64:125 
for n = m+1:126
    mat3 = phi_diff(m,n);
    mat4 = [phi_diff_wit_reshape,mat3];
    phi_diff_wit_reshape = mat4;
end
end
phi_diff_wit_std = std(con_diff_wit_reshape);

bar_matrix_TM = [con_raw_wit_m,con_raw_acr_m,con_diff_wit_m,con_diff_acr_m,con_diff_bin_wit_m,con_diff_bin_acr_m;];

bar_mat = (bar_matrix_TM+bar_matrix_TM+bar_matrix_TM )/3;
figure(1);hold on;
bar_std = [con_raw_wit_std,con_raw_acr_std,con_diff_wit_std,con_diff_acr_std,con_diff_bin_wit_std,con_diff_bin_acr_std];
bar(bar_mat);
%set(gca,'xticklabel',{'R^{2} - Continuous raw data','R^{2} - Continuous differentiated data','R^{2} - Binarised differentiated data','\Phi - based on binarized differentiated data'});legend('Within Brain','Across Brain')
title('')
er = errorbar([1:6],bar_mat,bar_std);
