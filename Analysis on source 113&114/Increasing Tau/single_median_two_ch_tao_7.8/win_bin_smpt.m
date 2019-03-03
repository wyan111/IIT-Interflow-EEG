function [win1b,win2b] = win_bin_smpt(matrix)
size_matrix = size(matrix);
epoch_num = size_matrix(1);
time_point = size_matrix(2);
%win 1
win1 = [];
for iEpo = 1:epoch_num;
    for iT = 1:time_point/2;
    win1(iEpo,iT) = (matrix(iEpo,2*iT-1)+matrix(iEpo,2*iT))/2;
    end
end
%win 2
win2 = [];
for iEpo = 1:epoch_num;
    for iT = 1:time_point/2-1;
    win2(iEpo,iT) = (matrix(iEpo,2*iT)+matrix(iEpo,2*iT+1))/2;
    end
end
win1b = bin_smpt(win1);
win2b = bin_smpt(win2);
