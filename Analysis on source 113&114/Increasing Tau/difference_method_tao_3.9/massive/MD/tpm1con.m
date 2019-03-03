function [frequency,TPM] = tpm1con(par1trial1,par1trial2,par1trial3,par1trial4,par1trial5,par1trial6,channum1,channum2)
%load the files - 6 trials for each participants, 12 files in total
%dataset_participant number_trial number
dataset1 = load(par1trial1);
dataset2 = load(par1trial2);
dataset3 = load(par1trial3);
dataset4 = load(par1trial4);
dataset5 = load(par1trial5);
dataset6 = load(par1trial6);
%Obatin source localized raw data
%2-Dimensional value-TrialNumber-ChannelNumber
value11 = squeeze(dataset1.Value(channum1,:,:));value12 = squeeze(dataset1.Value(channum2,:,:));
value21 = squeeze(dataset2.Value(channum1,:,:));value22 = squeeze(dataset2.Value(channum2,:,:));
value31 = squeeze(dataset3.Value(channum1,:,:));value32 = squeeze(dataset3.Value(channum2,:,:));
value41 = squeeze(dataset4.Value(channum1,:,:));value42 = squeeze(dataset4.Value(channum2,:,:));
value51 = squeeze(dataset5.Value(channum1,:,:));value52 = squeeze(dataset5.Value(channum2,:,:));
value61 = squeeze(dataset6.Value(channum1,:,:));value62 = squeeze(dataset6.Value(channum2,:,:)); 
%number of time point and epoches (for each trial, the size of Values are the same)
size_value = size(value11);epochnum(1) = size_value(2);
size_value = size(value21);epochnum(2) = size_value(2);
size_value = size(value31);epochnum(3) = size_value(2);
size_value = size(value41);epochnum(4) = size_value(2);
size_value = size(value51);epochnum(5) = size_value(2);
size_value = size(value61);epochnum(6) = size_value(2);
timepoints = size_value(1);
%Binarized raw data - Trial 1
%channel 1
raw_bin_11 = tobin(value11,epochnum(1));
%channel 2
raw_bin_12 = tobin(value12,epochnum(1));
%Binarized raw data - Trial 2
%channel 1
raw_bin_21 = tobin(value21,epochnum(2));
%channel 2
raw_bin_22 = tobin(value22,epochnum(2));
%Binarized raw data - Trial 3
%channel 1
raw_bin_31 = tobin(value31,epochnum(3));
%channel 2
raw_bin_32 = tobin(value32,epochnum(3));  
%Binarized raw data - Trial 4
%channel 1
raw_bin_41 = tobin(value41,epochnum(4));
%channel 2
raw_bin_42 = tobin(value42,epochnum(4)); 
%Binarized raw data - Trial 5
%channel 1
raw_bin_51 = tobin(value51,epochnum(5));
%channel 2
raw_bin_52 = tobin(value52,epochnum(5)); 
%Binarized raw data - Trial 6%channel 1
raw_bin_61 = tobin(value61,epochnum(6));
%channel 2
raw_bin_62 = tobin(value62,epochnum(6)); 

%build TPM
a11 = 0;a12 = 0;a13 = 0;a14 = 0;a21 = 0;a22 = 0;a23 = 0;a24 = 0;
a31 = 0;a32 = 0;a33 = 0;a34 = 0;a41 = 0;a42 = 0;a43 = 0;a44 = 0;

%Trial1
for iEpo = 1:epochnum(1)
    mat4tpm(1,:) = raw_bin_11(iEpo,:);
    mat4tpm(2,:) = raw_bin_12(iEpo,:);
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
    mat4tpm(1,:) = raw_bin_21(iEpo,:);
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
    mat4tpm(1,:) = raw_bin_31(iEpo,:);
    mat4tpm(2,:) = raw_bin_32(iEpo,:);
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
    mat4tpm(1,:) = raw_bin_41(iEpo,:);
    mat4tpm(2,:) = raw_bin_42(iEpo,:);
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
    mat4tpm(1,:) = raw_bin_51(iEpo,:);
    mat4tpm(2,:) = raw_bin_52(iEpo,:);
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
    mat4tpm(1,:) = raw_bin_61(iEpo,:);
    mat4tpm(2,:) = raw_bin_62(iEpo,:);
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
