function [frequency,TPM] = tpm1con(par1trial1,par2trial1,par1trial2,par2trial2,par1trial3,par2trial3,par1trial4,par2trial4,par1trial5,par2trial5,par1trial6,par2trial6,channum1,channum2)
%load the files - 6 trials for each participants, 12 files in total
%dataset_participant number_trial number
dataset11 = load(par1trial1);dataset21 = load(par2trial1);
dataset12 = load(par1trial2);dataset22 = load(par2trial2);
dataset13 = load(par1trial3);dataset23 = load(par2trial3);
dataset14 = load(par1trial4);dataset24 = load(par2trial4);
dataset15 = load(par1trial5);dataset25 = load(par2trial5);
dataset16 = load(par1trial6);dataset26 = load(par2trial6);
%Obatin source localized raw data
%2-Dimensional
value11 = squeeze(dataset11.Value(channum1,:,:)); value21 = squeeze(dataset21.Value(channum2,:,:));
value12 = squeeze(dataset12.Value(channum1,:,:)); value22 = squeeze(dataset22.Value(channum2,:,:));
value13 = squeeze(dataset13.Value(channum1,:,:)); value23 = squeeze(dataset23.Value(channum2,:,:));
value14 = squeeze(dataset14.Value(channum1,:,:)); value24 = squeeze(dataset24.Value(channum2,:,:));
value15 = squeeze(dataset15.Value(channum1,:,:)); value25 = squeeze(dataset25.Value(channum2,:,:));
value16 = squeeze(dataset16.Value(channum1,:,:)); value26 = squeeze(dataset26.Value(channum2,:,:));
%number of time point and epoches (for each trial, the size of Values are the same)
size_value = size(value11);epochnum(1) = size_value(2);
size_value = size(value12);epochnum(2) = size_value(2);
size_value = size(value13);epochnum(3) = size_value(2);
size_value = size(value14);epochnum(4) = size_value(2);
size_value = size(value15);epochnum(5) = size_value(2);
size_value = size(value16);epochnum(6) = size_value(2);
timepoints = size_value(1);
%Binarized raw data - Trial 1
%participant 1
raw_bin_11 = tobin(value11,epochnum(1));
%participant 2
raw_bin_21 = tobin(value21,epochnum(1));
%Binarized raw data - Trial 2
%participant 1
raw_bin_12 = tobin(value12,epochnum(2));
%participant 2
raw_bin_22 = tobin(value22,epochnum(2)); 
%Binarized raw data - Trial 3
%participant 1
raw_bin_13 = tobin(value13,epochnum(3)); 
%participant 2
raw_bin_23 = tobin(value23,epochnum(3)); 
%Binarized raw data - Trial 4
%participant 1
raw_bin_14 = tobin(value14,epochnum(4)); 
%participant 2
raw_bin_24 = tobin(value24,epochnum(4)); 
%Binarized raw data - Trial 5
%participant 1
raw_bin_15 = tobin(value15,epochnum(5)); 
%participant 2
raw_bin_25 = tobin(value25,epochnum(5)); 
%Binarized raw data - Trial 6
%participant 1
raw_bin_16 = tobin(value16,epochnum(6)); 
%participant 2
raw_bin_26 = tobin(value26,epochnum(6)); 
%build TPM
a11 = 0;a12 = 0;a13 = 0;a14 = 0;a21 = 0;a22 = 0;a23 = 0;a24 = 0;
a31 = 0;a32 = 0;a33 = 0;a34 = 0;a41 = 0;a42 = 0;a43 = 0;a44 = 0;

%Trial1
for iEpo = 1:epochnum(1)
    mat4tpm(1,:) = raw_bin_11(iEpo,:);
    mat4tpm(2,:) = raw_bin_21(iEpo,:);
for i = 1:timepoints-2
    if mat4tpm(1,i) == 0 & mat4tpm(2,i) == 0
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a11 = a11+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a12 = a12+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a13 = a13+1;
        else
            a14 = a14+1;
        end
     elseif mat4tpm(1,i) == 1 & mat4tpm(2,i) == 0
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a21 = a21+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a22 = a22+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a23 = a23+1;
        else
            a24 = a24+1;
            end
    
     elseif mat4tpm(1,i) == 0 & mat4tpm(2,i) == 1
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a31 = a31+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a32 = a32+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a33 = a33+1;
        else
            a34 = a34+1;
            end

     elseif mat4tpm(1,i) == 1 & mat4tpm(2,i) == 1
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a41 = a41+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a42 = a42+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a43 = a43+1;
        else
            a44 = a44+1;
            end
    end
end
end
% Trial2
for iEpo = 1:epochnum(2)
    mat4tpm(1,:) = raw_bin_12(iEpo,:);
    mat4tpm(2,:) = raw_bin_22(iEpo,:);
for i = 1:timepoints-2
    if mat4tpm(1,i) == 0 & mat4tpm(2,i) == 0
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a11 = a11+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a12 = a12+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a13 = a13+1;
        else
            a14 = a14+1;
        end
     elseif mat4tpm(1,i) == 1 & mat4tpm(2,i) == 0
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a21 = a21+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a22 = a22+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a23 = a23+1;
        else
            a24 = a24+1;
            end
    
     elseif mat4tpm(1,i) == 0 & mat4tpm(2,i) == 1
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a31 = a31+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a32 = a32+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a33 = a33+1;
        else
            a34 = a34+1;
            end

     elseif mat4tpm(1,i) == 1 & mat4tpm(2,i) == 1
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a41 = a41+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a42 = a42+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a43 = a43+1;
        else
            a44 = a44+1;
            end
    end
end
end
% Trial3
for iEpo = 1:epochnum(3)
    mat4tpm(1,:) = raw_bin_13(iEpo,:);
    mat4tpm(2,:) = raw_bin_23(iEpo,:);
for i = 1:timepoints-2
    if mat4tpm(1,i) == 0 & mat4tpm(2,i) == 0
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a11 = a11+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a12 = a12+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a13 = a13+1;
        else
            a14 = a14+1;
        end
     elseif mat4tpm(1,i) == 1 & mat4tpm(2,i) == 0
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a21 = a21+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a22 = a22+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a23 = a23+1;
        else
            a24 = a24+1;
            end
    
     elseif mat4tpm(1,i) == 0 & mat4tpm(2,i) == 1
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a31 = a31+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a32 = a32+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a33 = a33+1;
        else
            a34 = a34+1;
            end

     elseif mat4tpm(1,i) == 1 & mat4tpm(2,i) == 1
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a41 = a41+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a42 = a42+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a43 = a43+1;
        else
            a44 = a44+1;
            end
    end
end
end
% Trial4
for iEpo = 1:epochnum(4)
    mat4tpm(1,:) = raw_bin_14(iEpo,:);
    mat4tpm(2,:) = raw_bin_24(iEpo,:);
for i = 1:timepoints-2
    if mat4tpm(1,i) == 0 & mat4tpm(2,i) == 0
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a11 = a11+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a12 = a12+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a13 = a13+1;
        else
            a14 = a14+1;
        end
     elseif mat4tpm(1,i) == 1 & mat4tpm(2,i) == 0
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a21 = a21+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a22 = a22+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a23 = a23+1;
        else
            a24 = a24+1;
            end
    
     elseif mat4tpm(1,i) == 0 & mat4tpm(2,i) == 1
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a31 = a31+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a32 = a32+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a33 = a33+1;
        else
            a34 = a34+1;
            end

     elseif mat4tpm(1,i) == 1 & mat4tpm(2,i) == 1
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a41 = a41+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a42 = a42+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a43 = a43+1;
        else
            a44 = a44+1;
            end
    end
end
end
% Trial5
for iEpo = 1:epochnum(5)
    mat4tpm(1,:) = raw_bin_15(iEpo,:);
    mat4tpm(2,:) = raw_bin_25(iEpo,:);
for i = 1:timepoints-2
    if mat4tpm(1,i) == 0 & mat4tpm(2,i) == 0
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a11 = a11+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a12 = a12+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a13 = a13+1;
        else
            a14 = a14+1;
        end
     elseif mat4tpm(1,i) == 1 & mat4tpm(2,i) == 0
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a21 = a21+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a22 = a22+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a23 = a23+1;
        else
            a24 = a24+1;
            end
    
     elseif mat4tpm(1,i) == 0 & mat4tpm(2,i) == 1
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a31 = a31+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a32 = a32+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a33 = a33+1;
        else
            a34 = a34+1;
            end

     elseif mat4tpm(1,i) == 1 & mat4tpm(2,i) == 1
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a41 = a41+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a42 = a42+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a43 = a43+1;
        else
            a44 = a44+1;
            end
    end
end
end
% Trial6
for iEpo = 1:epochnum(6)
    mat4tpm(1,:) = raw_bin_16(iEpo,:);
    mat4tpm(2,:) = raw_bin_26(iEpo,:);
for i = 1:timepoints-2
    if mat4tpm(1,i) == 0 & mat4tpm(2,i) == 0
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a11 = a11+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a12 = a12+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a13 = a13+1;
        else
            a14 = a14+1;
        end
     elseif mat4tpm(1,i) == 1 & mat4tpm(2,i) == 0
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a21 = a21+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a22 = a22+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a23 = a23+1;
        else
            a24 = a24+1;
            end
    
     elseif mat4tpm(1,i) == 0 & mat4tpm(2,i) == 1
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a31 = a31+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a32 = a32+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a33 = a33+1;
        else
            a34 = a34+1;
            end

     elseif mat4tpm(1,i) == 1 & mat4tpm(2,i) == 1
        if mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 0
            a41 = a41+1;
        elseif mat4tpm(1,i+1) == 1 & mat4tpm(2,i+1) == 0
            a42 = a42+1;
        elseif mat4tpm(1,i+1) == 0 & mat4tpm(2,i+1) == 1
            a43 = a43+1;
        else
            a44 = a44+1;
            end
    end
end
end
preTPM = [a11,a12,a13,a14;a21,a22,a23,a24;a31,a32,a33,a34;a41,a42,a43,a44];
frequency(1,:) = sum(preTPM(1,:))/sum(preTPM(:));
frequency(2,:) = sum(preTPM(2,:))/sum(preTPM(:));
frequency(3,:) = sum(preTPM(3,:))/sum(preTPM(:));
frequency(4,:) = sum(preTPM(4,:))/sum(preTPM(:));
TPM(1,:) = preTPM(1,:)/sum(preTPM(1,:));
TPM(2,:) = preTPM(2,:)/sum(preTPM(2,:));
TPM(3,:) = preTPM(3,:)/sum(preTPM(3,:));
TPM(4,:) = preTPM(4,:)/sum(preTPM(4,:));
end
