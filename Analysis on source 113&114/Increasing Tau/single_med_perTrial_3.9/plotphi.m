%TM
phi1 = [0.062239 0.001591 0.007131 0.001505 0.002065 0.070077];
%TMRV
phi2 = [0.047079 0.000959 0.003388 0.002477 0.011175 0.088748];
%TMOC
phi3 = [0.06876  0.004562 0.007739 0.001557 0.002713 0.074774];

for i=1:6
    phi_all(i,:) =[phi1(i) phi2(i) phi3(i)];
end

% to make within brain at first two colume
phi_al(1,:) = phi_all(1,:);
phi_al(3:6,:) = phi_all(2:5,:);
phi_al(2,:) = phi_all(6,:);
bar_phi_al = bar(phi_al)
grid on;legend(bar_phi_al,'TM','TMRV','TMOC','location','north');
%set(gca,'xticklabel',{' ',' ',' ',' '});
ylabel('Phi');title('Phi - Single median per trial - 3 conditions - S113 and S114 -Tau 3.9ms')
