togall = [togave11 togave12;togave21 togave22];
imagesc(togall)
% xlabel('TPM btw WL S113 and WL 114                      TPM btw WL S113 and MD S113')
% ylabel('TPM btw WL S113 and WL 114      TPM btw WL S113 and MD S113')
% set(gca,'xticklabel',{'TM','TMRV','TMOC','TM','TMRV','TMOC'});
% set(gca,'yticklabel',{'TM','TMRV','TMOC','TM','TMRV','TMOC'});colorbar;
% title('Kullback-Leibler Divergence')
bar_mat = [0 0 0]
for i = 1:6
    bar_mat1(i) = togall(i,i);
end

bar_mat3 = [togave12;togave21];
bar_mat2 = [togall(1,2:3),togall(3,1:2),togall(4,5:6),togall(6,4:5),togall(2,1),togall(2,3),togall(5,4),togall(5,6)]
a = [mean(bar_mat1(:)),mean(bar_mat2(:)),mean(bar_mat3(:))];

c = bar(a);grid on;hold on;
set(gca,'xticklabel',{'Within Brain and condition','Within Brain Across Condition','Across Brain'});
title('KL divergence');
ylabel('KL divergence');
er = errorbar([1,2,3],[mean(bar_mat1(:));mean(bar_mat2(:));mean(bar_mat3(:))],[std(bar_mat1(:));std(bar_mat2(:));std(bar_mat3(:))])
er.Color = [0 0 0];
er.LineStyle = 'none';