function binary = tobin(twoDmatrix,eponum)
for iEpo = 1:eponum;
    diff_mat = diff(twoDmatrix(iEpo,:));
    size_diff = size(diff_mat);
   for iTpoint = 1:size_diff(2)
       if diff_mat(iTpoint) > 0
           binary(iEpo,iTpoint) = 1;
       else
           binary(iEpo,iTpoint) = 0;
       end
   end
end