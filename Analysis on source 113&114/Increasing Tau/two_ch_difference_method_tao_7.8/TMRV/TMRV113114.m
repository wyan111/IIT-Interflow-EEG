%difference method
clear
TPM = tpm_thirdwin('TMRV11.mat','TMRV21.mat','TMRV12.mat','TMRV22.mat','TMRV13.mat','TMRV23.mat','TMRV14.mat','TMRV24.mat','TMRV15.mat','TMRV25.mat','TMRV16.mat','TMRV26.mat',113,114);
save('TPM_TMRV.mat','TPM');

% for i = 1:6
%     figure(i)
%     imagesc(cell2mat(TPM(2,i)),[0 1]);colorbar;
%     set(gca,'xticklabel',{'','00','','10','','01','','11'});
%     set(gca,'yticklabel',{'','00','','10','','01','','11'});
%     colormap(gray(256));
% end
% for i = 7:12
%     figure(i)
%     imagesc(cell2mat(TPM(1,i-6)));colorbar;
%     set(gca,'yticklabel',{'','00','','10','','01','','11'});
%     set(gca,'xticklabel',{'','A=1','','B=1'});
%     colormap(gray(256));set(colorbar, 'ylim', [0 0.6])
% end
