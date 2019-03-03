%%
for iPair = 5:8
    for i = 1:18
        for j = 1:18
            mat1 = cell2mat(sixteenP(iPair,i));
            mat2 = cell2mat(sixteenP(iPair+8,i));
            mat3 = cell2mat(sixteenP(iPair,j));
            mat4 = cell2mat(sixteenP(iPair+8,j));
            r1 = corr([mat1,mat2]);
            r2 = corr([mat3,mat4]);
            R21 = r1.^2;
            R22 = r2.^2;
            %delete diagol
            R21new = reshape(R21(1:148,149:296),148*148,1);
            R22new = reshape(R22(1:148,149:296),148*148,1);
            R2mat(i,j) = corr(R21new,R22new);
        end
    end
    R2cell(1,iPair) = {R2mat};
end
%%
R2sum = zeros(18,18);
 for i = 1:8
%     figure
%     imagesc(cell2mat(R2cell(1,i)))
%     colorbar
%     title('Within Subjects')
%     set(gca,'xtick',[3.5,9.5,15.5]);set(gca,'ytick',[3.5,9.5,15.5]);set(gca,'FontSize',12);
%     set(gca,'xticklabel',{'Social Flow','Social Non-flow','Non-social Flow'});set(gca,'yticklabel',{'Social Flow','Social Non-flow','Non-social Flow'});
%     R2sum = cell2mat(R2cell(1,i));
%     R2forMDS = 1-R2sum;
%     figure;
%     [Y,e] = cmdscale(R2forMDS,2);
%     plot(Y(1:6,1),Y(1:6,2),'co',Y(7:12,1),Y(7:12,2),'go',Y(13:18,1),Y(13:18,2),'ro')
%     set(gca,'FontSize',16);
%     legend('Social Flow','Social Non-flow','Non-social Flow','location','North');grid on;title('Dissimilarity')
 R2sum = cell2mat(R2cell(1,i))+R2sum;
end

figure
R2sum = R2sum/8;
imagesc(R2sum);colorbar
title('Across Subjects')
set(gca,'xtick',[3.5,9.5,15.5]);set(gca,'ytick',[3.5,9.5,15.5]);set(gca,'FontSize',12);
set(gca,'xticklabel',{'Social Flow','Social Non-flow','Non-social Flow'});set(gca,'yticklabel',{'Social Flow','Social Non-flow','Non-social Flow'});
R2forMDS = 1-R2sum;
figure
[Y,e] = cmdscale(R2forMDS,2);
plot(Y(1:6,1),Y(1:6,2),'co',Y(7:12,1),Y(7:12,2),'go',Y(13:18,1),Y(13:18,2),'ro')
set(gca,'FontSize',16);
legend('Social Flow','Social Non-flow','Non-social Flow','location','North');grid on;title('Dissimilarity')
for i = 1:6
    labels{1,i} = ['Trial ' num2str(i)];
    labels{1,6+i} = ['Trial ' num2str(i)];
    labels{1,12+i} = ['Trial ' num2str(i)];
end
text(Y(:,1)+0.009,Y(:,2),labels);