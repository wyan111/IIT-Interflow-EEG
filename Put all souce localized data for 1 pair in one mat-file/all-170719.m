iTM = [2,3,10,11,14];
iRV = [6,7,12,13,15];
iOC = [4,5,8,9,16];
for i=1:length(iTM)
 data = load(['Users/soliyan3261/Source Localized Data/170719/' '170719_EM1_T' num2str(iTM(i)) '_tm_PLAY_all.mat']);
 alldata(1,i) = {data.Value};
 end
    for i=1:length(iTM)
 data = load(['Users/soliyan3261/Source Localized Data/170719/' '170719_MD1_T' num2str(iTM(i)) '_tm_PLAY_all.mat']);
 alldata(2,i) = {data.Value};
    end
    for i=1:length(iRV)
 data = load(['Users/soliyan3261/Source Localized Data/170719/' '170719_EM1_T' num2str(iRV(i)) '_tmrv_PLAY_all.mat']);
 alldata(3,i) = {data.Value};
    end
    for i=1:length(iRV)
 data = load(['Users/soliyan3261/Source Localized Data/170719/' '170719_MD1_T' num2str(iRV(i)) '_tmrv_PLAY_all.mat']);
 alldata(4,i) = {data.Value};
    end
    for i=1:length(iOC)
 data = load(['Users/soliyan3261/Source Localized Data/170719/' '170719_EM1_T' num2str(iOC(i)) '_tmoc_PLAY_all.mat']);
 alldata(5,i) = {data.Value};
    end
    for i=1:length(iOC)
 data = load(['Users/soliyan3261/Source Localized Data/170719/' '170719_MD1_T' num2str(iOC(i)) '_tmoc_PLAY_all.mat']);
 alldata(6,i) = {data.Value};
   end