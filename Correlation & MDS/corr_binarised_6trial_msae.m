clear
alldata = load('sld170811.mat');
data = alldata.alldata;
new1 = [];new2 = [];
for iTri = 1:6
    datamat1 = cell2mat(data(1,iTri));
    [Ch,T,Ep] = size(datamat1);
for iCh = 1:Ch
    array1 = [];
    mat = squeeze(datamat1(iCh,:,:))';
    mat1 = bin_msae(mat); [a,b] = size(mat1);
    array1 = reshape(mat1',a*b,1);
    allarray1(:,iCh) = array1;
end
    new1 = [new1;allarray1]; 
    allarray1 = [];
end
for iTri = 1:6
    datamat2 = cell2mat(data(2,iTri));
    [Ch,T,Ep] = size(datamat2);
for iCh = 1:Ch
    array2 = [];
    mat = squeeze(datamat2(iCh,:,:))';
    mat2 = bin_msae(mat);[a,b] = size(mat2);
    array2 = reshape(mat2',a*b,1);
    allarray2(:,iCh) = array2;
end
    new2 = [new2;allarray2]; 
    allarray2 = [];
end

r = corr([new1 new2]);
R2 = r.^2;
figure(2)
imagesc(R2)
set(gca,'xtick',[74,222]);set(gca,'ytick',[74,222])
set(gca,'xticklabel',{'Source 1~148 of WL','Source 1~148 of MD'});set(gca,'yticklabel',{'Source 1~148 of WL','Source 1~148 of MD'});
title('R squared - Trial 1~6');colorbar;colormap(gray);

