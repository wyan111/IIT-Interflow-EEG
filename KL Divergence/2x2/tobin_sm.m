%single median per trial
function binary = tobin_sglMpT(twoDmatrix) 
size_matrix = size(twoDmatrix);
mMatrix = median(twoDmatrix(:));
eponum = size_matrix(1);timelen = size_matrix(2);
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