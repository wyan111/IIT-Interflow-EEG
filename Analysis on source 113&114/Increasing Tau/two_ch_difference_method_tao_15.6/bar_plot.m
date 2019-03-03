TM = [0.02508  0.001162 0.000356 0.001133 0.002362 0.001302];
RV = [0.026535 0.00037  0.000687 0.000553 0.000813 0.001658];
OC = [0.011645 0.00263  0.001107 0.000614 0.000493 0.002232];
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
title('Phi - Diff Method - 3 conditions - S113 and S114 - Tau 15.6 ms')
legend('TM','RV','OC')