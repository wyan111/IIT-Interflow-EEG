function [win1b,win2b,win3b,win4b] = win_bin_diff(matrix)
size_matrix = size(matrix);
epoch_num = size_matrix(1);
time_point = size_matrix(2);
%win 1
win1 = [];
for iEpo = 1:epoch_num
    for iT = 1:time_point/4
    win1(iEpo,iT) = (matrix(iEpo,4*iT-3)+matrix(iEpo,4*iT-2)+matrix(iEpo,4*iT-1)+matrix(iEpo,4*iT))/4;
    end
end
%win 2
win2 = [];
for iEpo = 1:epoch_num
    for iT = 1:time_point/4-1
    win2(iEpo,iT) = (matrix(iEpo,4*iT-2)+matrix(iEpo,4*iT-1)+matrix(iEpo,4*iT)+matrix(iEpo,4*iT+1))/4;
    end
end
%win 3
win3 = [];
for iEpo = 1:epoch_num
    for iT = 1:time_point/4-1
    win3(iEpo,iT) = (matrix(iEpo,4*iT-1)+matrix(iEpo,4*iT)+matrix(iEpo,4*iT+1)+matrix(iEpo,4*iT+2))/4;
    end
end
%win 4
win4 = [];
for iEpo = 1:epoch_num
    for iT = 1:time_point/4-1
    win4(iEpo,iT) = (matrix(iEpo,4*iT)+matrix(iEpo,4*iT+1)+matrix(iEpo,4*iT+2)+matrix(iEpo,4*iT+3))/4;
    end
end
win1b = bin_smpt(win1);
win2b = bin_smpt(win2);
win3b = bin_smpt(win3);
win4b = bin_smpt(win4);