%source localized data
%TM
tm_tri = zeros(126,126);
p1_tm = load('p1_phi_TM.mat');
p2_tm = load('p2_phi_TM.mat');
cross_tm = load('cross_phi_TM.mat');
p1_tm_phi = p1_tm.phi;
p2_tm_phi = p2_tm.phi;
cross_tm_phi = cross_tm.phi;
tm_tri(1:63,1:63) = p1_tm_phi;
tm_tri(1:63,64:126) = cross_tm_phi;
tm_tri(64:126,64:126) = p2_tm_phi;
for i = 2:126
    for j = 1:i-1
        tm_tri(i,j) = tm_tri(j,i);
    end
end
figure(1);imagesc(tm_tri);colormap(gray);colorbar;
set(gca,'xtick',[31,94]);set(gca,'ytick',[31,94])
set(gca,'xticklabel',{'Channel 1~63 of P1','Channel 1~63 of P2'});set(gca,'yticklabel',{'Channel 1~63 of P1','Channel 1~63 of P2'});
title('TM - Diff - 3.9 ms')
saveas(1,'TM.jpg')
%RV
rv_tri = zeros(126,126);
p1_rv = load('p1_phi_RV.mat');
p2_rv = load('p2_phi_RV.mat');
cross_rv = load('cross_phi_RV.mat');
p1_rv_phi = p1_rv.phi;
p2_rv_phi = p2_rv.phi;
cross_rv_phi = cross_rv.phi;
rv_tri(1:63,1:63) = p1_rv_phi;
rv_tri(1:63,64:126) = cross_rv_phi;
rv_tri(64:126,64:126) = p2_rv_phi;
for i = 2:126
    for j = 1:i-1
        rv_tri(i,j) = rv_tri(j,i);
    end
end
figure(2);imagesc(rv_tri);colormap(gray);colorbar;
set(gca,'xtick',[31,94]);set(gca,'ytick',[31,94])
set(gca,'xticklabel',{'Channel 1~63 of P1','Channel 1~63 of P2'});set(gca,'yticklabel',{'Channel 1~63 of P1','Channel 1~63 of P2'});
title('RV - Diff - 3.9 ms')
saveas(2,'RV.jpg')
%OC
oc_tri = zeros(126,126);
p1_oc = load('p1_phi_OC.mat');
p2_oc = load('p2_phi_OC.mat');
cross_oc = load('cross_phi_OC.mat');
p1_oc_phi = p1_oc.phi;
p2_oc_phi = p2_oc.phi;
cross_oc_phi = cross_oc.phi;
oc_tri(1:63,1:63) = p1_oc_phi;
oc_tri(1:63,64:126) = cross_oc_phi;
oc_tri(64:126,64:126) = p2_oc_phi;
for i = 2:126
    for j = 1:i-1
        oc_tri(i,j) = oc_tri(j,i);
    end
end
figure(3);imagesc(oc_tri);colormap(gray);colorbar;
set(gca,'xtick',[31,94]);set(gca,'ytick',[31,94])
set(gca,'xticklabel',{'Channel 1~63 of P1','Channel 1~63 of P2'});set(gca,'yticklabel',{'Channel 1~63 of P1','Channel 1~63 of P2'});
title('OC - Diff - 3.9 ms')
saveas(3,'OC.jpg')
%Average
ave_tri = (tm_tri+rv_tri+oc_tri)/3;
figure(4);imagesc(ave_tri);colormap(gray);colorbar;
set(gca,'xtick',[31,94]);set(gca,'ytick',[31,94])
set(gca,'xticklabel',{'Channel 1~63 of P1','Channel 1~63 of P2'});set(gca,'yticklabel',{'Channel 1~63 of P1','Channel 1~63 of P2'});
title('Average - Diff - 3.9 ms')
saveas(4,'Average.jpg')

save('brch-diff-tm-170722.mat','tm_tri');
save('brch-diff-rv-170722.mat','rv_tri');
save('brch-diff-oc-170722.mat','oc_tri');
save('brch-diff-ave-170722.mat','ave_tri')