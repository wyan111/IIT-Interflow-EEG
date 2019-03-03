TM = [0.00504617 0.00056339 0.00047742 0.00038392 0.00046087 0.00172109] ;
RV = [0.00368498 0.00036165 0.00065475 0.0005558  0.00149313 0.00357451];
OC = [0.00715739 0.00028337 0.00108477 0.00099231 0.00036136 0.0056926];
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