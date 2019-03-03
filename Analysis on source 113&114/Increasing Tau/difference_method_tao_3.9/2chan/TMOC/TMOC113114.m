%median split
clear
TPM = tpm_twoch('TMOC11.mat','TMOC21.mat','TMOC12.mat','TMOC22.mat','TMOC13.mat','TMOC23.mat','TMOC14.mat','TMOC24.mat','TMOC15.mat','TMOC25.mat','TMOC16.mat','TMOC26.mat',113,114);
save('TPM_TMOC.mat','TPM')

phi = [0.00715739 0.00028337 0.00108477 0.00099231 0.00036136 0.0056926];
bar_phi = bar(phi)
grid on;
set(gca,'xticklabel',{' ',' ',' ',' '});
ylabel('Phi');title('Phi - difference binarise method - TMOC - S113 and S114 -Tao 3.9 ms')


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