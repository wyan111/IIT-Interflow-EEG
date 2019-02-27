%histog(filename,condition of the first channel,condition of the second
%channel,condition of the third channel,condition of the fourth channel,
%channel number,channel number,channel number,channel number)
%bin_smpt uses median split binarise method, and bin_diff uses difference
%binarise method
function [sbnTPM,frequency] = histog(datafile,cond1,cond2,cond3,cond4,ch1,ch2,ch3,ch4)
dataset = load(datafile);
alldata = dataset.alldata;
a = zeros(16,16);

[row,tri] = size(alldata);
for iTri = 1:tri
cell1 = alldata(cond1,iTri);
cell2 = alldata(cond2,iTri);
cell3 = alldata(cond3,iTri);
cell4 = alldata(cond4,iTri);
mat1 = cell2mat(cell1);
mat2 = cell2mat(cell2);
mat3 = cell2mat(cell3);
mat4 = cell2mat(cell4);
twodmat1 = squeeze(mat1(ch1,:,:))';
twodmat2 = squeeze(mat2(ch2,:,:))';
twodmat3 = squeeze(mat3(ch3,:,:))';
twodmat4 = squeeze(mat4(ch4,:,:))';
twodmatbin1 = bin_smpt(twodmat1);
twodmatbin2 = bin_smpt(twodmat2);
twodmatbin3 = bin_smpt(twodmat3);
twodmatbin4 = bin_smpt(twodmat4);
[epo,timepoints] = size(twodmatbin4);
for iEpo = 1:epo
    mat(1,:) = twodmatbin1(iEpo,:);
    mat(2,:) = twodmatbin2(iEpo,:);
    mat(3,:) = twodmatbin3(iEpo,:);
    mat(4,:) = twodmatbin4(iEpo,:);
    [a4,tim] = size(mat);
    for i = 1:tim-1
        if mat(1,i) == 0 && mat(2,i) == 0 && mat(3,i) == 0 && mat(4,i) == 0         %1
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(1,1) = a(1,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(1,2) = a(1,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(1,3) = a(1,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(1,4) = a(1,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(1,5) = a(1,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(1,6) = a(1,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(1,7) = a(1,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8 
                a(1,8) = a(1,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(1,9) = a(1,9)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10 
                a(1,10) = a(1,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(1,11) = a(1,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(1,12) = a(1,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13
                a(1,13) = a(1,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14 
                a(1,14) = a(1,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(1,15) = a(1,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(1,16) = a(1,16)+1;
            end
        elseif mat(1,i) == 1 && mat(2,i) == 0 && mat(3,i) == 0 && mat(4,i) == 0     %2
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(2,1) = a(2,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(2,2) = a(2,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(2,3) = a(2,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(2,4) = a(2,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(2,5) = a(2,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(2,6) = a(2,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(2,7) = a(2,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8
                a(2,8) = a(2,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(2,9) = a(2,9)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10
                a(2,10) = a(2,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(2,11) = a(2,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(2,12) = a(2,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13 
                a(2,13) = a(2,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14
                a(2,14) = a(2,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(2,15) = a(2,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(2,16) = a(2,16)+1;
            end
        elseif mat(1,i) == 0 && mat(2,i) == 1 && mat(3,i) == 0 && mat(4,i) == 0     %3
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(3,1) = a(3,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(3,2) = a(3,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(3,3) = a(3,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(3,4) = a(3,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(3,5) = a(3,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(3,6) = a(3,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(3,7) = a(3,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8 
                a(3,8) = a(3,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(3,9) = a(3,9)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10 
                a(3,10) = a(3,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(3,11) = a(3,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(3,12) = a(3,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13 
                a(3,13) = a(3,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14 
                a(3,14) = a(3,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(3,15) = a(3,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(3,16) = a(3,16)+1;
            end
        elseif mat(1,i) == 1 && mat(2,i) == 1 && mat(3,i) == 0 && mat(4,i) == 0     %4
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(4,1) = a(4,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(4,2) = a(4,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(4,3) = a(4,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(4,4) = a(4,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(4,5) = a(4,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(4,6) = a(4,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(4,7) = a(4,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8 
                a(4,8) = a(4,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(4,9) = a(4,9)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10 
                a(4,10) = a(4,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(4,11) = a(4,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(4,12) = a(4,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13 
                a(4,13) = a(4,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14 
                a(4,14) = a(4,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(4,15) = a(4,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(4,16) = a(4,16)+1;
            end
        elseif mat(1,i) == 0 && mat(2,i) == 0 && mat(3,i) == 1 && mat(4,i) == 0     %5
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(5,1) = a(5,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(5,2) = a(5,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(5,3) = a(5,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(5,4) = a(5,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(5,5) = a(5,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(5,6) = a(5,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(5,7) = a(5,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8 
                a(5,8) = a(5,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(5,9) = a(5,9)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10 
                a(5,10) = a(5,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(5,11) = a(5,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(5,12) = a(5,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13 
                a(5,13) = a(5,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14 
                a(5,14) = a(5,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(5,15) = a(5,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(5,16) = a(5,16)+1;
            end
        elseif mat(1,i) == 1 && mat(2,i) == 0 && mat(3,i) == 1 && mat(4,i) == 0     %6
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(6,1) = a(6,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(6,2) = a(6,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(6,3) = a(6,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(6,4) = a(6,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(6,5) = a(6,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(6,6) = a(6,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(6,7) = a(6,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8 
                a(6,8) = a(6,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(6,9) = a(6,9)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10 
                a(6,10) = a(6,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(6,11) = a(6,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(6,12) = a(6,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13 
                a(6,13) = a(6,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14
                a(6,14) = a(6,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(6,15) = a(6,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(6,16) = a(6,16)+1;
            end
        elseif mat(1,i) == 0 && mat(2,i) == 1 && mat(3,i) == 1 && mat(4,i) == 0     %7
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(7,1) = a(7,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(7,2) = a(7,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(7,3) = a(7,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(7,4) = a(7,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(7,5) = a(7,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(7,6) = a(7,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(7,7) = a(7,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8 
                a(7,8) = a(7,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(7,9) = a(7,9)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10 
                a(7,10) = a(7,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(7,11) = a(7,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(7,12) = a(7,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13
                a(7,13) = a(7,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14
                a(7,14) = a(7,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(7,15) = a(7,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(7,16) = a(7,16)+1;
            end
        elseif mat(1,i) == 1 && mat(2,i) == 1 && mat(3,i) == 1 && mat(4,i) == 0     %8
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(8,1) = a(8,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(8,2) = a(8,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(8,3) = a(8,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(8,4) = a(8,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(8,5) = a(8,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(8,6) = a(8,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(8,7) = a(8,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8 
                a(8,8) = a(8,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(8,9) = a(8,9)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10 
                a(8,10) = a(8,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(8,11) = a(8,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(8,12) = a(8,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13 
                a(8,13) = a(8,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14 
                a(8,14) = a(8,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(8,15) = a(8,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(8,16) = a(8,16)+1;
            end
        elseif mat(1,i) == 0 && mat(2,i) == 0 && mat(3,i) == 0 && mat(4,i) == 1     %9
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(9,1) = a(9,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(9,2) = a(9,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(9,3) = a(9,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(9,4) = a(9,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(9,5) = a(9,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(9,6) = a(9,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(9,7) = a(9,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8
                a(9,8) = a(9,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(9,9) = a(9,9)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10 
                a(9,10) = a(9,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(9,11) = a(9,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(9,12) = a(9,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13 
                a(9,13) = a(9,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14 
                a(9,14) = a(9,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(9,15) = a(9,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(9,16) = a(9,16)+1;
            end
        elseif mat(1,i) == 1 && mat(2,i) == 0 && mat(3,i) == 0 && mat(4,i) == 1     %10 
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(10,1) = a(10,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(10,2) = a(10,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(10,3) = a(10,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(10,4) = a(10,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(10,5) = a(10,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(10,6) = a(10,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(10,7) = a(10,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8 
                a(10,8) = a(10,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(10,9) = a(10,9 )+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10
                a(10,10) = a(10,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(10,11) = a(10,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(10,12) = a(10,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13 
                a(10,13) = a(10,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14 
                a(10,14) = a(10,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(10,15) = a(10,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(10,16) = a(10,16)+1;
            end
        elseif mat(1,i) == 0 && mat(2,i) == 1 && mat(3,i) == 0 && mat(4,i) == 1     %11
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(11,1) = a(11,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(11,2) = a(11,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(11,3) = a(11,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(11,4) = a(11,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(11,5) = a(11,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(11,6) = a(11,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(11,7) = a(11,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8 
                a(11,8) = a(11,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(11,9) = a(11,9)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10 
                a(11,10) = a(11,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(11,11) = a(11,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(11,12) = a(11,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13 
                a(11,13) = a(11,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14 
                a(11,14) = a(11,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(11,15) = a(11,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(11,16) = a(11,16)+1;
            end
        elseif mat(1,i) == 1 && mat(2,i) == 1 && mat(3,i) == 0 && mat(4,i) == 1     %12
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(12,1) = a(12,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(12,2) = a(12,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(12,3) = a(12,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(12,4) = a(12,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(12,5) = a(12,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(12,6) = a(12,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(12,7) = a(12,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8 
                a(12,8) = a(12,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(12,9) = a(12,9)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10
                a(12,10) = a(12,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(12,11) = a(12,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(12,12) = a(12,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13 
                a(12,13) = a(12,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14 
                a(12,14) = a(12,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(12,15) = a(12,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(12,16) = a(12,16)+1;
            end
        elseif mat(1,i) == 0 && mat(2,i) == 0 && mat(3,i) == 1 && mat(4,i) == 1     %13
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(13,1) = a(13,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(13,2) = a(13,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(13,3) = a(13,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(13,4) = a(13,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(13,5) = a(13,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(13,6) = a(13,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(13,7) = a(13,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8 
                a(13,8) = a(13,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(13,9) = a(13,9)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10
                a(13,10) = a(13,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(13,11) = a(13,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(13,12) = a(13,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13 
                a(13,13) = a(13,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14 
                a(13,14) = a(13,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(13,15) = a(13,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(13,16) = a(13,16)+1;
            end
        elseif mat(1,i) == 1 && mat(2,i) == 0 && mat(3,i) == 1 && mat(4,i) == 1     %14 
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(14,1) = a(14,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(14,2) = a(14,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(14,3) = a(14,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(14,4) = a(14,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(14,5) = a(14,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(14,6) = a(14,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(14,7) = a(14,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8 
                a(14,8) = a(14,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(14,9) = a(14,9)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10
                a(14,10) = a(14,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(14,11) = a(14,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(14,12) = a(14,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13 
                a(14,13) = a(14,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14 
                a(14,14) = a(14,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(14,15) = a(14,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(14,16) = a(14,16)+1;
            end
        elseif mat(1,i) == 0 && mat(2,i) == 1 && mat(3,i) == 1 && mat(4,i) == 1     %15
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(15,1) = a(15,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(15,2) = a(15,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(15,3) = a(15,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(15,4) = a(15,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(15,5) = a(15,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(15,6) = a(15,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(15,7) = a(15,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8 
                a(15,8) = a(15,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(15,9) = a(15,9)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10 
                a(15,10) = a(15,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(15,11) = a(15,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(15,12) = a(15,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13 
                a(15,13) = a(15,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14 
                a(15,14) = a(15,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(15,15) = a(15,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(15,16) = a(15,16)+1;
            end
        elseif mat(1,i) == 1 && mat(2,i) == 1 && mat(3,i) == 1 && mat(4,i) == 1     %16
            if mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0         %1
                a(16,1) = a(16,1)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %2
                a(16,2) = a(16,2)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %3
                a(16,3) = a(16,3)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 0     %4
                a(16,4) = a(16,4)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %5
                a(16,5) = a(16,5)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %6
                a(16,6) = a(16,6)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %7
                a(16,7) = a(16,7)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 0     %8 
                a(16,8) = a(16,8)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %9
                a(16,9) = a(16,9)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %10 
                a(16,10) = a(16,10)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %11
                a(16,11) = a(16,11)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 0 && mat(4,i+1) == 1     %12
                a(16,12) = a(16,12)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %13
                a(16,13) = a(16,13)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 0 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %14
                a(16,14) = a(16,14)+1;
            elseif mat(1,i+1) == 0 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %15
                a(16,15) = a(16,15)+1;
            elseif mat(1,i+1) == 1 && mat(2,i+1) == 1 && mat(3,i+1) == 1 && mat(4,i+1) == 1     %16
                a(16,16) = a(16,16)+1;
            end
        end 
    end
end
end

for i = 1:16
frequency(i,:) = sum(a(i,:))/sum(a(:));
sbsTPM(i,:) = a(i,:)/sum(a(i,:));
end

sbnTPM(:,1) = sbsTPM(:,2)+sbsTPM(:,4)+sbsTPM(:,6)+sbsTPM(:,8)+sbsTPM(:,10)+sbsTPM(:,12)+sbsTPM(:,14)+sbsTPM(:,16);
sbnTPM(:,2) = sbsTPM(:,3)+sbsTPM(:,4)+sbsTPM(:,7)+sbsTPM(:,8)+sbsTPM(:,11)+sbsTPM(:,12)+sbsTPM(:,15)+sbsTPM(:,16);
sbnTPM(:,3) = sbsTPM(:,5)+sbsTPM(:,6)+sbsTPM(:,7)+sbsTPM(:,8)+sbsTPM(:,13)+sbsTPM(:,14)+sbsTPM(:,15)+sbsTPM(:,16);
sbnTPM(:,4) = sbsTPM(:,9)+sbsTPM(:,10)+sbsTPM(:,11)+sbsTPM(:,12)+sbsTPM(:,13)+sbsTPM(:,14)+sbsTPM(:,15)+sbsTPM(:,16);


        

        