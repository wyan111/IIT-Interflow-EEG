function binary = tobin_smpt(twoDmatrix)
mMatrix = median(twoDmatrix(:))
size_mat = size(twoDmatrix);
eponum = size_mat(1);timelen = size_mat(2);
for iTime = 1:timelen;
    for iEpo = 1:eponum;
    if twoDmatrix(iEpo,iTime) > mMatrix
        binary(iEpo,iTime) = 1;
    else
        binary(iEpo,iTime) = 0;
    end
    end
end
end