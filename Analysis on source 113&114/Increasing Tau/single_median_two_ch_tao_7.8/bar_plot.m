TM = [0.0255   0.041717 0.033068 0.044143 0.00359  0.071529];
RV = [0.091707 0.025264 0.050438 0.010857 0.054577 0.01282];
OC = [0.041285 0.028452 0.01103  0.026636 0.031938 0.001575];
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
title('Phi - Single median per trial - 3 conditions - S113 and S114 - Tau 7.8 ms')
legend('TM','RV','OC')