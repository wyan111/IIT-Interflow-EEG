tm_phi = load('phi_TM.mat');
tm_phi = tm_phi.phi_TM;
rv_phi = load('phi_RV.mat');
rv_phi = rv_phi.phi_RV;
oc_phi = load('phi_OC.mat');
oc_phi = oc_phi.phi_OC;


bar_tm = [mean(tm_phi(1:2)),mean(tm_phi(3:38))];
bar_rv = [mean(rv_phi(1:2)),mean(rv_phi(3:38))];
bar_oc = [mean(oc_phi(1:2)),mean(oc_phi(3:38))];
figure(1)
bar([tm_phi;rv_phi;oc_phi]);grid on;
set(gca,'xticklabel',{'TM','RV','OC'});ylabel('4-channel \Phi');

figure(2)
wit_brain = [tm_phi(1:2),rv_phi(1:2),oc_phi(1:2)];
acr_brain = [tm_phi(3:38),rv_phi(3:38),oc_phi(3:38)];
wit_std = std(wit_brain);
acr_std = std(acr_brain);
wit_ave = mean(wit_brain);
acr_ave = mean(acr_brain);

% Data to be plotted as a bar graph
model_series = [wit_ave;acr_ave;acr_2_ave]
%Data to be plotted as the error bars
model_error = [wit_std;acr_std;acr_2_ave];
% Creating axes and the bar graph
ax = axes;
h = bar(model_series,'BarWidth',1);
% Set color for each bar face
% h(1).FaceColor = 'blue';
% h(2).FaceColor = 'yellow';
% Properties of the bar graph as required
ax.GridLineStyle = '-';
xticks(ax,[1 2 3]);
% Creating a legend and placing it outside the bar plot
hold on;
% Finding the number of groups and the number of bars in each group
ngroups = size(model_series, 1);
nbars = size(model_series, 2);
% % Calculating the width for each bar group
 groupwidth = min(0.8, nbars/(nbars + 1.5));
% Set the position of each error bar in the centre of the main bar
% Based on barweb.m by Bolu Ajiboye from MATLAB File Exchange
for i = 1:nbars
    % Calculate center of each bar
    x = (1:ngroups) - groupwidth/2 + (2*i-1) * groupwidth / (2*nbars);
    errorbar(x, model_series(:,i), model_error(:,i), 'k', 'linestyle', 'none');
end

set(gca,'xticklabel',{'Within Brain','Across Brain'});
ylabel('4-channel \Phi');grid on;