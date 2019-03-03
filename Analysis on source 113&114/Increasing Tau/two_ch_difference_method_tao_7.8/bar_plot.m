TM = [6.75053691e-04 7.10355018e-05 1.05495794e-04 7.05178616e-05 8.12329531e-05 6.79453526e-05];
RV = [2.27775946e-03 4.98010520e-05 4.26049378e-06 1.11183123e-04 3.59830860e-04 3.42242668e-04];
OC = [1.16684209e-03 9.17309341e-05 1.28736584e-05 1.46662446e-05 8.30055436e-05 1.02265058e-03];
bar_mat = zeros(6,3);
for i = 1:6
    phi_all(i,:) = [TM(i) RV(i) OC(i)];
end

% to make within brain at first two colume
phi_al(1,:) = phi_all(1,:);
phi_al(3:6,:) = phi_all(2:5,:);
phi_al(2,:) = phi_all(6,:);
bar_phi_al = bar(phi_al)
grid on;legend(bar_phi_al,'TM','TMRV','TMOC','location','north');
%set(gca,'xticklabel',{' ',' ',' ',' '});
title('Phi - Single median per trial - 3 conditions - S113 and S114 - Tau 15.6 ms')
legend('TM','RV','OC')