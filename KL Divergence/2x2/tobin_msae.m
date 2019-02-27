function binary = tobin(twoDmatrix) 
size_matrix = size(twoDmatrix);
mMatrix = median(twoDmatrix);
eponum = size_matrix(1);timelen = size_matrix(2);
for iTime = 1:timelen;
   for iEpo = 1:eponum;
        if twoDmatrix(iEpo,iTime) > mMatrix(iTime)
        binary(iEpo,iTime) = 1;
   else
        binary(iEpo,iTime) = 0;
   end
   end
end
end