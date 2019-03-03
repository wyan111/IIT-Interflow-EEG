%median split
function TPM = tpm_twoch(par1trial1,par2trial1,par1trial2,par2trial2,par1trial3,par2trial3,par1trial4,par2trial4,par1trial5,par2trial5,par1trial6,par2trial6,channum1,channum2)
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
size_matrix = size(par1chan1);eponum1=size_matrix(1);
%binarize each dataset
par1chan1b = tobin(par1chan1,eponum1);
par1chan2b = tobin(par1chan2,eponum1);
par2chan1b = tobin(par2chan1,eponum1);
par2chan2b = tobin(par2chan2,eponum1);
%compute histogram (state-by-state and state-by-node) of window 1
%tpm type_combination number_window number
%six combinations between 4 sources
[sbshis1,sbnhis1] = histogram(par1chan1b,par1chan2b);
[sbshis2,sbnhis2] = histogram(par1chan1b,par2chan1b);
[sbshis3,sbnhis3] = histogram(par1chan1b,par2chan2b);
[sbshis4,sbnhis4] = histogram(par1chan2b,par2chan1b);
[sbshis5,sbnhis5] = histogram(par1chan2b,par2chan2b);
[sbshis6,sbnhis6] = histogram(par2chan1b,par2chan2b);
%Compute state-by-node TPM
%sbnhis_combination number
for i = 1:4
sbnTPM1(i,:) = (sbnhis1(i,:))/(sum(sbshis1(i,:)));
end
for i = 1:4
sbnTPM2(i,:) = (sbnhis2(i,:))/(sum(sbshis2(i,:)));
end
for i = 1:4
sbnTPM3(i,:) = (sbnhis3(i,:))/(sum(sbshis3(i,:)));
end
for i = 1:4
sbnTPM4(i,:) = (sbnhis4(i,:))/(sum(sbshis4(i,:)));
end
for i = 1:4
sbnTPM5(i,:) = (sbnhis5(i,:))/(sum(sbshis5(i,:)));
end
for i = 1:4
sbnTPM6(i,:) = (sbnhis6(i,:))/(sum(sbshis6(i,:)));
end
%Compute state-by-state TPM
for i = 1:4
sbsTPM1(i,:) = (sbshis1(i,:))/(sum(sbshis1(i,:)));
end
for i = 1:4
sbsTPM2(i,:) = (sbshis2(i,:))/(sum(sbshis2(i,:)));
end
for i = 1:4
sbsTPM3(i,:) = (sbshis3(i,:))/(sum(sbshis3(i,:)));
end
for i = 1:4
sbsTPM4(i,:) = (sbshis4(i,:))/(sum(sbshis4(i,:)));
end
for i = 1:4
sbsTPM5(i,:) = (sbshis5(i,:))/(sum(sbshis5(i,:)));
end
for i = 1:4
sbsTPM6(i,:) = (sbshis6(i,:))/(sum(sbshis6(i,:)));
end
%Compute frequency
for i = 1:4
fre1(i) = (sum(sbshis1(i,:)))/(sum(sbshis1(:)));
end
for i = 1:4
fre2(i) = (sum(sbshis2(i,:)))/(sum(sbshis2(:)));
end
for i = 1:4
fre3(i) = (sum(sbshis3(i,:)))/(sum(sbshis3(:)));
end
for i = 1:4
fre4(i) = (sum(sbshis4(i,:)))/(sum(sbshis4(:)));
end
for i = 1:4
fre5(i) = (sum(sbshis5(i,:)))/(sum(sbshis5(:)));
end
for i = 1:4
fre6(i) = (sum(sbshis6(i,:)))/(sum(sbshis6(:)));
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