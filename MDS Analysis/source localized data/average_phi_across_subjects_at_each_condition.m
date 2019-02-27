file = dir('/Users/soliyan3261/Desktop/MDS/sld/phi-diff/sld-diff-*.mat');
%pair 1~8 are at oc condition, pair 8~16 are at rv condition and pair 17~24
%are at tm condition
data_oc_sum = 0;data_rv_sum = 0;data_tm_sum = 0;
%oc
for i = 1:8
data = load(file(i).name);
data = data.oc_tri;
data_oc_sum = data_oc_sum+data;
end
data_oc_ave = data_oc_sum/8;
%plot
figure
imagesc(data_oc_ave)
colormap(gray);colorbar;
set(gca,'xtick',[74,222]);set(gca,'ytick',[74,222]);set(gca,'FontSize',12);
set(gca,'xticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});set(gca,'yticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});
title('Non-social Flow - Difference Binarise')
%rv
for i = 9:16
data = load(file(i).name);
data = data.rv_tri;
data_rv_sum = data_rv_sum+data;
end
data_rv_ave = data_rv_sum/8;
figure
imagesc(data_rv_ave)
colormap(gray);colorbar;
set(gca,'xtick',[74,222]);set(gca,'ytick',[74,222]);set(gca,'FontSize',12);
set(gca,'xticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});set(gca,'yticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});
title('Social Non-flow - Difference Binarise')
%tm
for i = 17:24
data = load(file(i).name);
data = data.tm_tri;
data_tm_sum = data_tm_sum+data;
end
data_tm_ave = data_tm_sum/8;
figure
imagesc(data_tm_ave)
colormap(gray);colorbar;
set(gca,'xtick',[74,222]);set(gca,'ytick',[74,222]);set(gca,'FontSize',12);
set(gca,'xticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});set(gca,'yticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});
title('Social Flow - Difference Binarise')
%average across conditions
data_ave = (data_oc_ave+data_rv_ave+data_tm_ave)/3;
figure
imagesc(data_ave)
colormap(gray);colorbar;
set(gca,'xtick',[74,222]);set(gca,'ytick',[74,222]);set(gca,'FontSize',12);
set(gca,'xticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});set(gca,'yticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});
title('Across Conditions - Difference Binarise')