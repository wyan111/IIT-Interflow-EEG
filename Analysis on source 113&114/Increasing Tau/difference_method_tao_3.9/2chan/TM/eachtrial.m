clear
dataset11 = load('TM14.mat');dataset21 = load('TM24.mat');
valuewl113 = squeeze(dataset11.Value(113,:,:))'; valuemd113 = squeeze(dataset21.Value(113,:,:))';
valuewl114 = squeeze(dataset11.Value(114,:,:))'; valuemd114 = squeeze(dataset21.Value(114,:,:))';
%eponum = 24


wl113_1b = tobin(wl113_1,eponum);
wl114_1b = tobin(wl114_1,eponum);
md113_1b = tobin(md113_1,eponum);
md114_1b = tobin(md114_1,eponum);

wl113_2b = tobin(wl113_2,eponum);
wl114_2b = tobin(wl114_2,eponum);
md113_2b = tobin(md113_2,eponum);
md114_2b = tobin(md114_2,eponum);

[sbshis1_win1,sbnhis1_win1] = histogram(wl113_1b,wl114_1b);
[sbshis2_win1,sbnhis2_win1] = histogram(wl113_1b,md113_1b);
[sbshis3_win1,sbnhis3_win1] = histogram(wl113_1b,md114_1b);
[sbshis4_win1,sbnhis4_win1] = histogram(wl114_1b,md113_1b);
[sbshis5_win1,sbnhis5_win1] = histogram(wl114_1b,md114_1b);
[sbshis6_win1,sbnhis6_win1] = histogram(md113_1b,md114_1b);

[sbshis1_win2,sbnhis1_win2] = histogram(wl113_2b,wl114_2b);
[sbshis2_win2,sbnhis2_win2] = histogram(wl113_2b,md113_2b);
[sbshis3_win2,sbnhis3_win2] = histogram(wl113_2b,md114_2b);
[sbshis4_win2,sbnhis4_win2] = histogram(wl114_2b,md113_2b);
[sbshis5_win2,sbnhis5_win2] = histogram(wl114_2b,md114_2b);
[sbshis6_win2,sbnhis6_win2] = histogram(md113_2b,md114_2b);

%Compute state-by-node TPM
%sbnhis_combination number
for i = 1:4
sbnTPM1(i,:) = (sbnhis1_win1(i,:)+sbnhis1_win2(i,:))/(sum(sbshis1_win1(i,:))+sum(sbshis1_win2(i,:)));
end
for i = 1:4
sbnTPM2(i,:) = (sbnhis2_win1(i,:)+sbnhis2_win2(i,:))/(sum(sbshis2_win1(i,:))+sum(sbshis2_win2(i,:)));
end
for i = 1:4
sbnTPM3(i,:) = (sbnhis3_win1(i,:)+sbnhis3_win2(i,:))/(sum(sbshis3_win1(i,:))+sum(sbshis3_win2(i,:)));
end
for i = 1:4
sbnTPM4(i,:) = (sbnhis4_win1(i,:)+sbnhis4_win2(i,:))/(sum(sbshis4_win1(i,:))+sum(sbshis4_win2(i,:)));
end
for i = 1:4
sbnTPM5(i,:) = (sbnhis5_win1(i,:)+sbnhis5_win2(i,:))/(sum(sbshis5_win1(i,:))+sum(sbshis5_win2(i,:)));
end
for i = 1:4
sbnTPM6(i,:) = (sbnhis6_win1(i,:)+sbnhis6_win2(i,:))/(sum(sbshis6_win1(i,:))+sum(sbshis6_win2(i,:)));
end
%Compute state-by-state TPM
for i = 1:4
sbsTPM1(i,:) = (sbshis1_win1(i,:)+sbshis1_win2(i,:))/(sum(sbshis1_win1(i,:))+sum(sbshis1_win2(i,:)));
end
for i = 1:4
sbsTPM2(i,:) = (sbshis2_win1(i,:)+sbshis2_win2(i,:))/(sum(sbshis2_win1(i,:))+sum(sbshis2_win2(i,:)));
end
for i = 1:4
sbsTPM3(i,:) = (sbshis3_win1(i,:)+sbshis3_win2(i,:))/(sum(sbshis3_win1(i,:))+sum(sbshis3_win2(i,:)));
end
for i = 1:4
sbsTPM4(i,:) = (sbshis4_win1(i,:)+sbshis4_win2(i,:))/(sum(sbshis4_win1(i,:))+sum(sbshis4_win2(i,:)));
end
for i = 1:4
sbsTPM5(i,:) = (sbshis5_win1(i,:)+sbshis5_win2(i,:))/(sum(sbshis5_win1(i,:))+sum(sbshis5_win2(i,:)));
end
for i = 1:4
sbsTPM6(i,:) = (sbshis6_win1(i,:)+sbshis6_win2(i,:))/(sum(sbshis6_win1(i,:))+sum(sbshis6_win2(i,:)));
end
%Compute frequency
for i = 1:4
fre1(i) = (sum(sbshis1_win1(i,:))+sum(sbshis1_win2(i,:)))/(sum(sbshis1_win1(:))+sum(sbshis1_win2(:)));
end
for i = 1:4
fre2(i) = (sum(sbshis2_win1(i,:))+sum(sbshis2_win2(i,:)))/(sum(sbshis2_win1(:))+sum(sbshis2_win2(:)));
end
for i = 1:4
fre3(i) = (sum(sbshis3_win1(i,:))+sum(sbshis3_win2(i,:)))/(sum(sbshis3_win1(:))+sum(sbshis3_win2(:)));
end
for i = 1:4
fre4(i) = (sum(sbshis4_win1(i,:))+sum(sbshis4_win2(i,:)))/(sum(sbshis4_win1(:))+sum(sbshis4_win2(:)));
end
for i = 1:4
fre5(i) = (sum(sbshis5_win1(i,:))+sum(sbshis5_win2(i,:)))/(sum(sbshis5_win1(:))+sum(sbshis5_win2(:)));
end
for i = 1:4
fre6(i) = (sum(sbshis6_win1(i,:))+sum(sbshis6_win2(i,:)))/(sum(sbshis6_win1(:))+sum(sbshis6_win2(:)));
end
%Put them in cell
%state-by-node TPM
TPM(1,1) = {sbnTPM1};
TPM(1,2) = {sbnTPM2};
TPM(1,3) = {sbnTPM3};
TPM(1,4) = {sbnTPM4};
TPM(1,5) = {sbnTPM5};
TPM(1,6) = {sbnTPM6};
%State-by-state TPM
TPM(2,1) = {sbsTPM1};
TPM(2,2) = {sbsTPM2};
TPM(2,3) = {sbsTPM3};
TPM(2,4) = {sbsTPM4};
TPM(2,5) = {sbsTPM5};
TPM(2,6) = {sbsTPM6};
%Frequency
TPM(3,1) = {fre1};
TPM(3,2) = {fre2};
TPM(3,3) = {fre3};
TPM(3,4) = {fre4};
TPM(3,5) = {fre5};
TPM(3,6) = {fre6};

% for i = 1:6
%     figure(i)
%     imagesc(cell2mat(TPM(2,i)),[0 1]);colorbar;
%     set(gca,'xticklabel',{'','00','','10','','01','','11'});
%     set(gca,'yticklabel',{'','00','','10','','01','','11'});
%     colormap(gray);
%     set(colorbar, 'ylim')
% end

%save('TPM_TMTrial2.mat','TPM');