TM = [0.010412 0.055688 0.035826 0.03847  0.008722 0.080184];
RV = [0.102678 0.038326 0.070737 0.019861 0.117423 0.013012];
OC = [0.028777 0.031023 0.022145 0.036697 0.037274 0.025524];
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