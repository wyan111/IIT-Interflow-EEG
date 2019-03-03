[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
iTM = [2,3,12,13,16,17];
iRV = [6,7,10,11,14,15];
iOC = [4,5,8,9,18,19];
file = dir(('/Users/soliyan3261/Desktop/Channel Data/170820/FASTER_170820_TRIAL*.set'));
for i = 1:6
     data1 = pop_loadset(file(2*iTM(i)-2).name);
     data2 = pop_loadset(file(2*iTM(i)-3).name);
     data3 = pop_loadset(file(2*iRV(i)-2).name);
     data4 = pop_loadset(file(2*iRV(i)-3).name);
     data5 = pop_loadset(file(2*iOC(i)-2).name);
     data6 = pop_loadset(file(2*iOC(i)-3).name);
     %TM MD 6 trials
     EEG_all(1,i) = {data1.data};
     %TM WL 6 trials
     EEG_all(2,i) = {data2.data};
     %RV MD 6 trials
     EEG_all(3,i) = {data3.data};
     %RV WL 6 trials
     EEG_all(4,i) = {data4.data};
     %RV MD 6 trials
     EEG_all(5,i) = {data5.data};
     %RV WL 6 trials
     EEG_all(6,i) = {data6.data};
end
%EEG1 = pop_loadset('FASTER_170811_TRIAL2_MD_DS_epo10.set'); %second index : dataset filepath. Default is current folder.

