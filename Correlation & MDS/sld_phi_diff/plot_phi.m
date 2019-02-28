tm = load('PHI_TM.mat');
TM = tm.phi;
rv = load('PHI_RV.mat');
RV = rv.phi;
oc = load('PHI_OC.mat');
OC = oc.phi;
% %Removal of diagonal
% TMtemp = TM';TMnew = reshape(TMtemp(~eye(size(TMtemp))), size(TM, 2)-1, [])';
% RVtemp = RV';RVnew = reshape(RVtemp(~eye(size(RVtemp))), size(RV, 2)-1, [])';
% OCtemp = OC';OCnew = reshape(OCtemp(~eye(size(OCtemp))), size(OC, 2)-1, [])';
% figure(1)
% h_TM = histogram(TMnew,[0:0.0001:0.07]);h_TM.Normalization = 'probability';
% grid on;xlabel('\Phi');ylabel('Frequency');title('Histogram (bin = 0.0001)')
% figure(2)
% h_RV = histogram(RVnew,[0:0.0001:0.07]);h_RV.Normalization = 'probability';
% grid on;xlabel('\Phi');ylabel('Frequency');title('Histogram (bin = 0.0001)')
% figure(3)
% h_OC = histogram(OCnew,[0:0.0001:0.07]);h_OC.Normalization = 'probability';
% grid on;xlabel('\Phi');ylabel('Frequency');title('Histogram (bin = 0.0001)')
% 
% figure(4)
% cum = cumsum(h_TM.Values);
% bar(cum);grid on;xlabel('\Phi');ylabel('Cumulative sum (Total counts after removing diagonal = 43660)');title('Cumulative (bin = 0.0001)');
% set(gca,'xticklabel',{'0','0.01','0.02','0.03','0.04','0.05','0.06','0.07'});
% figure(5)
% cum = cumsum(h_RV.Values);
% bar(cum);grid on;xlabel('\Phi');ylabel('Cumulative sum (Total counts after removing diagonal = 43660)');title('Cumulative (bin = 0.0001)');
% set(gca,'xticklabel',{'0','0.01','0.02','0.03','0.04','0.05','0.06','0.07'});
% figure(6)
% cum = cumsum(h_OC.Values);
% bar(cum);grid on;xlabel('\Phi');ylabel('Cumulative sum (Total counts after removing diagonal = 43660)');title('Cumulative (bin = 0.0001)');
% set(gca,'xticklabel',{'0','0.01','0.02','0.03','0.04','0.05','0.06','0.07'});

%Across
%TM
figure(1)
hacr_TM = histogram(TM(149:296,1:148),[0:0.0001:0.07]);
%hacr_TM.Normalization = 'probability';
grid on;xlabel('\Phi');ylabel('Frequency (Total counts = 21904)');title('Histogram (bin = 0.0001)')
hacrval_TM = hacr_TM.Values;
total_TM = sum(hacrval_TM);
TM_acr = hacrval_TM/total_TM;

cum1 = cumsum(hacrval_TM);
% figure(4)
% bar(cum1);grid on;xlabel('\Phi');ylabel('Cumulative sum');title('Cumulative');
% set(gca,'xticklabel',{'0','0.001','0.002','0.003','0.004','0.005','0.006'});

%RV
figure(2)
hacr_RV = histogram(RV(149:296,1:148),[0:0.0001:0.07]);
%hacr_RV.Normalization = 'probability';
grid on;xlabel('\Phi');ylabel('Frequency (Total counts = 21904)');title('Histogram (bin = 0.0001)')
hacrval_RV = hacr_RV.Values;
total_RV = sum(hacrval_RV);
RV_acr = hacrval_RV/total_RV;

cum2 = cumsum(hacrval_RV);
% figure(5)
% bar(cum2);grid on;xlabel('\Phi');ylabel('Cumulative sum');title('Cumulative');
% set(gca,'xticklabel',{'0','0.001','0.002','0.003','0.004','0.005','0.006'});

%OC
figure(3)
hacr_OC = histogram(OC(149:296,1:148),[0:0.0001:0.07]);
%hacr_OC.Normalization = 'probability';
grid on;xlabel('\Phi');ylabel('Frequency (Total counts = 21904)');title('Histogram (bin = 0.0001)')
hacrval_OC = hacr_OC.Values;
total_OC = sum(hacrval_OC);
OC_acr = hacrval_OC/total_OC;


cum3 = cumsum(hacrval_OC);
% figure(6)
% bar(cum3);grid on;xlabel('\Phi');ylabel('Cumulative sum');title('Cumulative');
% set(gca,'xticklabel',{'0','0.001','0.002','0.003','0.004','0.005','0.006'});

%Within
%TM
figure(4)
h_TMnew = histogram(TMnew,[0:0.0001:0.07]);
hval_TMnew = h_TMnew.Values;
hwitval_TM = (hval_TMnew-hacrval_TM*2)/2;
tot_TM = sum(hwitval_TM);
TM_wit = hwitval_TM/tot_TM;
% bar(TM_wit);set(gca,'xticklabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
% grid on;xlabel('R squared');ylabel('Frequency (Total counts after removing diagonal = 21756)');title('Histogram (bin = 0.0001)')
cum4 = cumsum(hwitval_TM); 
bar(cum4/21756);grid on;xlabel('\Phi');ylabel('Cumulative sum');title('Cumulative (bin = 0.0001)');
set(gca,'xticklabel',{'0','0.01','0.02','0.03','0.04','0.05','0.06','0.07'});
%RV
figure(5)
h_RVnew = histogram(RVnew,[0:0.0001:0.07]);
hval_RVnew = h_RVnew.Values;
hwitval_RV = (hval_RVnew-hacrval_RV*2)/2;
tot_RV = sum(hwitval_RV);
RV_wit = hwitval_RV/tot_RV;
% bar(RV_wit);set(gca,'xticklabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});
% grid on;xlabel('R squared');ylabel('Frequency (Total counts after removing diagonal = 21756)');title('Histogram (bin = 0.0001)')
cum5 = cumsum(hwitval_RV);
bar(cum5/21756);grid on;xlabel('\Phi');ylabel('Cumulative sum');title('Cumulative (bin = 0.0001)');
set(gca,'xticklabel',{'0','0.01','0.02','0.03','0.04','0.05','0.06','0.07'});

%OC
figure(6)
h_OCnew = histogram(OCnew,[0:0.0001:0.07]);
hval_OCnew = h_OCnew.Values;
hwitval_OC = (hval_OCnew-hacrval_OC*2)/2;
tot_OC = sum(hwitval_OC);
OC_wit = hwitval_OC/tot_OC;
% bar(OC_wit);set(gca,'xticklabel',{'0','0.01','0.02','0.03','0.04','0.05','0.06','0.07'});
% grid on;xlabel('\Phi');ylabel('Frequency (Total counts after removing diagonal = 21756)');title('Histogram (bin = 0.0001)')
cum6 = cumsum(hwitval_OC);
bar(cum6/21756);grid on;xlabel('R squared');ylabel('Cumulative sum');title('Cumulative (bin = 0.0001)');
set(gca,'xticklabel',{'0','0.01','0.02','0.03','0.04','0.05','0.06','0.07'});

x = 0.0001:0.0001:0.07;
figure(7)
plot(x,(TM_acr+RV_acr+OC_acr)/3,x,(TM_wit+RV_wit+OC_wit)/3,'LineWidth',1.5);
xlabel('\Phi');ylabel('Frequency');grid on;
legend('Across Brain','Within Brain');title('Histogram (bin = 0.0001)');

x = 0.0001:0.0001:0.07;
figure(8);
plot(x,(cum1/21904+cum2/21904+cum3/21904)/3,x,(cum4/21756+cum5/21756+cum6/21756)/3,'LineWidth',1.5);
xlabel('\Phi');ylabel('Cumulative sum');grid on;title('Cumulative sum (bin = 0.0001)');
axis([0 0.07 0 1.05]);
legend('Across Brain','Within Brain','location','east');

