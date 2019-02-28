clear
alldata = load('sld170811.mat');
data = alldata.alldata;
tri = 1;
datamat = cell2mat(data(1,tri));
size_mat = size(datamat);
%WL
for iSo = 1:148
    source = squeeze(datamat(iSo,:,:))';
    for iEp = 1:size_mat(3)
        onerow_1(iSo,(iEp-1)*size_mat(2)+1:iEp*size_mat(2)) = source(iEp,:);
    end
end

%MD
datamat = cell2mat(data(4,tri));
size_mat = size(datamat);
for iSo = 1:148
    source = squeeze(datamat(iSo,:,:))';
    for iEp = 1:size_mat(3)
        onerow_2(iSo,(iEp-1)*size_mat(2)+1:iEp*size_mat(2)) = source(iEp,:);
    end
end
tworow = [onerow_1' onerow_2'];
r = corr(tworow);
R2 = r.^2;
figure(2)
imagesc(R2)
set(gca,'xtick',[74,222]);set(gca,'ytick',[74,222])
set(gca,'xticklabel',{'Source 1~148 of WL','Source 1~148 of MD'});set(gca,'yticklabel',{'Source 1~148 of WL','Source 1~148 of MD'});
title('R squared - Trial 6');colorbar;colormap(gray);
