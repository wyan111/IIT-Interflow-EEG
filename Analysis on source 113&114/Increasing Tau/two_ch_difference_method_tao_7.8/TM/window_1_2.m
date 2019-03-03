function [window1,window2] = window_1_2(matrix)
size_matrix = size(matrix);
epoch_num = size_matrix(1);
time_point = size_matrix(2);
%window 1
window1 = [];
for iEpo = 1:epoch_num;
    for iT = 1:time_point/2;
    window1(iEpo,iT) = (matrix(iEpo,2*iT-1)+matrix(iEpo,2*iT))/2;
    end
end
%window 2
window2 = [];
for iEpo = 1:epoch_num;
    for iT = 1:time_point/2-1;
    window2(iEpo,iT) = (matrix(iEpo,2*iT)+matrix(iEpo,2*iT+1))/2;
    end
end