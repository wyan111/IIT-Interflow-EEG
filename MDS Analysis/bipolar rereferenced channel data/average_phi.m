file = dir('/Users/soliyan3261/Desktop/MDS/brch/phi-diff/brch-diff-*.mat');
data_oc_sum = 0;data_rv_sum = 0;data_tm_sum = 0;
%oc
for i = 1:9
data = load(file(i).name);
data = data.oc_tri;
data_oc_sum = data_oc_sum+data;
end
data_oc_ave = data_oc_sum/9;
figure
imagesc(data_oc_ave)
colormap(gray);colorbar;
set(gca,'xtick',[32,95]);set(gca,'ytick',[32,95]);set(gca,'FontSize',12);
set(gca,'xticklabel',{'BR channel 1~63 of P1','BR channel 1~63 of P2'});set(gca,'yticklabel',{'BR channel 1~63 of P1','BR channel 1~63 of P2'});
title('Non-social Flow - Difference Binarise')
%rv
for i = 10:18
data = load(file(i).name);
data = data.rv_tri;
data_rv_sum = data_rv_sum+data;
end
data_rv_ave = data_rv_sum/9;
figure
imagesc(data_rv_ave)
colormap(gray);colorbar;
set(gca,'xtick',[32,95]);set(gca,'ytick',[32,95]);set(gca,'FontSize',12);
set(gca,'xticklabel',{'BR channel 1~63 of P1','BR channel 1~63 of P2'});set(gca,'yticklabel',{'BR channel 1~63 of P1','BR channel 1~63 of P2'});
title('Social Non-flow - Difference Binarise')
%tm
for i = 19:27
data = load(file(i).name);
data = data.tm_tri;
data_tm_sum = data_tm_sum+data;
end
data_tm_ave = data_tm_sum/9;
figure
imagesc(data_tm_ave)
colormap(gray);colorbar;
set(gca,'xtick',[32,95]);set(gca,'ytick',[32,95]);set(gca,'FontSize',12);
set(gca,'xticklabel',{'BR channel 1~63 of P1','BR channel 1~63 of P2'});set(gca,'yticklabel',{'BR channel 1~63 of P1','BR channel 1~63 of P2'});
title('Social Flow - Difference Binarise')
%across condition
data_ave = (data_oc_ave+data_rv_ave+data_tm_ave)/3;
figure
imagesc(data_ave)
colormap(gray);colorbar;
set(gca,'xtick',[32,95]);set(gca,'ytick',[32,95]);set(gca,'FontSize',12);
set(gca,'xticklabel',{'BR channel 1~63 of P1','BR channel 1~63 of P2'});set(gca,'yticklabel',{'BR channel 1~63 of P1','BR channel 1~63 of P2'});
title('Across Conditions - Difference Binarise')