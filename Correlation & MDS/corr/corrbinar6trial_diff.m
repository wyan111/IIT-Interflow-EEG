clear
alldata = load('sld170811.mat');
data =alldata.alldata;
new1 = [];new2 = [];
for iTri = 1:6
    datamat1 = cell2mat(data(5,iTri));
    [Ch,T,Ep] = size(datamat1);
for iCh = 1:Ch
    array1 = [];
    mat = squeeze(datamat1(iCh,:,:))';
    mat1 = bin_diff(mat);
    array1 = reshape(mat1',(T-1)*Ep,1);
    allarray1(:,iCh) = array1;
end
    new1 = [new1;allarray1]; 
    allarray1 = [];
end
for iTri = 1:6
    datamat2 = cell2mat(data(6,iTri));
    [Ch,T,Ep] = size(datamat2);
for iCh = 1:Ch
    array2 = [];
    mat = squeeze(datamat2(iCh,:,:))';
    mat2 = bin_diff(mat);
    size(mat2);
    array2 = reshape(mat2',(T-1)*Ep,1);
    allarray2(:,iCh) = array2;
end
    new2 = [new2;allarray2]; 
    allarray2 = [];
end

r = corr([new1 new2]);
R2 = r.^2;
% figure(1)
% imagesc(R2)
% set(gca,'xtick',[74,222]);set(gca,'ytick',[74,222])
% set(gca,'xticklabel',{'Source 1~148 of WL','Source 1~148 of MD'});set(gca,'yticklabel',{'Source 1~148 of WL','Source 1~148 of MD'});
% title('R squared - Trial 1~6');colorbar;colormap(gray);
% set(gca,'xtick',[32,95]);set(gca,'ytick',[32,95])
% set(gca,'xticklabel',{'Pair 1~63 of WL','Pair 1~63 of MD'});set(gca,'yticklabel',{'Pair 1~63 of WL','Pair 1~63 of MD'});
% title('R squared - Trial 1~6');colorbar;colormap(gray);

% figure(2)
% R2temp = R2';R2new = reshape(R2temp(~eye(size(R2temp))), size(R2, 2)-1, [])';
% h = histogram(R2new,[0:0.01:1]);
% h.Normalization = 'probability';
% cum = cumsum(h.Values);
% grid on;xlabel('R squared');ylabel('Frequency');title('Histogram (Total counts after removing diagonal = 87320)')
% figure(3);
% bar(cum);grid on;xlabel('R squared');ylabel('Cumulative sum');title('Cumulative');
% set(gca,'xticklabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
% figure(4);
% hacross = histogram(R2(149:296,1:148),[0:0.01:1]);
% hacross.Normalization = 'probability';
% grid on;xlabel('R squared');ylabel('Frequency');title('Histogram')

