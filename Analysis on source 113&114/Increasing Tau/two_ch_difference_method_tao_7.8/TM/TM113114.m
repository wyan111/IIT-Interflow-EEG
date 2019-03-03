%difference method
clear
TPM = tpm_thirdwin('TM11.mat','TM21.mat','TM12.mat','TM22.mat','TM13.mat','TM23.mat','TM14.mat','TM24.mat','TM15.mat','TM25.mat','TM16.mat','TM26.mat',113,114);
%save('TPM_TM.mat','TPM');

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
