%TM
%diff method tao = 3.9 ms
phi1 = [0.00504617 0.00056339 0.00047742 0.00038392 0.00046087 0.00172109];
%diff method tao = 7.8ms
phi2 = [6.75053691e-04 7.10355018e-05 1.05495794e-04 7.05178616e-05 8.12329531e-05 6.79453526e-05];
bar(phi1)
bar_phi1 = bar(phi1);
grid on;set(gca,'xticklabel',{' ',' ',' ',' '});
ylabel('Phi');title('Phi - difference binarise method - TM - S113 and S114 -Tao 3.9 ms')