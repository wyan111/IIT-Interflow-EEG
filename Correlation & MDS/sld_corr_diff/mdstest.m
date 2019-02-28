 %load R2 values
data = load('R2_RV.mat');
R2 = data.R2;
%dis-similarity
dissimilarity = 1-R2;
%labels for each sources
for i = 1:148
    labels{1,i} = ['wl' num2str(i)];
end
for i = 1:148
    labels{1,i+148} = ['md' num2str(i)];
end
%plot
%dissimilarity
figure(4)
[Yd,ed] = cmdscale(dissimilarity,2);
plot(Yd(:,1),Yd(:,2),'.')
text(Yd(:,1)+0.005,Yd(:,2),labels);grid on;title('Dissimilarity')
