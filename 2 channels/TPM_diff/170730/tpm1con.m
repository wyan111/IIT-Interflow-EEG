function [frequency,sbnTPM] = tpm1con(datafile,cond_par1,cond_par2,ch1,ch2)
%initial value for building TPM
a11 = 0;a12 = 0;a13 = 0;a14 = 0;a21 = 0;a22 = 0;a23 = 0;a24 = 0;
a31 = 0;a32 = 0;a33 = 0;a34 = 0;a41 = 0;a42 = 0;a43 = 0;a44 = 0;
%load the data file
dataset = load(datafile);
alldata = dataset.BR_datadata;
size_data = size(alldata);Tri = size_data(2);
for iTri = 1:Tri
cell1 = alldata(cond_par1,iTri);
cell2 = alldata(cond_par2,iTri);
mat1 = cell2mat(cell1);
mat2 = cell2mat(cell2);
twodmat1 = squeeze(mat1(ch1,:,:))';
twodmat2 = squeeze(mat2(ch2,:,:))';
twodmatbin1 = bin_smpt(twodmat1);
twodmatbin2 = bin_smpt(twodmat2);
%size
[epo,time] = size(twodmatbin1);
for iEpo = 1:epo
    mat4tpm(1,:) = twodmatbin1(iEpo,:);
    mat4tpm(2,:) = twodmatbin2(iEpo,:);
for i = 1:time-1
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
end
preTPM = [a11,a12,a13,a14;a21,a22,a23,a24;a31,a32,a33,a34;a41,a42,a43,a44];
frequency(1,:) = sum(preTPM(1,:))/sum(preTPM(:));
frequency(2,:) = sum(preTPM(2,:))/sum(preTPM(:));
frequency(3,:) = sum(preTPM(3,:))/sum(preTPM(:));
frequency(4,:) = sum(preTPM(4,:))/sum(preTPM(:));
sbsTPM(1,:) = preTPM(1,:)/sum(preTPM(1,:));
sbsTPM(2,:) = preTPM(2,:)/sum(preTPM(2,:));
sbsTPM(3,:) = preTPM(3,:)/sum(preTPM(3,:));
sbsTPM(4,:) = preTPM(4,:)/sum(preTPM(4,:));
sbnTPM(:,1) = sbsTPM(:,2)+sbsTPM(:,4);
sbnTPM(:,2) = sbsTPM(:,3)+sbsTPM(:,4);
end
