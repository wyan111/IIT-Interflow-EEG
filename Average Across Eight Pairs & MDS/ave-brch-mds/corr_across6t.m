% clear
% file = dir('/Users/soliyan3261/Desktop/ave-brch-mds/brch*.mat');
% for iF = 1:8
% alldata = load(file(iF).name);
% data = alldata.BR_data;
% new1 = [];new2 = [];
% for iTri = 1:6
%     datamat1 = cell2mat(data(5,iTri));
%     [Ch,T,Ep] = size(datamat1);
% for i = 1:Ch
%     array = [];
%     mat1 = squeeze(datamat1(i,:,:)); [r,c] = size(mat1);
%     array1 = reshape(mat1,r*c,1);
%     allarray1(:,i) = array1;
% end
%     new1 = [new1;allarray1]; 
%     allarray1 = [];
% end
% for iTri = 1:6
%     datamat2 = cell2mat(data(6,iTri));
%     [Ch,T,Ep] = size(datamat2);
% for i = 1:Ch
%     array2 = [];
%     mat2 = squeeze(datamat2(i,:,:)); [r,c] = size(mat2);
%     array2 = reshape(mat2,r*c,1);
%     allarray2(:,i) = array2;
% end
%     new2 = [new2;allarray2]; 
%     allarray2 = [];
% end
% r = corr([new1 new2]);
% R2 = r.^2;
% R2mat(1,iF) = {R2};
% end
% 
%     
% R2sum = zeros(126,126);
% for i = 1:8
%       R2sum = cell2mat(R2mat(1,i))+R2sum;
% end
% figure
% R2sum = R2sum/8;
% imagesc(R2sum);colorbar;colormap(gray)
% set(gca,'xtick',[31.5,94.5]);set(gca,'ytick',[31.5,94.5]);set(gca,'FontSize',12);
% set(gca,'xticklabel',{'BR channel 1~148 of P1','BR channel 1~148 of P2'});
% set(gca,'yticklabel',{'BR channel 1~148 of P1','BR channel 1~148 of P2'});title('Social Flow - Difference Binarise')

figure
a = load('tm.mat');
a = a.R2sum;
imagesc(a);colorbar;colormap(gray)
figure
b = load('rv.mat');
b = b.R2sum;imagesc(b);colorbar;colormap(gray)
c = load('oc.mat');
figure
c = c.R2sum;imagesc(c);colorbar;colormap(gray)
ave = (a+b+c)/3;
figure
imagesc(ave);colorbar;colormap(gray)
set(gca,'xtick',[31.5,94.5]);set(gca,'ytick',[31.5,94.5]);set(gca,'FontSize',12);
set(gca,'xticklabel',{'BR channel 1~148 of P1','BR channel 1~148 of P2'});
set(gca,'yticklabel',{'BR channel 1~148 of P1','BR channel 1~148 of P2'});title('Across Condition - Difference Binarise')
