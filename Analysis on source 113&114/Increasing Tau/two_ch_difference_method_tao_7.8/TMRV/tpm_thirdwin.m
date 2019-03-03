%median split
function TPM = tpm_thirdwin(par1trial1,par2trial1,par1trial2,par2trial2,par1trial3,par2trial3,par1trial4,par2trial4,par1trial5,par2trial5,par1trial6,par2trial6,channum1,channum2)
%load all data for 1 condition dimention : channel * time * epoch
dataset11 = load(par1trial1);dataset21 = load(par2trial1);
dataset12 = load(par1trial2);dataset22 = load(par2trial2);
dataset13 = load(par1trial3);dataset23 = load(par2trial3);
dataset14 = load(par1trial4);dataset24 = load(par2trial4);
dataset15 = load(par1trial5);dataset25 = load(par2trial5);
dataset16 = load(par1trial6);dataset26 = load(par2trial6);
% make the data two dimention epoch * time
% value_participant number_channel number_trial number
value111 = squeeze(dataset11.Value(channum1,:,:))'; value211 = squeeze(dataset21.Value(channum1,:,:))';
value112 = squeeze(dataset12.Value(channum1,:,:))'; value212 = squeeze(dataset22.Value(channum1,:,:))';
value113 = squeeze(dataset13.Value(channum1,:,:))'; value213 = squeeze(dataset23.Value(channum1,:,:))';
value114 = squeeze(dataset14.Value(channum1,:,:))'; value214 = squeeze(dataset24.Value(channum1,:,:))';
value115 = squeeze(dataset15.Value(channum1,:,:))'; value215 = squeeze(dataset25.Value(channum1,:,:))';
value116 = squeeze(dataset16.Value(channum1,:,:))'; value216 = squeeze(dataset26.Value(channum1,:,:))';
value121 = squeeze(dataset11.Value(channum2,:,:))'; value221 = squeeze(dataset21.Value(channum2,:,:))';
value122 = squeeze(dataset12.Value(channum2,:,:))'; value222 = squeeze(dataset22.Value(channum2,:,:))';
value123 = squeeze(dataset13.Value(channum2,:,:))'; value223 = squeeze(dataset23.Value(channum2,:,:))';
value124 = squeeze(dataset14.Value(channum2,:,:))'; value224 = squeeze(dataset24.Value(channum2,:,:))';
value125 = squeeze(dataset15.Value(channum2,:,:))'; value225 = squeeze(dataset25.Value(channum2,:,:))';
value126 = squeeze(dataset16.Value(channum2,:,:))'; value226 = squeeze(dataset26.Value(channum2,:,:))';
%put data of 6 trials into 1 matrix
par1chan1 = [value111;value112;value113;value114;value115;value116];
par1chan2 = [value121;value122;value123;value124;value125;value126];
par2chan1 = [value211;value212;value213;value214;value215;value216];
par2chan2 = [value221;value222;value223;value224;value225;value226];
%Plot
% figure(1);imagesc(par1chan1);
% figure(2);imagesc(par1chan2);
% figure(3);imagesc(par2chan1);
% figure(4);imagesc(par2chan2);
% window_Participant number_channel number_window number
[win11_1,win11_2] = window_1_2(par1chan1);
[win12_1,win12_2] = window_1_2(par1chan2);
[win21_1,win21_2] = window_1_2(par2chan1);
[win22_1,win22_2] = window_1_2(par2chan2);
size_w1 = size(win11_1);
eponum = size_w1(1);
%binarize each dataset
%window 1
win11_1b = tobin(win11_1,eponum);
win12_1b = tobin(win12_1,eponum);
win21_1b = tobin(win21_1,eponum);
win22_1b = tobin(win22_1,eponum);
%window 2
win11_2b = tobin(win11_2,eponum);
win12_2b = tobin(win12_2,eponum);
win21_2b = tobin(win21_2,eponum);
win22_2b = tobin(win22_2,eponum);
%compute histogram (state-by-state and state-by-node) of window 1
%tpm type_combination number_window number
%six combinations between 4 sources
[sbshis1_win1,sbnhis1_win1] = histogram(win11_1b,win12_1b);
[sbshis2_win1,sbnhis2_win1] = histogram(win11_1b,win21_1b);
[sbshis3_win1,sbnhis3_win1] = histogram(win11_1b,win22_1b);
[sbshis4_win1,sbnhis4_win1] = histogram(win12_1b,win21_1b);
[sbshis5_win1,sbnhis5_win1] = histogram(win12_1b,win22_1b);
[sbshis6_win1,sbnhis6_win1] = histogram(win21_1b,win22_1b);
%compute histogram (state-by-state and state-by-node) of window 2
%tpm type_combination number_window number
%six combinations between 4 sources
[sbshis1_win2,sbnhis1_win2] = histogram(win11_2b,win12_2b);
[sbshis2_win2,sbnhis2_win2] = histogram(win11_2b,win21_2b);
[sbshis3_win2,sbnhis3_win2] = histogram(win11_2b,win22_2b);
[sbshis4_win2,sbnhis4_win2] = histogram(win12_2b,win21_2b);
[sbshis5_win2,sbnhis5_win2] = histogram(win12_2b,win22_2b);
[sbshis6_win2,sbnhis6_win2] = histogram(win21_2b,win22_2b);
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
end