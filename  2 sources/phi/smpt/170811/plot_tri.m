%source localized data
%TM
tm_tri = zeros(296,296);
p1_tm = load('p1_phi_TM.mat');
p2_tm = load('p2_phi_TM.mat');
cross_tm = load('cross_phi_TM.mat');
p1_tm_phi = p1_tm.phi;
p2_tm_phi = p2_tm.phi;
cross_tm_phi = cross_tm.phi;
tm_tri(1:148,1:148) = p1_tm_phi;
tm_tri(1:148,149:296) = cross_tm_phi;
tm_tri(149:296,149:296) = p2_tm_phi;
for i = 2:296
    for j = 1:i-1
        tm_tri(i,j) = tm_tri(j,i);
    end
end
figure(1);imagesc(tm_tri);colormap(gray);colorbar;
set(gca,'xtick',[74,222]);set(gca,'ytick',[74,222])
set(gca,'xticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});set(gca,'yticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});
title('TM - Single Median - 3.9 ms')
saveas(1,'TM.jpg')

%RV
rv_tri = zeros(296,296);
p1_rv = load('p1_phi_RV.mat');
p2_rv = load('p2_phi_RV.mat');
cross_rv = load('cross_phi_RV.mat');
p1_rv_phi = p1_rv.phi;
p2_rv_phi = p2_rv.phi;
cross_rv_phi = cross_rv.phi;
rv_tri(1:148,1:148) = p1_rv_phi;
rv_tri(1:148,149:296) = cross_rv_phi;
rv_tri(149:296,149:296) = p2_rv_phi;
for i = 2:296
    for j = 1:i-1
        rv_tri(i,j) = rv_tri(j,i);
    end
end
figure(2);imagesc(rv_tri);colormap(gray);colorbar;
set(gca,'xtick',[74,222]);set(gca,'ytick',[74,222])
set(gca,'xticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});set(gca,'yticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});
title('RV - Single Median - 3.9 ms')
saveas(2,'RV.jpg')

%OC
oc_tri = zeros(296,296);
p1_oc = load('p1_phi_OC.mat');
p2_oc = load('p2_phi_OC.mat');
cross_oc = load('cross_phi_OC.mat');
p1_oc_phi = p1_oc.phi;
p2_oc_phi = p2_oc.phi;
cross_oc_phi = cross_oc.phi;
oc_tri(1:148,1:148) = p1_oc_phi;
oc_tri(1:148,149:296) = cross_oc_phi;
oc_tri(149:296,149:296) = p2_oc_phi;
for i = 2:296
    for j = 1:i-1
        oc_tri(i,j) = oc_tri(j,i);
    end
end
figure(3);imagesc(oc_tri);colormap(gray);colorbar;
set(gca,'xtick',[74,222]);set(gca,'ytick',[74,222])
set(gca,'xticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});set(gca,'yticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});
title('OC - Single Median - 3.9 ms')
saveas(3,'OC.jpg')
save('sld-smpt-tm-170811.mat','tm_tri');
save('sld-smpt-rv-170811.mat','rv_tri');
save('sld-smpt-oc-170811.mat','oc_tri');
%Average
ave_tri = (tm_tri+rv_tri+oc_tri)/3;
figure(4);imagesc(ave_tri);colormap(gray);colorbar;
set(gca,'xtick',[74,222]);set(gca,'ytick',[74,222])
set(gca,'xticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});set(gca,'yticklabel',{'Source 1~148 of P1','Source 1~148 of P2'});
title('Average - Single Median - 3.9 ms')
saveas(4,'Average.jpg')