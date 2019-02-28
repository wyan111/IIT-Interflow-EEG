tm = load('PHI_TM.mat');
TM = tm.phi;
rv = load('PHI_RV.mat');
RV = rv.phi;
oc = load('PHI_OC.mat');
OC = oc.phi;
%Removal of diagonal
TMtemp = TM';TMnew = reshape(TMtemp(~eye(size(TMtemp))), size(TM, 2)-1, [])';
RVtemp = RV';RVnew = reshape(RVtemp(~eye(size(RVtemp))), size(RV, 2)-1, [])';
OCtemp = OC';OCnew = reshape(OCtemp(~eye(size(OCtemp))), size(OC, 2)-1, [])';
% figure(1)
% h_TM = histogram(TMnew,[0:0.0002:0.04]);h_TM.Normalization = 'probability';
% grid on;xlabel('\Phi');ylabel('Frequency');title('Histogram (bin = 0.0002)')
% figure(2)
% h_RV = histogram(RVnew,[0:0.0002:0.04]);h_RV.Normalization = 'probability';
% grid on;xlabel('\Phi');ylabel('Frequency');title('Histogram (bin = 0.0002)')
% figure(3)
% h_OC = histogram(OCnew,[0:0.0002:0.045]);h_OC.Normalization = 'probability';
% grid on;xlabel('\Phi');ylabel('Frequency');title('Histogram (bin = 0.0002)')
% figure(4)
% cum = cumsum(h_TM.Values);
% bar(cum);grid on;xlabel('\Phi');ylabel('Cumulative sum (Total counts after removing diagonal = 7875)');title('Cumulative (bin = 0.0002)');
% set(gca,'xticklabel',{'0','0.004','0.008','0.012','0.016','0.02','0.024','0.028','0.32','0.036','0.04'});
% figure(5)
% cum = cumsum(h_RV.Values);
% bar(cum);grid on;xlabel('\Phi');ylabel('Cumulative sum (Total counts after removing diagonal = 7875)');title('Cumulative (bin = 0.0002)');
% set(gca,'xticklabel',{'0','0.004','0.008','0.012','0.016','0.02','0.024','0.028','0.32','0.036','0.04'});
% figure(6)
% cum = cumsum(h_OC.Values);
% bar(cum);grid on;xlabel('\Phi');ylabel('Cumulative sum (Total counts after removing diagonal = 7875)');title('Cumulative (bin = 0.0002)');
% set(gca,'xticklabel',{'0','0.01','0.02','0.03','0.04'});

%Across
%TM
figure(1)
hacr_TM = histogram(TM(64:126,1:63),[0:0.0002:0.045]);
%hacr_TM.Normalization = 'probability';
grid on;xlabel('\Phi');ylabel('Frequency (Total counts = 3969)');title('Histogram (bin = 0.00005)')
hacrval_TM = hacr_TM.Values;
total_TM = sum(hacrval_TM);
TM_acr = hacrval_TM/total_TM;

cum1 = cumsum(hacrval_TM);
% figure(4)
% bar(cum1);grid on;xlabel('\Phi');ylabel('Cumulative sum');title('Cumulative');
% set(gca,'xticklabel',{'0','0.005','0.001','0.0015','0.002','0.0025','0.003','0.0035','0.004'});

%RV
figure(2)
hacr_RV = histogram(RV(64:126,1:63),[0:0.0002:0.045]);
%hacr_RV.Normalization = 'probability';
grid on;xlabel('\Phi');ylabel('Frequency (Total counts = 3969)');title('Histogram (bin = 0.00005)')
hacrval_RV = hacr_RV.Values;
total_RV = sum(hacrval_RV);
RV_acr = hacrval_RV/total_RV;

cum2 = cumsum(hacrval_RV);
% figure(5)
% bar(cum2);grid on;xlabel('\Phi');ylabel('Cumulative sum');title('Cumulative');
% set(gca,'xticklabel',{'0','0.005','0.001','0.0015','0.002','0.0025','0.003','0.0035','0.004','0.0045'});

%OC
figure(3)
hacr_OC = histogram(OC(64:126,1:63),[0:0.0002:0.045]);
%hacr_OC.Normalization = 'probability';
grid on;xlabel('\Phi');ylabel('Frequency (Total counts = 3969)');title('Histogram (bin = 0.00005)')
hacrval_OC = hacr_OC.Values;
total_OC = sum(hacrval_OC);
OC_acr = hacrval_OC/total_OC;


cum3 = cumsum(hacrval_OC);
% figure(6)
% bar(cum3);grid on;xlabel('\Phi');ylabel('Cumulative sum');title('Cumulative');
% set(gca,'xticklabel',{'0','0.005','0.001','0.0015','0.002','0.0025','0.003','0.0035','0.004','0.0045','0.005'});

%Within
%TM
figure(4)
h_TMnew = histogram(TMnew,[0:0.0002:0.045]);
hval_TMnew = h_TMnew.Values;
hwitval_TM = (hval_TMnew-hacrval_TM*2)/2;
tot_TM = sum(hwitval_TM);
TM_wit = hwitval_TM/tot_TM;
% bar(TM_wit);set(gca,'xticklabel',{'0','0.004','0.008','0.012','0.016','0.02','0.024','0.028','0.32','0.036','0.04'});
% grid on;xlabel('\Phi');ylabel('Frequency (Total counts after removing diagonal = 3906)');title('Histogram (bin = 0.0002)')
cum4 = cumsum(hwitval_TM); 
bar(cum4/3906);grid on;xlabel('\Phi');ylabel('Cumulative sum');title('Cumulative (bin = 0.0002)');
set(gca,'xticklabel',{'0','0.004','0.008','0.012','0.016','0.02','0.024','0.028','0.32','0.036','0.04'});
%RV
figure(5)
h_RVnew = histogram(RVnew,[0:0.0002:0.045]);
hval_RVnew = h_RVnew.Values;
hwitval_RV = (hval_RVnew-hacrval_RV*2)/2;
tot_RV = sum(hwitval_RV);
RV_wit = hwitval_RV/tot_RV;
% bar(RV_wit);set(gca,'xticklabel',{'0','0.004','0.008','0.012','0.016','0.02','0.024','0.028','0.32','0.036','0.04'});
% grid on;xlabel('\Phi');ylabel('Frequency (Total counts after removing diagonal = 3906)');title('Histogram (bin = 0.0002)')
cum5 = cumsum(hwitval_RV);
bar(cum5/3906);grid on;xlabel('\Phi');ylabel('Cumulative sum');title('Cumulative (bin = 0.0002)');
set(gca,'xticklabel',{'0','0.004','0.008','0.012','0.016','0.02','0.024','0.028','0.32','0.036','0.04'});

%OC
figure(6)
h_OCnew = histogram(OCnew,[0:0.0002:0.045]);
hval_OCnew = h_OCnew.Values;
hwitval_OC = (hval_OCnew-hacrval_OC*2)/2;
tot_OC = sum(hwitval_OC);
OC_wit = hwitval_OC/tot_OC;
% bar(OC_wit);set(gca,'xticklabel',{'0','0.01','0.02','0.03','0.04'});
% grid on;xlabel('\Phi');ylabel('Frequency (Total counts after removing diagonal = 3906)');title('Histogram (bin = 0.0002)')
cum6 = cumsum(hwitval_OC);
bar(cum6/3906);grid on;xlabel('\Phi');ylabel('Cumulative sum');title('Cumulative (bin = 0.0002)');
set(gca,'xticklabel',{'0','0.01','0.02','0.03','0.04'});
% 
% x = 0.0002:0.0002:0.045;
% figure(7)
% plot(x,TM_acr,x,RV_acr,x,OC_acr,x,TM_wit,x,RV_wit,x,OC_wit,'LineWidth',1.5);
% xlabel('\Phi');ylabel('Frequency');grid on;title('Histogram (bin = 0.0002)');
% legend('Across - TM','Across - RV','Across - OC','Within - TM','Within - RV','Within - OC');

% x = 0.0002:0.0002:0.045;
% figure(7);
% plot(x,cum1/3969,x,cum2/3969,x,cum3/3969,x,cum4/3906,x,cum5/3906,x,cum6/3906,'LineWidth',1.5);
% xlabel('\Phi');ylabel('Cumulative sum');grid on;title('Cumulative sum (bin = 0.0002)');
% legend('Across - TM','Across - RV','Across - OC','Within - TM','Within - RV','Within - OC','location','east');

x = 0.0002:0.0002:0.045;
figure(7)
plot(x,(TM_acr+RV_acr+OC_acr)/3,x,(TM_wit+RV_wit+OC_wit)/3,'LineWidth',1.5);
xlabel('R Squared');ylabel('Frequency');grid on;title('Histogram (bin = 0.0002)');
legend('Across Brain','Within Brain');

x = 0.0002:0.0002:0.045;
figure(8);
plot(x,(cum1/3969+cum2/3969+cum3/3969)/3,x,(cum4/3906+cum5/3906+cum6/3906)/3,'LineWidth',1.5);
xlabel('R Squared');ylabel('Cumulative sum');grid on;title('Cumulative sum (bin = 0.0002)');
legend('Across Brain','Within Brain');

