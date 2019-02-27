function TPM = tpm(channel1,channel2)
a11 = 0;a12 = 0;a13 = 0;a14 = 0;a21 = 0;a22 = 0;a23 = 0;a24 = 0;
a31 = 0;a32 = 0;a33 = 0;a34 = 0;a41 = 0;a42 = 0;a43 = 0;a44 = 0;
size_matrix = size(channel1);
eponum = size_matrix(1); time = size_matrix(2);
for iEpo = 1:eponum
    mat4tpm(1,:) = channel1(iEpo,:);
    mat4tpm(2,:) = channel2(iEpo,:);
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
counts = [a11,a12,a13,a14;a21,a22,a23,a24;a31,a32,a33,a34;a41,a42,a43,a44;];
TPM(1,:) = counts(1,:)/sum(counts(1,:));
TPM(2,:) = counts(2,:)/sum(counts(2,:));
TPM(3,:) = counts(3,:)/sum(counts(3,:));
TPM(4,:) = counts(4,:)/sum(counts(4,:));
end
