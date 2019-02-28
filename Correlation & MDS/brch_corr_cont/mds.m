clear
%TM
data_tm = load('R2_TM.mat');
data_tm = data_tm.R2;
tm_wit = [data_tm(1:63,1:63),data_tm(64:126,64:126)];
tm_acr = [data_tm(64:126,1:63),data_tm(1:63,64:126)];
tm_within = reshape(tm_wit,63*126,1);
tm_across = reshape(tm_acr,63*126,1);
%RV
data_rv = load('R2_RV.mat');
data_rv = data_rv.R2;
rv_wit = [data_rv(1:63,1:63),data_rv(64:126,64:126)];
rv_acr = [data_rv(64:126,1:63),data_rv(1:63,64:126)];
rv_within = reshape(rv_wit,63*126,1);
rv_across = reshape(rv_acr,63*126,1);
%TM
data_oc = load('R2_OC.mat');
data_oc = data_oc.R2;
oc_wit = [data_oc(1:63,1:63),data_oc(64:126,64:126)];
oc_acr = [data_oc(64:126,1:63),data_oc(1:63,64:126)];
oc_within = reshape(oc_wit,63*126,1);
oc_across = reshape(oc_acr,63*126,1);

correlation = corr([tm_within rv_within oc_within tm_across rv_across oc_across]);
dissimilarity = 1-correlation;

[Y,e] = cmdscale(dissimilarity,2);
plot(Y(1,1),Y(1,2),'ro',Y(2,1),Y(2,2),'r+',Y(3,1),Y(3,2),'r*',Y(4,1),Y(4,2),'bo',Y(5,1),Y(5,2),'b+',Y(6,1),Y(6,2),'b*','markersize',12)
%labels = {['Wit-InterFlow'],['Wit-InterNonflow'],['Wit-IndivFlow'],['Acr-InterFlow'],['Acr-InterNonflow'],['Acr-IndivFlow']};
set(gca,'FontSize',16);
legend('Wit-InterFlow','Wit-InterNonflow','Wit-IndivFlow','Acr-InterFlow','Acr-InterNonflow','Acr-IndivFlow','location','northwest');
%text(Y(:,1),Y(:,2),labels);
grid on;title('Dissimilarity')
