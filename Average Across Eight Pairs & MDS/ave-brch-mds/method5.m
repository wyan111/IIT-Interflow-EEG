%%
clear
file = dir('/Users/soliyan3261/Desktop/ave-brch-mds/brch*.mat');
len = length(file);
mat14 = zeros(8*36,8*36);
for iF = 1:8
    alldata = load(file(iF).name);
    data = alldata.BR_data;
    % Participant 1
    % TM
    for iTri = 1:6
        datamat1 = cell2mat(data(1,iTri));
        [Ch,T,Ep] = size(datamat1);
        for iCh = 1:Ch
        mat1 = squeeze(datamat1(iCh,:,1:Ep))';
        mat2 = mean(mat1)';
        mat3(:,iCh) = mat2;
        end
        mat4 = reshape(mat3,T*Ch,1);
        mat5(:,(iF-1)*36+iTri) = mat4;
    end
    % RV
    for iTri = 1:6
        datamat1 = cell2mat(data(3,iTri));
        [Ch,T,Ep] = size(datamat1);
        for iCh = 1:Ch
        mat6 = squeeze(datamat1(iCh,:,1:Ep))';
        mat7 = mean(mat6)';
        mat8(:,iCh) = mat7;
        end
        mat9 = reshape(mat8,T*Ch,1);
        mat5(:,(iF-1)*36+iTri+6) = mat9;
    end
    % OC
    for iTri = 1:6
        datamat1 = cell2mat(data(5,iTri));
        [Ch,T,Ep] = size(datamat1);
        for iCh = 1:Ch
        mat10 = squeeze(datamat1(iCh,:,1:Ep))';
        mat11 = mean(mat10)';
        mat12(:,iCh) = mat11;
        end
        mat13 = reshape(mat12,T*Ch,1);
        mat5(:,(iF-1)*36+iTri+12) = mat13;
    end
    % Participant 2
    % TM
    mat1 = [];mat2 = [];mat3 = [];mat4 = [];
    mat6 = [];mat7 = [];mat8 = [];mat9 = [];
    mat10 = [];mat11 = [];mat12 = [];mat13 = [];
    for iTri = 1:6
        datamat1 = cell2mat(data(2,iTri));
        [Ch,T,Ep] = size(datamat1);
        for iCh = 1:Ch
        mat1 = squeeze(datamat1(iCh,:,1:Ep))';
        mat2 = mean(mat1)';
        mat3(:,iCh) = mat2;
        end
        mat4 = reshape(mat3,T*Ch,1);
        mat5(:,(iF-1)*36+18+iTri) = mat4;
    end
    % RV
    for iTri = 1:6
        datamat1 = cell2mat(data(4,iTri));
        [Ch,T,Ep] = size(datamat1);
        for iCh = 1:Ch
        mat6 = squeeze(datamat1(iCh,:,1:Ep))';
        mat7 = mean(mat6)';
        mat8(:,iCh) = mat7;
        end
        mat9 = reshape(mat8,T*Ch,1);
        mat5(:,(iF-1)*36+iTri+24) = mat9;
    end
    % OC
    for iTri = 1:6
        datamat1 = cell2mat(data(6,iTri));
        [Ch,T,Ep] = size(datamat1);
        for iCh = 1:Ch
        mat10 = squeeze(datamat1(iCh,:,1:Ep))';
        mat11 = mean(mat10)';
        mat12(:,iCh) = mat11;
        end
        mat13 = reshape(mat12,T*Ch,1);
        mat5(:,(iF-1)*36+iTri+30) = mat13;
    end
end
%%
r = corr(mat5);
R2 = r.^2;
imagesc(R2)
set(gca,'xtick',[9.5:18:279.5]);set(gca,'ytick',[9.5:18:279.5])
set(gca,'xticklabel',{'AR1','CN1','EK1','IC1','LP1','CN2','HK1','EK2','MD2','WL1','SP1','AR2','IC2','LX1','TD1','HH1'});set(gca,'yticklabel',{'AR1','CN1','EK1','IC1','LP1','CN2','HK1','EK2','MD2','WL1','SP1','AR2','IC2','LX1','TD1','HH1'});
colorbar;colormap(gray);
%%
figure
dissimilarity = 1-R2;
[Y,e] = cmdscale(dissimilarity,2);
plot(Y(1:18,1),Y(1:18,2),'ro',Y(19:36,1),Y(19:36,2),'bo',Y(37:54,1),Y(37:54,2),'go',Y(55:72,1),Y(55:72,2),'yo',Y(73:90,1),Y(73:90,2),'mo',Y(91:108,1),Y(91:108,2),'ro',Y(109:126,1),Y(109:126,2),'ko',Y(127:144,1),Y(127:144,2),'ro',Y(145:162,1),Y(145:162,2),'ro',Y(163:180,1),Y(163:180,2),'ro',Y(181:198,1),Y(181:198,2),'ro',Y(199:216,1),Y(199:216,2),'ro',Y(217:234,1),Y(217:234,2),'ro',Y(235:252,1),Y(235:252,2),'ro',Y(253:270,1),Y(253:270,2),'ro',Y(271:288,1),Y(271:288,2),'ro');set(gca,'FontSize',16);
grid on;title('MDS')
