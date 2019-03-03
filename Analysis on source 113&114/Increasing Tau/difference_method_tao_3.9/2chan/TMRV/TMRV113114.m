%median split
clear
TPM = tpm_twoch('TMRV11.mat','TMRV21.mat','TMRV12.mat','TMRV22.mat','TMRV13.mat','TMRV23.mat','TMRV14.mat','TMRV24.mat','TMRV15.mat','TMRV25.mat','TMRV16.mat','TMRV26.mat',113,114);
save('TPM_TMRV.mat','TPM')

phi = [0.00368498 0.00036165 0.00065475 0.0005558  0.00149313 0.00357451];
bar_phi = bar(phi)
grid on;
set(gca,'xticklabel',{' ',' ',' ',' '});
ylabel('Phi');title('Phi - difference binarise method - TMRV - S113 and S114 -Tao 3.9 ms')
% for i = 1:6;
%     figure(i)
%     imagesc(cell2mat(TPM(2,i)));colorbar;
%     set(gca,'xticklabel',{'','00','','10','','01','','11'});
%     set(gca,'yticklabel',{'','00','','10','','01','','11'});
%     colormap(gray(256));set(colorbar, 'ylim', [0 1])
% end
% for i = 7:12;
%     figure(i)
%     imagesc(cell2mat(TPM(1,i-6)));colorbar;
%     set(gca,'yticklabel',{'','00','','10','','01','','11'});
%     set(gca,'xticklabel',{'','A=1','','B=1'});
%     colormap(gray(256));set(colorbar, 'ylim', [0 1])
% end