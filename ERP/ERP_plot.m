clear
alldata = load('chd170811.mat');
data = alldata.data;
[a,num_trial] = size(data);
%pre-processed
for iCon = 1:6
for iTri = 1:num_trial
    dat5 = [];
for iCh = 1:128
    dat1 = data{iCon,iTri};
    dat2 = dat1(iCh,:,:);
    dat3 = squeeze(dat2)';
    [epo,t] = size(dat3);
    dat4 = [];
    for iEpo = 1:epo
    mean100 = mean(dat3(iEpo,230:256));
    dat4(iEpo,:) = dat3(iEpo,:) - mean100;
    end
    dat5(iCh,1:t,1:epo) = dat4';
end 
    dat6{iCon,iTri} = dat5;
end
end
%Average
for iCh = 1:128
    mat = [];
for iCon = 2:2:6
for iTri = 1:num_trial
    mat3 = [];
    mat1 = dat6{iCon,iTri};
    mat2 = mat1(iCh,:,:);
    mat3 = squeeze(mat2)';
    mat = [mat;mat3];
    ave(iCh,:) = mean(mat);
%     mean100 = mean(ave(iCh,231:256));
%     ave(iCh,:) = ave(iCh,:) - mean100;
end
end

end

x = linspace(-1000,1996.0938,768);
plot(x,ave,[0,0],[-4,4],'k','LineWidth',1)
ylabel('\muV');xlabel('Time (ms)');grid on;title('Event-Related Protential')