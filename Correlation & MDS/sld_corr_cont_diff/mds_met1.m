%labels for each sources
for i = 1:148
    labels{1,i} = ['A' num2str(i)];
end
for i = 1:148
    labels{1,i+148} = ['B' num2str(i)];
end
%TM
%load phi values
data_tm = load('R2_TM_condiff.mat');
data_tm = data_tm.R2;
datatemp = data_tm';
%remove diagonal to get maximum and minimum 
nodiag = reshape(datatemp(~eye(size(datatemp))), 296*295, [])';
maximum = max(nodiag(:));
minimum = min(nodiag(:));
%make phi 0 to 1
len = maximum - minimum;
phi0to1_tm = (data_tm-minimum)/len;
%dis-similarity
dissimilarity_tm = 1-phi0to1_tm;
for i = 1:296
    dissimilarity_tm(i,i) = 0;
end

%RV
%load phi values
data_rv = load('R2_RV_condiff.mat');
data_rv = data_rv.R2;
datatemp = data_rv';
%remove diagonal to get maximum and minimum 
nodiag = reshape(datatemp(~eye(size(datatemp))), 296*295, [])';
maximum = max(nodiag(:));
minimum = min(nodiag(:));
%make phi 0 to 1
len = maximum - minimum;
phi0to1_rv = (data_rv-minimum)/len;
%dis-similarity
dissimilarity_rv = 1-phi0to1_rv;
for i = 1:296
    dissimilarity_rv(i,i) = 0;
end

%OC
%load phi values
data_oc = load('R2_OC_condiff.mat');
data_oc = data_oc.R2;
datatemp = data_oc';
%remove diagonal to get maximum and minimum 
nodiag = reshape(datatemp(~eye(size(datatemp))), 296*295, [])';
maximum = max(nodiag(:));
minimum = min(nodiag(:));
%make phi 0 to 1
len = maximum - minimum;
phi0to1_oc = (data_oc-minimum)/len;
%dis-similarity
dissimilarity_oc = 1-phi0to1_oc;
for i = 1:296
    dissimilarity_oc(i,i) = 0;
end

%plot
%dissimilarity-TM
figure(1);
[Y_tm,e_tm] = cmdscale(dissimilarity_tm,2);
plot(Y_tm(1:148,1),Y_tm(1:148,2),'co',Y_tm(149:296,1),Y_tm(149:296,2),'go')
set(gca,'FontSize',16);
legend('Participant 1','Participant 2','location','northeast');grid on;title('Dissimilarity')
%text(Y_tm(:,1)+0.005,Y_tm(:,2),labels);
saveas(1,'1.jpg')

figure(2);
[Y_rv,e_rv] = cmdscale(dissimilarity_rv,2);
plot(Y_rv(1:148,1),Y_rv(1:148,2),'co',Y_rv(149:296,1),Y_rv(149:296,2),'go')
set(gca,'FontSize',16);
legend('Participant 1','Participant 2','location','northeast');grid on;title('Dissimilarity')
%text(Y_rv(:,1)+0.005,Y_rv(:,2),labels);
saveas(2,'2.jpg')

figure(3);
[Y_oc,e_oc] = cmdscale(dissimilarity_oc,2);
plot(Y_oc(1:148,1),Y_oc(1:148,2),'co',Y_oc(149:296,1),Y_oc(149:296,2),'go')
set(gca,'FontSize',16);
legend('Participant 1','Participant 2','location','northeast');grid on;title('Dissimilarity')
%text(Y_oc(:,1)+0.005,Y_oc(:,2),labels);
saveas(3,'3.jpg')