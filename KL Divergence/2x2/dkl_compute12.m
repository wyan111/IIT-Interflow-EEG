% data = load('alldata.mat');
% alldata = data.alldata;
%Dkl btw trial1~6 of TPM btw WL s113&114 at TM Condition and  trial 1~6 of TPM btw WLs113 $ MDs113 at
%TM condition
ch11 = 113; ch12 = 114;ch21 = 113;ch22 = 113;
for i = 1:6
for    j = 1:6
    Dkl_PQ11(i,j) = dkl_twoTPM(alldata(1,i),alldata(1,i),alldata(1,j),alldata(2,j),ch11,ch12,ch21,ch22);
end
end
%Dkl btw trial1~6 of TPM btw WL s113&114 at TMRV Condition and  trial 1~6 of TPM btw WLs113 $ MDs113 at
%TMRV condition
ch11 = 113; ch12 = 114;ch21 = 113;ch22 = 113;
for i = 1:6
for    j = 1:6
    Dkl_PQ22(i,j) = dkl_twoTPM(alldata(3,i),alldata(3,i),alldata(3,j),alldata(4,j),ch11,ch12,ch21,ch22);
end
end
%Dkl btw trial1~6 of TPM btw WL s113&114 at TMOC Condition and  trial 1~6 of TPM btw WLs113 $ MDs113 at
%TM condition
ch11 = 113; ch12 = 114;ch21 = 113;ch22 = 113;
for i = 1:6
for    j = 1:6
    Dkl_PQ33(i,j) = dkl_twoTPM(alldata(5,i),alldata(5,i),alldata(5,j),alldata(6,j),ch11,ch12,ch21,ch22);
end
end
%Dkl btw trial1~6 of TPM btw WL s113&114 at TM Condition and  trial 1~6 of TPM btw WLs113 $ MDs113 at
%TMRV condition
ch11 = 113; ch12 = 114;ch21 = 113;ch22 = 113;
for i = 1:6
for    j = 1:6
    Dkl_PQ12(i,j) = dkl_twoTPM(alldata(1,i),alldata(1,i),alldata(3,j),alldata(4,j),ch11,ch12,ch21,ch22);
end
end
%Dkl btw trial1~6 of TPM btw WL s113&114 at TM Condition and  trial 1~6 of TPM btw WLs113 $ MDs113 at
%TMOC condition
ch11 = 113; ch12 = 114;ch21 = 113;ch22 = 113;
for i = 1:6
for    j = 1:6
    Dkl_PQ13(i,j) = dkl_twoTPM(alldata(1,i),alldata(1,i),alldata(5,j),alldata(6,j),ch11,ch12,ch21,ch22);
end
end
%Dkl btw trial1~6 of TPM btw WL s113&114 at TMRV Condition and  trial 1~6 of TPM btw WLs113 $ MDs113 at
%TM condition
ch11 = 113; ch12 = 114;ch21 = 113;ch22 = 113;
for i = 1:6
for    j = 1:6
    Dkl_PQ21(i,j) = dkl_twoTPM(alldata(3,i),alldata(3,i),alldata(1,j),alldata(2,j),ch11,ch12,ch21,ch22);
end
end
%Dkl btw trial1~6 of TPM btw WL s113&114 at TMRV Condition and  trial 1~6 of TPM btw WLs113 $ MDs113 at
%TMOC condition
ch11 = 113; ch12 = 114;ch21 = 113;ch22 = 113;
for i = 1:6
for    j = 1:6
    Dkl_PQ23(i,j) = dkl_twoTPM(alldata(3,i),alldata(3,i),alldata(5,j),alldata(6,j),ch11,ch12,ch21,ch22);
end
end
%Dkl btw trial1~6 of TPM btw WL s113&114 at TMOC Condition and  trial 1~6 of TPM btw WLs113 $ MDs113 at
%TM condition
ch11 = 113; ch12 = 114;ch21 = 113;ch22 = 113;
for i = 1:6
for    j = 1:6
    Dkl_PQ31(i,j) = dkl_twoTPM(alldata(5,i),alldata(5,i),alldata(1,j),alldata(2,j),ch11,ch12,ch21,ch22);
end
end
%Dkl btw trial1~6 of TPM btw WL s113&114 at TMOC Condition and  trial 1~6 of TPM btw WLs113 $ MDs113 at
%TMRV condition
ch11 = 113; ch12 = 114;ch21 = 113;ch22 = 113;
for i = 1:6
for    j = 1:6
    Dkl_PQ32(i,j) = dkl_twoTPM(alldata(5,i),alldata(5,i),alldata(3,j),alldata(4,j),ch11,ch12,ch21,ch22);
end
end
% 
% tog12 = [Dkl_PQ11 Dkl_PQ12 Dkl_PQ13;Dkl_PQ21 Dkl_PQ22 Dkl_PQ23;Dkl_PQ31 Dkl_PQ32 Dkl_PQ33];
% 
% figure(1);imagesc(tog12);
% title("");colorbar;
%ylabel('TMOC');xlabel('TMRV');
% set(gca,'xticklabel',{'Trial 1','Trial 2','Trial3','Trial 4','Trial 5','Trial6'});
% set(gca,'yticklabel',{'Trial 1','Trial 2','Trial3','Trial 4','Trial 5','Trial6'});
togave12 = [sum(Dkl_PQ11(:))/30 sum(Dkl_PQ12(:))/36 sum(Dkl_PQ13(:))/36;sum(Dkl_PQ21(:))/36 sum(Dkl_PQ22(:))/30 sum(Dkl_PQ23(:))/36;sum(Dkl_PQ31(:))/36 sum(Dkl_PQ32(:))/36 sum(Dkl_PQ33(:))/30];
% figure(2);imagesc(togave12);
% title("");colorbar;
