clear
file = 'sld170811.mat';
connum1 = 5; 
connum2 = 6;
ch1 = 113;
ch2 = 114;
value = load(file);
value = value.alldata;
data11 = [];data12 = [];data21 = [];data22 = [];
for iTri = 1:6
    mat3 = [];
    mat1 = value{connum1,iTri};
    mat2 = squeeze(mat1(ch1,:,:))';
    mat3 = [data11;mat2]; 
    data11 = mat3;
end
for iTri = 1:6
    mat3 = [];
    mat1 = value{connum1,iTri};
    mat2 = squeeze(mat1(ch2,:,:))';
    mat3 = [data12;mat2]; 
    data12 = mat3;
end
for iTri = 1:6
    mat3 = [];
    mat1 = value{connum2,iTri};
    mat2 = squeeze(mat1(ch1,:,:))';
    mat3 = [data21;mat2]; 
    data21 = mat3;
end
for iTri = 1:6
    mat3 = [];
    mat1 = value{connum2,iTri};
    mat2 = squeeze(mat1(ch2,:,:))';
    mat3 = [data22;mat2]; 
    data22 = mat3;
end

[win111b,win112b,win113b,win114b] = win_bin_smpt(data11);
[win121b,win122b,win123b,win124b] = win_bin_smpt(data12);
[win211b,win212b,win213b,win214b] = win_bin_smpt(data21);
[win221b,win222b,win223b,win224b] = win_bin_smpt(data22);

%first window
[sbshis1_win1,sbnhis1_win1] = histo(win111b,win121b);
[sbshis2_win1,sbnhis2_win1] = histo(win111b,win211b);
[sbshis3_win1,sbnhis3_win1] = histo(win111b,win221b);
[sbshis4_win1,sbnhis4_win1] = histo(win121b,win211b);
[sbshis5_win1,sbnhis5_win1] = histo(win121b,win221b);
[sbshis6_win1,sbnhis6_win1] = histo(win211b,win221b);
%second window
[sbshis1_win2,sbnhis1_win2] = histo(win112b,win122b);
[sbshis2_win2,sbnhis2_win2] = histo(win112b,win212b);
[sbshis3_win2,sbnhis3_win2] = histo(win112b,win222b);
[sbshis4_win2,sbnhis4_win2] = histo(win122b,win212b);
[sbshis5_win2,sbnhis5_win2] = histo(win122b,win222b);
[sbshis6_win2,sbnhis6_win2] = histo(win212b,win222b);
%third window
[sbshis1_win3,sbnhis1_win3] = histo(win113b,win123b);
[sbshis2_win3,sbnhis2_win3] = histo(win113b,win213b);
[sbshis3_win3,sbnhis3_win3] = histo(win113b,win223b);
[sbshis4_win3,sbnhis4_win3] = histo(win123b,win213b);
[sbshis5_win3,sbnhis5_win3] = histo(win123b,win223b);
[sbshis6_win3,sbnhis6_win3] = histo(win213b,win223b);
%fourth window
[sbshis1_win4,sbnhis1_win4] = histo(win114b,win124b);
[sbshis2_win4,sbnhis2_win4] = histo(win114b,win214b);
[sbshis3_win4,sbnhis3_win4] = histo(win114b,win224b);
[sbshis4_win4,sbnhis4_win4] = histo(win124b,win214b);
[sbshis5_win4,sbnhis5_win4] = histo(win124b,win224b);
[sbshis6_win4,sbnhis6_win4] = histo(win214b,win224b);
%Compute state-by-node TPM
sbshis1 = sbshis1_win1+sbshis1_win2+sbshis1_win3+sbshis1_win4;
sbshis2 = sbshis2_win1+sbshis2_win2+sbshis2_win3+sbshis2_win4;
sbshis3 = sbshis3_win1+sbshis3_win2+sbshis3_win3+sbshis3_win4;
sbshis4 = sbshis4_win1+sbshis4_win2+sbshis4_win3+sbshis4_win4;
sbshis5 = sbshis5_win1+sbshis5_win2+sbshis5_win3+sbshis5_win4;
sbshis6 = sbshis6_win1+sbshis6_win2+sbshis6_win3+sbshis6_win4;
%Compute sbn histogram
sbnhis1(:,1) = sbshis1(:,2)+sbshis1(:,4);
sbnhis2(:,1) = sbshis2(:,2)+sbshis2(:,4);
sbnhis3(:,1) = sbshis3(:,2)+sbshis3(:,4);
sbnhis4(:,1) = sbshis4(:,2)+sbshis4(:,4);
sbnhis5(:,1) = sbshis5(:,2)+sbshis5(:,4);
sbnhis6(:,1) = sbshis6(:,2)+sbshis6(:,4);
sbnhis1(:,2) = sbshis1(:,3)+sbshis1(:,4);
sbnhis2(:,2) = sbshis2(:,3)+sbshis2(:,4);
sbnhis3(:,2) = sbshis3(:,3)+sbshis3(:,4);
sbnhis4(:,2) = sbshis4(:,3)+sbshis4(:,4);
sbnhis5(:,2) = sbshis5(:,3)+sbshis5(:,4);
sbnhis6(:,2) = sbshis6(:,3)+sbshis6(:,4);
%Compute sbn TPM
sbnTPM1 = sbnhis1./((sum(sbshis1'))');
sbnTPM2 = sbnhis2./((sum(sbshis2'))');
sbnTPM3 = sbnhis3./((sum(sbshis3'))');
sbnTPM4 = sbnhis4./((sum(sbshis4'))');
sbnTPM5 = sbnhis5./((sum(sbshis5'))');
sbnTPM6 = sbnhis6./((sum(sbshis6'))');
%Compute frequency
fre1 =  ((sum(sbshis1'))')/sum(sbshis1(:));
fre2 =  ((sum(sbshis2'))')/sum(sbshis2(:));
fre3 =  ((sum(sbshis3'))')/sum(sbshis3(:));
fre4 =  ((sum(sbshis4'))')/sum(sbshis4(:));
fre5 =  ((sum(sbshis5'))')/sum(sbshis5(:));
fre6 =  ((sum(sbshis6'))')/sum(sbshis6(:));
%put everything together
%State-by-state TPM
TPM(1,1) = {sbnTPM1};
TPM(1,2) = {sbnTPM2};
TPM(1,3) = {sbnTPM3};
TPM(1,4) = {sbnTPM4};
TPM(1,5) = {sbnTPM5};
TPM(1,6) = {sbnTPM6};
%Frequency
TPM(2,1) = {fre1};
TPM(2,2) = {fre2};
TPM(2,3) = {fre3};
TPM(2,4) = {fre4};
TPM(2,5) = {fre5};
TPM(2,6) = {fre6};
