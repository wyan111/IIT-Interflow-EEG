function Dkl_PQ = dklpri(P,Q)
%current: i1 = 00,i2 = 10,i3 = 01,i4 = 11
%future:  j1 = 00,j2 = 10,j3 = 01,j4 = 11
Dkl_PQ = 0;
Dkl_QP = 0;
for i = 1:4
    for j = 1:4
        Dkl_PQ = Dkl_PQ + P(i,j)*log(P(i,j)/Q(i,j));
    end
end
