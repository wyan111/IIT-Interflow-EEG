%difference method
clear
TPM = tpm_thirdwin('TMOC11.mat','TMOC21.mat','TMOC12.mat','TMOC22.mat','TMOC13.mat','TMOC23.mat','TMOC14.mat','TMOC24.mat','TMOC15.mat','TMOC25.mat','TMOC16.mat','TMOC26.mat',113,114);
save('TPM_TMOC.mat','TPM');

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
