tm = load('R2_TM.mat');
TM = tm.R2;
rv = load('R2_RV.mat');
RV = rv.R2;
oc = load('R2_OC.mat');
OC = oc.R2;
TMtemp = TM';TMnew = reshape(TMtemp(~eye(size(TMtemp))), size(TM, 2)-1, [])';
RVtemp = RV';RVnew = reshape(RVtemp(~eye(size(RVtemp))), size(RV, 2)-1, [])';
OCtemp = OC';OCnew = reshape(OCtemp(~eye(size(OCtemp))), size(OC, 2)-1, [])';
%Across
%TM
figure(1)
hacr_TM = histogram(TM(149:296,1:148),[0:0.01:1]);
%hacr_TM.Normalization = 'probability';
grid on;xlabel('R squared');ylabel('Frequency');title('Histogram (Total counts after removing diagonal = 21904)')
hacrval_TM = hacr_TM.Values;
total_TM = sum(hacrval_TM);
TM_acr = hacrval_TM/total_TM;

% figure(4)
% cum = cumsum(hacrval_TM);
% bar(cum);grid on;xlabel('R squared');ylabel('Cumulative sum');title('Cumulative');
% set(gca,'xticklabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});

%RV
figure(2)
hacr_RV = histogram(RV(149:296,1:148),[0:0.01:1]);
%hacr_RV.Normalization = 'probability';
grid on;xlabel('R squared');ylabel('Frequency');title('Histogram (Total counts after removing diagonal = 21904)')
hacrval_RV = hacr_RV.Values;
total_RV = sum(hacrval_RV);
RV_acr = hacrval_RV/total_RV;

% figure(5)
% cum = cumsum(hacrval_RV);
% bar(cum);grid on;xlabel('R squared');ylabel('Cumulative sum');title('Cumulative');
% set(gca,'xticklabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});

%OC
figure(3)
hacr_OC = histogram(OC(149:296,1:148),[0:0.01:1]);
%hacr_OC.Normalization = 'probability';
grid on;xlabel('R squared');ylabel('Frequency');title('Histogram (Total counts after removing diagonal = 21904)')
hacrval_OC = hacr_OC.Values;
total_OC = sum(hacrval_OC);
OC_acr = hacrval_OC/total_OC;

% figure(6)
% cum = cumsum(hacrval_OC);
% bar(cum);grid on;xlabel('R squared');ylabel('Cumulative sum');title('Cumulative');
% set(gca,'xticklabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});

%Within
%TM
figure(4)
h_TMnew = histogram(TMnew,[0:0.01:1]);
hval_TMnew = h_TMnew.Values;
hwitval_TM = (hval_TMnew-hacrval_TM*2)/2;
tot_TM = sum(hwitval_TM);
TM_wit = hwitval_TM/tot_TM;
% bar(TM_wit);set(gca,'xticklabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
% grid on;xlabel('R squared');ylabel('Frequency');title('Histogram (Total counts after removing diagonal = 21756)')
cum = cumsum(hwitval_TM);
bar(cum);grid on;xlabel('R squared');ylabel('Cumulative sum');title('Cumulative');
set(gca,'xticklabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
%RV
figure(5)
h_RVnew = histogram(RVnew,[0:0.01:1]);
hval_RVnew = h_RVnew.Values;
hwitval_RV = (hval_RVnew-hacrval_RV*2)/2;
tot_RV = sum(hwitval_RV);
RV_wit = hwitval_RV/tot_RV;
% bar(RV_wit);set(gca,'xticklabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
% grid on;xlabel('R squared');ylabel('Frequency');title('Histogram (Total counts after removing diagonal = 21756)')
cum = cumsum(hwitval_RV);
bar(cum);grid on;xlabel('R squared');ylabel('Cumulative sum');title('Cumulative');
set(gca,'xticklabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});

%OC
figure(6)
h_OCnew = histogram(OCnew,[0:0.01:1]);
hval_OCnew = h_OCnew.Values;
hwitval_OC = (hval_OCnew-hacrval_OC*2)/2;
tot_OC = sum(hwitval_OC);
OC_wit = hwitval_OC/tot_OC;
% bar(OC_wit);set(gca,'xticklabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
% grid on;xlabel('R squared');ylabel('Frequency');title('Histogram (Total counts after removing diagonal = 21756)')
cum = cumsum(hwitval_OC);
bar(cum);grid on;xlabel('R squared');ylabel('Cumulative sum');title('Cumulative');
set(gca,'xticklabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});

% x = 0.01:0.01:1;
% figure(7)
% plot(x,TM_acr,x,RV_acr,x,OC_acr,x,TM_wit,x,RV_wit,x,OC_wit,'LineWidth',1.5);
% xlabel('R squared');ylabel('Frequency');grid on;
% legend('Int - TM','Int - RV','Int - OC','Acr - TM','Acr - RV','Acr - OC');