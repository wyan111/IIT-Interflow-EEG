function binary = bin_smpt(twoDmatrix) 
%twoDmatrix : epoch x timepoint 
[eponum,timelen] = size(twoDmatrix);
mMatrix = median(twoDmatrix(:));
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