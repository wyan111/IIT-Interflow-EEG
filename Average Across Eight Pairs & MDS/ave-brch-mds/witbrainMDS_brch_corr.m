file = dir('/Users/soliyan3261/Desktop/ave-brch-mds/brch*.mat');
len = length(file);R2sum = zeros(189,189);
for iF = 1:8
alldata = load(file(iF).name);
data = alldata.BR_data;
new1 = [];new2 = [];new3 = [];
for iTri = 1:6
    datamat1 = cell2mat(data(1,iTri));
    [Ch,T,Ep] = size(datamat1);
for i = 1:Ch
    array = [];
    mat1 = squeeze(datamat1(i,:,1:22)); [r,c] = size(mat1);
    array1 = reshape(mat1,r*c,1);
    allarray1(:,i) = array1;
end
    new1 = [new1;allarray1]; 
    allarray1 = [];
end
for iTri = 1:6
    datamat2 = cell2mat(data(3,iTri));
    [Ch,T,Ep] = size(datamat2);
for i = 1:Ch
    array2 = [];
    mat2 = squeeze(datamat2(i,:,1:22)); [r,c] = size(mat2);
    array2 = reshape(mat2,r*c,1);
    allarray2(:,i) = array2;
end
    new2 = [new2;allarray2]; 
    allarray2 = [];
end
for iTri = 1:6
    datamat3 = cell2mat(data(5,iTri));
    [Ch,T,Ep] = size(datamat3);
for i = 1:Ch
    array3 = [];
    mat3 = squeeze(datamat3(i,:,1:22)); [r,c] = size(mat3);
    array3 = reshape(mat3,r*c,1);
    allarray3(:,i) = array3;
end
    new3 = [new3;allarray3]; 
    allarray3 = [];
end
r = corr([new1 new2 new3]);
R2 = r.^2;
R2sum = R2sum+R2;
end
R2ave1 = R2sum;
%%
R2ave3 = (R2ave+R2ave1)/2;
imagesc(R2ave1)
set(gca,'xtick',[31.5,94.5 157.5]);set(gca,'ytick',[31.5,94.5 157.5])
set(gca,'xticklabel',{'InterFlow','InterNonflow','IndividualFlow'});set(gca,'yticklabel',{'InterFlow','InterNonflow','IndividualFlow'});
colorbar;colormap(gray);
figure
dissimilarity = 1-R2ave1;
[Y,e] = cmdscale(dissimilarity,2);
plot(Y(1:63,1),Y(1:63,2),'ro',Y(64:126,1),Y(64:126,2),'go',Y(127:189,1),Y(127:189,2),'co')
set(gca,'FontSize',16);
legend('InterFlow','InterNonflow','IndivFlow','location','northeast');grid on;title('MDS')

% figure(1);
% imagesc(R2)
%31.5 94.5
% set(gca,'xtick',[31.5,94.5]);set(gca,'ytick',[31.5,94.5])
% set(gca,'xticklabel',{'Source 1~63 of WL','Source 1~63 of MD'});set(gca,'yticklabel',{'Source 1~63 of WL','Source 1~63 of MD'});
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
% hacross = histogram(R2(64:126,1:63),[0:0.01:1]);
% hacross.Normalization = 'probability';
% grid on;xlabel('R squared');ylabel('Frequency');title('Histogram')

