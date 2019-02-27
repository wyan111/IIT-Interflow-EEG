clear
load('RV_json.mat');
load('TPM_RV.mat');
filename = {'RVlevel1','RVlevel2a','RVlevel2b','RVlevel3'};
krange = [1 2 3 18 19 34 35 70];
phirow = [2 16 16 36];
kminus = [0 2 18 34];
ilevel = 2;
titlename = {...
    '4 sources within same subjects',...
    '1 sources within same subjects and 3 in the other',...
    '3 sources within same subjects and 1 in the other',...
    '2 sources within same subjects and 2 in the other'};

%%
phi = zeros(phirow(ilevel),15);
for k = krange(ilevel*2-1):krange(ilevel*2)
fre = TPM_RV{2,k};
for i = 1:15 
for j = 1:16
    data = RV_json(k,j).ces.concepts;
    phi_by_state = data(i).phi;
    phi(k-kminus(ilevel),i) = phi(k-kminus(ilevel),i)+phi_by_state*fre(j);
end
end
end
weighted_phi = mean(phi);
%%
% figoutput = {'s0000','s1000','s0100','s1100',...
%     's0010','s1010','s0110','s1110',...
%     's0001','s1001','s0101','s1101',...
%     's0011','s1011','s0111','s1111'};
% titlename = {'State (0,0,0,0)','State (1,0,0,0)','State (0,1,0,0)','State (1,1,0,0)',...
%     'State (0,0,1,0)','State (1,0,1,0)','State (0,1,1,0)','State (1,1,1,0)',...
%     'State (0,0,0,1)','State (1,0,0,1)','State (0,1,0,1)','State (1,1,0,1)',...
%     'State (0,0,1,1)','State (1,0,1,1)','State (0,1,1,1)','State (1,1,1,1)'};
%%
y = [1.4 2.8 4.2 5.6 1 2 3 4 5 6 1.4 2.8 4.2 5.6 3.5];
x = [1 1 1 1 2 2 2 2 2 2 3 3 3 3 4];
concept_labels = {'A','B','C','D',...  % 1 2 3 4
    'AB','AC','AD','BC','BD','CD',...  % 5 6 7 8 9 10
    'ABC','ABD','ACD','BCD',...        % 11 12 13 14
    'ABCD'};                           % 15
figure;
scatter3(x(1:4), y(1:4), weighted_phi(1:4),500,'r.');
hold on
scatter3(x(5:10), y(5:10), weighted_phi(5:10),500,'c.');
hold on
scatter3(x(11:14), y(11:14), weighted_phi(11:14),500,'b.');
hold on
scatter3(x(15), y(15), weighted_phi(15),500,'g.');
hold on
grid off

for i = 1:15
    concepts(i,:) = [x(i) y(i) weighted_phi(i)];
end

line([concepts(1,1),concepts(5,1)],[concepts(1,2),concepts(5,2)],[concepts(1,3),concepts(5,3)])
line([concepts(1,1),concepts(6,1)],[concepts(1,2),concepts(6,2)],[concepts(1,3),concepts(6,3)])
line([concepts(1,1),concepts(7,1)],[concepts(1,2),concepts(7,2)],[concepts(1,3),concepts(7,3)])

line([concepts(2,1),concepts(5,1)],[concepts(2,2),concepts(5,2)],[concepts(2,3),concepts(5,3)])
line([concepts(2,1),concepts(8,1)],[concepts(2,2),concepts(8,2)],[concepts(2,3),concepts(8,3)])
line([concepts(2,1),concepts(9,1)],[concepts(2,2),concepts(9,2)],[concepts(2,3),concepts(9,3)])

line([concepts(3,1),concepts(6,1)],[concepts(3,2),concepts(6,2)],[concepts(3,3),concepts(6,3)])
line([concepts(3,1),concepts(8,1)],[concepts(3,2),concepts(8,2)],[concepts(3,3),concepts(8,3)])
line([concepts(3,1),concepts(10,1)],[concepts(3,2),concepts(10,2)],[concepts(3,3),concepts(10,3)])

line([concepts(4,1),concepts(7,1)],[concepts(4,2),concepts(7,2)],[concepts(4,3),concepts(7,3)])
line([concepts(4,1),concepts(9,1)],[concepts(4,2),concepts(9,2)],[concepts(4,3),concepts(9,3)])
line([concepts(4,1),concepts(10,1)],[concepts(4,2),concepts(10,2)],[concepts(4,3),concepts(10,3)])

line([concepts(5,1),concepts(11,1)],[concepts(5,2),concepts(11,2)],[concepts(5,3),concepts(11,3)])
line([concepts(5,1),concepts(12,1)],[concepts(5,2),concepts(12,2)],[concepts(5,3),concepts(12,3)])

line([concepts(6,1),concepts(13,1)],[concepts(6,2),concepts(13,2)],[concepts(6,3),concepts(13,3)])
line([concepts(6,1),concepts(14,1)],[concepts(6,2),concepts(14,2)],[concepts(6,3),concepts(14,3)])

line([concepts(7,1),concepts(12,1)],[concepts(7,2),concepts(12,2)],[concepts(7,3),concepts(12,3)])
line([concepts(7,1),concepts(13,1)],[concepts(7,2),concepts(13,2)],[concepts(7,3),concepts(13,3)])

line([concepts(8,1),concepts(11,1)],[concepts(8,2),concepts(11,2)],[concepts(8,3),concepts(11,3)])
line([concepts(8,1),concepts(14,1)],[concepts(8,2),concepts(14,2)],[concepts(8,3),concepts(14,3)])

line([concepts(9,1),concepts(12,1)],[concepts(9,2),concepts(12,2)],[concepts(9,3),concepts(12,3)])
line([concepts(9,1),concepts(14,1)],[concepts(9,2),concepts(14,2)],[concepts(9,3),concepts(14,3)])

line([concepts(10,1),concepts(13,1)],[concepts(10,2),concepts(13,2)],[concepts(10,3),concepts(13,3)])
line([concepts(10,1),concepts(14,1)],[concepts(10,2),concepts(14,2)],[concepts(10,3),concepts(14,3)])

line([concepts(15,1),concepts(11,1)],[concepts(15,2),concepts(11,2)],[concepts(15,3),concepts(11,3)])
line([concepts(15,1),concepts(12,1)],[concepts(15,2),concepts(12,2)],[concepts(15,3),concepts(12,3)])
line([concepts(15,1),concepts(13,1)],[concepts(15,2),concepts(13,2)],[concepts(15,3),concepts(13,3)])
line([concepts(15,1),concepts(14,1)],[concepts(15,2),concepts(14,2)],[concepts(15,3),concepts(14,3)])

axis([1 4 0 6 0 0.35])
xticklabels(gca,{'','','','','','','',''});yticklabels(gca,{'','','','','','','',''});
zlabel('Weighted-average \phi');title(titlename{ilevel})
text(x+0.1, y+0.1, weighted_phi, concept_labels)
%% Rotate and turn into video frames

% Angles of elevation for top and side views
el_top = 89; % at 90-89, the y axis location flips from one side of the plot to the other, so start from 89
el_hor = 0;
az_min = 0;
az_max = 360 + az_min;


% Rotation angles
top2hor = linspace(el_top, el_hor, 100); % rotate from top view to side view
hor2hor = linspace(az_min, az_max, 360); % rotate side view
hor2top = linspace(el_hor, el_top, 100); % rotate from side view to top view

% Pad vertical and horizontal rotations
azimuth = [zeros(size(top2hor))+az_min hor2hor zeros(size(hor2top))+az_min]; % rotation during side view
elevation = [top2hor zeros(size(hor2hor))+el_hor hor2top]; % rotation from top to side and back

frames = cell(size(azimuth));
for view_angle = 1 : length(azimuth)
    view([azimuth(view_angle) elevation(view_angle)]);
    drawnow
    frame = getframe(gcf);
    frames{view_angle} = frame2im(frame);
end

%% Write frames into gif

video_duration = 10; % in seconds
frame_duration = video_duration / length(azimuth);

for frame = 1 : length(frames)
    [mapped_frame, map] = rgb2ind(frames{frame}, 256);
    if frame == 1
        imwrite(mapped_frame, map, [filename{ilevel} '.gif'], 'gif', 'LoopCount', Inf, 'DelayTime', frame_duration);
    else
        imwrite(mapped_frame, map, [filename{ilevel} '.gif'], 'gif', 'WriteMode', 'append', 'DelayTime', frame_duration);
    end
end