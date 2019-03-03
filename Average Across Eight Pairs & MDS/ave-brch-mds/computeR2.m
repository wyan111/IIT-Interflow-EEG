R2mat = zeros(7938,36);
for iPair = 1:8
    for i = 1:18
            mat1 = cell2mat(sixteenP(iPair,i));
            mat2 = cell2mat(sixteenP(iPair+8,i));
            r = corr([mat1,mat2]);
            R2 = r.^2;
            R2acr = [R2(64:126,1:63),R2(1:63,64:126)];
            R2wit = [R2(1:63,1:63),R2(64:126,64:126)];
            R2acrnew = reshape(R2acr,63*126,1);
            R2witnew = reshape(R2wit,63*126,1);
            R2mat(:,i) = R2witnew;
            R2mat(:,i+18) = R2acrnew;
    end
        rr = corr(R2mat);
        RR2 = rr.^2;
        R2cell(1,iPair) = {RR2};
    end
    
R2sum = zeros(36,36);
for i = 1:8
%     figure
%     imagesc(cell2mat(R2cell(1,i)))
%     colorbar
%     title('Within Subjects')
%     set(gca,'xtick',[3.5,9.5,15.5,21.5,27.5,33.5]);set(gca,'ytick',[3.5,9.5,15.5,21.5,27.5,33.5]);set(gca,'FontSize',12);
%     set(gca,'xticklabel',{'Social Flow','Social Non-flow','Non-social Flow','Social Flow','Social Non-flow','Non-social Flow'});set(gca,'yticklabel',{'Social Flow','Social Non-flow','Non-social Flow'});
%     R2sum = cell2mat(R2cell(1,i));
%     R2forMDS = 1-R2sum;
%     figure;
%     [Y,e] = cmdscale(R2forMDS,2);
%     plot(Y(1:6,1),Y(1:6,2),'ro',Y(7:12,1),Y(7:12,2),'r+',Y(13:18,1),Y(13:18,2),'r*',Y(19:24,1),Y(19:24,2),'bo',Y(25:30,1),Y(25:30,2),'b+',Y(31:36,1),Y(31:36,2),'b*','markersize',6)
%     set(gca,'FontSize',16);
%     legend('Within - Social Flow','Within - Social Non-flow','Within - Non-social Flow','Across - Social Flow','Across - Social Non-flow','Across - Non-social Flow','location','North');grid on;title('Dissimilarity')
      R2sum = cell2mat(R2cell(1,i))+R2sum;
end
figure
R2sum = R2sum/8;
imagesc(R2sum);colorbar
title('Across Subjects')
set(gca,'xtick',[3.5,9.5,15.5,21.5,27.5,33.5]);set(gca,'ytick',[3.5,9.5,15.5,21.5,27.5,33.5]);set(gca,'FontSize',12);
set(gca,'xticklabel',{'Social Flow','Social Non-flow','Non-social Flow','Social Flow','Social Non-flow','Non-social Flow'});
set(gca,'yticklabel',{'Social Flow','Social Non-flow','Non-social Flow','Social Flow','Social Non-flow','Non-social Flow'});
% th=rotateticklabel(gca, 45);
R2forMDS = 1-R2sum;
figure
[Y,e] = cmdscale(R2forMDS,2);
plot(Y(1:6,1),Y(1:6,2),'ro',Y(7:12,1),Y(7:12,2),'r+',Y(13:18,1),Y(13:18,2),'r*',Y(19:24,1),Y(19:24,2),'bo',Y(25:30,1),Y(25:30,2),'b+',Y(31:36,1),Y(31:36,2),'b*','markersize',6)
set(gca,'FontSize',16);
legend('Within - Social Flow','Within - Social Non-flow','Within - Non-social Flow','Across - Social Flow','Across - Social Non-flow','Across - Non-social Flow','location','North');grid on;title('Dissimilarity')
% text(Y_tm(:,1)+0.005,Y_tm(:,2),labels);
% saveas(1,'1.jpg')