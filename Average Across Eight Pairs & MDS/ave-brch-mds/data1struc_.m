clear
file = dir('/Users/soliyan3261/Desktop/ave-brch-mds/brch*.mat');
len = length(file);
new1 = [];new2 = [];
firstpeople = [1,3,5];secondpeople = [2,4,6];
trialmat1 = {};trialmat2 = {};
%first person
for iPair = 1:len
BR_data = load(file(iPair).name);
data = BR_data.BR_data;
for iWcon = 1:3
for iTri = 1:6
    datamat1 = cell2mat(data(firstpeople(iWcon),iTri));
    [Ch,T,Ep] = size(datamat1);
for i = 1:Ch
    array1 = [];
    mat1 = squeeze(datamat1(i,:,1:22)); [r,c] = size(mat1);
    array1 = reshape(mat1,r*c,1);
    allarray1(:,i) = array1;
end
    trialmat1(iPair,iTri+(iWcon-1)*6) = {allarray1}; 
    allarray1 = [];
end

for iWcon = 1:3
for iTri = 1:6
    datamat2 = cell2mat(data(secondpeople(iWcon),iTri));
    [Ch,T,Ep] = size(datamat2);
for i = 1:Ch
    array2 = [];
    mat2 = squeeze(datamat2(i,:,1:22)); [r,c] = size(mat2);
    array2 = reshape(mat2,r*c,1);
    allarray2(:,i) = array2;
end
    trialmat2(iPair,iTri+(iWcon-1)*6) = {allarray2}; 
    allarray2 = [];
end
end
end
end
sixteenP = [trialmat1;trialmat2];
% r = corr([new1 new2]);
% R2 = r.^2;
% figure(1);
% imagesc(R2)
%74 222
% set(gca,'xtick',[74,222]);set(gca,'ytick',[74,222])
% set(gca,'xticklabel',{'Source 1~148 of WL','Source 1~148 of MD'});set(gca,'yticklabel',{'Source 1~148 of WL','Source 1~148 of MD'});
% title('R squared - Trial 1~6');colorbar;colormap(gray);
% for channel data
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

