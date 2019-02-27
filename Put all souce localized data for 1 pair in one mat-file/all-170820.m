iTM = [2,3,12,13,16,17];
iRV = [6,7,10,11,14,15];
iOC = [4,5,8,9,18,19];
for i=1:length(iTM)
 data = load(['Users/soliyan3261/Source Localized Data/170820/' '170820_TD1_T' num2str(iTM(i)) '_tm_PLAY_all.mat']);
 alldata(1,i) = {data.Value};
 end
    for i=1:length(iTM)
 data = load(['Users/soliyan3261/Source Localized Data/170820/' '170820_HH1_T' num2str(iTM(i)) '_tm_PLAY_all.mat']);
 alldata(2,i) = {data.Value};
    end
    for i=1:length(iRV)
 data = load(['Users/soliyan3261/Source Localized Data/170820/' '170820_TD1_T' num2str(iRV(i)) '_tmrv_PLAY_all.mat']);
 alldata(3,i) = {data.Value};
    end
    for i=1:length(iRV)
 data = load(['Users/soliyan3261/Source Localized Data/170820/' '170820_HH1_T' num2str(iRV(i)) '_tmrv_PLAY_all.mat']);
 alldata(4,i) = {data.Value};
    end
    for i=1:length(iOC)
 data = load(['Users/soliyan3261/Source Localized Data/170820/' '170820_TD1_T' num2str(iOC(i)) '_tmoc_PLAY_all.mat']);
 alldata(5,i) = {data.Value};
    end
    for i=1:length(iOC)
 data = load(['Users/soliyan3261/Source Localized Data/170820/' '170820_HH1_T' num2str(iOC(i)) '_tmoc_PLAY_all.mat']);
 alldata(6,i) = {data.Value};
   end