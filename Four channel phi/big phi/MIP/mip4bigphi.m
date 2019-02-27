%% load
clear
load('TM_json.mat');load('RV_json.mat');load('OC_json.mat');
%% TM
for i = 1:70
    for j = 1:16
        field1 = TM_json(i,j).cut_subsystem;
        field2 = field1.cut;
        from_nodes_TM(i,j) = {field2.from_nodes};
        to_nodes_TM(i,j) = {field2.to_nodes};
    end
end
% level 1
tm_level1_toA = 0;tm_level1_toB = 0;tm_level1_toC = 0;tm_level1_toD = 0;
tm_level1_toAB = 0;tm_level1_toAC = 0;tm_level1_toAD = 0;tm_level1_toBC = 0;tm_level1_toBD = 0;tm_level1_toCD = 0;
tm_level1_toABC = 0;tm_level1_toABD = 0;tm_level1_toACD = 0;tm_level1_toBCD = 0;
for i = 1:2
    for j = 1:16
       if length(to_nodes_TM{i,j}) == 1
         if to_nodes_TM{i,j} == 0
              tm_level1_toA = tm_level1_toA+1;
         elseif to_nodes_TM{i,j} == 1
              tm_level1_toB = tm_level1_toB+1;
         elseif to_nodes_TM{i,j} == 2
              tm_level1_toC = tm_level1_toC+1;
         elseif to_nodes_TM{i,j} == 3
              tm_level1_toD = tm_level1_toD+1;
         end
       elseif length(to_nodes_TM{i,j}) == 2
           array = to_nodes_TM{i,j};
              if array(1) == 0 && array(2) == 1 
              tm_level1_toAB = tm_level1_toAB+1;
              elseif array(1) == 0 && array(2) == 2
              tm_level1_toAC = tm_level1_toAC+1;
              elseif array(1) == 0 && array(2) == 3
              tm_level1_toAD = tm_level1_toAD+1;
              elseif array(1) == 1 && array(2) == 2 
              tm_level1_toBC = tm_level1_toBC+1;
              elseif array(1) == 1 && array(2) == 3 
              tm_level1_toBD = tm_level1_toBD+1;
              elseif array(1) == 2 && array(2) == 3 
              tm_level1_toCD = tm_level1_toCD+1;
              end
       elseif length(to_nodes_TM{i,j}) == 3
           array = to_nodes_TM{i,j};
           if array(1) == 0 && array(2) == 1 && array(3) == 2 
              tm_level1_toABC = tm_level1_toABC+1;
              elseif array(1) == 0 && array(2) == 1 && array(3) == 3 
              tm_level1_toABD = tm_level1_toABD+1;
              elseif array(1) == 0 && array(2) == 2 && array(3) == 3
              tm_level1_toACD = tm_level1_toACD+1;
              elseif array(1) == 1 && array(2) == 2 && array(3) == 3 
              tm_level1_toBCD = tm_level1_toBCD+1;   
           end
       end
       end
end
% level 2a
tm_level2a_toA = 0;tm_level2a_toB = 0;tm_level2a_toC = 0;tm_level2a_toD = 0;
tm_level2a_toAB = 0;tm_level2a_toAC = 0;tm_level2a_toAD = 0;tm_level2a_toBC = 0;tm_level2a_toBD = 0;tm_level2a_toCD = 0;
tm_level2a_toABC = 0;tm_level2a_toABD = 0;tm_level2a_toACD = 0;tm_level2a_toBCD = 0;
for i = 3:18
    for j = 1:16
       if length(to_nodes_TM{i,j}) == 1
         if to_nodes_TM{i,j} == 0
              tm_level2a_toA = tm_level2a_toA+1;
         elseif to_nodes_TM{i,j} == 1
              tm_level2a_toB = tm_level2a_toB+1;
         elseif to_nodes_TM{i,j} == 2
              tm_level2a_toC = tm_level2a_toC+1;
         elseif to_nodes_TM{i,j} == 3
              tm_level2a_toD = tm_level2a_toD+1;
         end
       elseif length(to_nodes_TM{i,j}) == 2
           array = to_nodes_TM{i,j};
              if array(1) == 0 && array(2) == 1 
              tm_level2a_toAB = tm_level2a_toAB+1;
              elseif array(1) == 0 && array(2) == 2
              tm_level2a_toAC = tm_level2a_toAC+1;
              elseif array(1) == 0 && array(2) == 3
              tm_level2a_toAD = tm_level2a_toAD+1;
              elseif array(1) == 1 && array(2) == 2 
              tm_level2a_toBC = tm_level2a_toBC+1;
              elseif array(1) == 1 && array(2) == 3 
              tm_level2a_toBD = tm_level2a_toBD+1;
              elseif array(1) == 2 && array(2) == 3 
              tm_level2a_toCD = tm_level2a_toCD+1;
              end
       elseif length(to_nodes_TM{i,j}) == 3
           array = to_nodes_TM{i,j};
           if array(1) == 0 && array(2) == 1 && array(3) == 2 
              tm_level2a_toABC = tm_level2a_toABC+1;
              elseif array(1) == 0 && array(2) == 1 && array(3) == 3 
              tm_level2a_toABD = tm_level2a_toABD+1;
              elseif array(1) == 0 && array(2) == 2 && array(3) == 3
              tm_level2a_toACD = tm_level2a_toACD+1;
              elseif array(1) == 1 && array(2) == 2 && array(3) == 3 
              tm_level2a_toBCD = tm_level2a_toBCD+1;   
           end
       end
       end
end
% level 2b
tm_level2b_toA = 0;tm_level2b_toB = 0;tm_level2b_toC = 0;tm_level2b_toD = 0;
tm_level2b_toAB = 0;tm_level2b_toAC = 0;tm_level2b_toAD = 0;tm_level2b_toBC = 0;tm_level2b_toBD = 0;tm_level2b_toCD = 0;
tm_level2b_toABC = 0;tm_level2b_toABD = 0;tm_level2b_toACD = 0;tm_level2b_toBCD = 0;
for i = 19:34
    for j = 1:16
       if length(to_nodes_TM{i,j}) == 1
         if to_nodes_TM{i,j} == 0
              tm_level2b_toA = tm_level2b_toA+1;
         elseif to_nodes_TM{i,j} == 1
              tm_level2b_toB = tm_level2b_toB+1;
         elseif to_nodes_TM{i,j} == 2
              tm_level2b_toC = tm_level2b_toC+1;
         elseif to_nodes_TM{i,j} == 3
              tm_level2b_toD = tm_level2b_toD+1;
         end
       elseif length(to_nodes_TM{i,j}) == 2
           array = to_nodes_TM{i,j};
              if array(1) == 0 && array(2) == 1 
              tm_level2b_toAB = tm_level2b_toAB+1;
              elseif array(1) == 0 && array(2) == 2
              tm_level2b_toAC = tm_level2b_toAC+1;
              elseif array(1) == 0 && array(2) == 3
              tm_level2b_toAD = tm_level2b_toAD+1;
              elseif array(1) == 1 && array(2) == 2 
              tm_level2b_toBC = tm_level2b_toBC+1;
              elseif array(1) == 1 && array(2) == 3 
              tm_level2b_toBD = tm_level2b_toBD+1;
              elseif array(1) == 2 && array(2) == 3 
              tm_level2b_toCD = tm_level2b_toCD+1;
              end
       elseif length(to_nodes_TM{i,j}) == 3
           array = to_nodes_TM{i,j};
           if array(1) == 0 && array(2) == 1 && array(3) == 2 
              tm_level2b_toABC = tm_level2b_toABC+1;
              elseif array(1) == 0 && array(2) == 1 && array(3) == 3 
              tm_level2b_toABD = tm_level2b_toABD+1;
              elseif array(1) == 0 && array(2) == 2 && array(3) == 3
              tm_level2b_toACD = tm_level2b_toACD+1;
              elseif array(1) == 1 && array(2) == 2 && array(3) == 3 
              tm_level2b_toBCD = tm_level2b_toBCD+1;   
           end
       end
       end
end
% level 3
tm_level3_toA = 0;tm_level3_toB = 0;tm_level3_toC = 0;tm_level3_toD = 0;
tm_level3_toAB = 0;tm_level3_toAC = 0;tm_level3_toAD = 0;tm_level3_toBC = 0;tm_level3_toBD = 0;tm_level3_toCD = 0;
tm_level3_toABC = 0;tm_level3_toABD = 0;tm_level3_toACD = 0;tm_level3_toBCD = 0;
for i = 35:70
    for j = 1:16
       if length(to_nodes_TM{i,j}) == 1
         if to_nodes_TM{i,j} == 0
              tm_level3_toA = tm_level3_toA+1;
         elseif to_nodes_TM{i,j} == 1
              tm_level3_toB = tm_level3_toB+1;
         elseif to_nodes_TM{i,j} == 2
              tm_level3_toC = tm_level3_toC+1;
         elseif to_nodes_TM{i,j} == 3
              tm_level3_toD = tm_level3_toD+1;
         end
       elseif length(to_nodes_TM{i,j}) == 2
           array = to_nodes_TM{i,j};
              if array(1) == 0 && array(2) == 1 
              tm_level3_toAB = tm_level3_toAB+1;
              elseif array(1) == 0 && array(2) == 2
              tm_level3_toAC = tm_level3_toAC+1;
              elseif array(1) == 0 && array(2) == 3
              tm_level3_toAD = tm_level3_toAD+1;
              elseif array(1) == 1 && array(2) == 2 
              tm_level3_toBC = tm_level3_toBC+1;
              elseif array(1) == 1 && array(2) == 3 
              tm_level3_toBD = tm_level3_toBD+1;
              elseif array(1) == 2 && array(2) == 3 
              tm_level3_toCD = tm_level3_toCD+1;
              end
       elseif length(to_nodes_TM{i,j}) == 3
           array = to_nodes_TM{i,j};
           if array(1) == 0 && array(2) == 1 && array(3) == 2 
              tm_level3_toABC = tm_level3_toABC+1;
              elseif array(1) == 0 && array(2) == 1 && array(3) == 3 
              tm_level3_toABD = tm_level3_toABD+1;
              elseif array(1) == 0 && array(2) == 2 && array(3) == 3
              tm_level3_toACD = tm_level3_toACD+1;
              elseif array(1) == 1 && array(2) == 2 && array(3) == 3 
              tm_level3_toBCD = tm_level3_toBCD+1;   
           end
       end
       end
end
%% RV
for i = 1:70
    for j = 1:16
        field1 = RV_json(i,j).cut_subsystem;
        field2 = field1.cut;
        from_nodes_RV(i,j) = {field2.from_nodes};
        to_nodes_RV(i,j) = {field2.to_nodes};
    end
end
% level 1
rv_level1_toA = 0;rv_level1_toB = 0;rv_level1_toC = 0;rv_level1_toD = 0;
rv_level1_toAB = 0;rv_level1_toAC = 0;rv_level1_toAD = 0;rv_level1_toBC = 0;rv_level1_toBD = 0;rv_level1_toCD = 0;
rv_level1_toABC = 0;rv_level1_toABD = 0;rv_level1_toACD = 0;rv_level1_toBCD = 0;
for i = 1:2
    for j = 1:16
       if length(to_nodes_RV{i,j}) == 1
         if to_nodes_RV{i,j} == 0
              rv_level1_toA = rv_level1_toA+1;
         elseif to_nodes_RV{i,j} == 1
              rv_level1_toB = rv_level1_toB+1;
         elseif to_nodes_RV{i,j} == 2
              rv_level1_toC = rv_level1_toC+1;
         elseif to_nodes_RV{i,j} == 3
              rv_level1_toD = rv_level1_toD+1;
         end
       elseif length(to_nodes_RV{i,j}) == 2
           array = to_nodes_RV{i,j};
              if array(1) == 0 && array(2) == 1 
              rv_level1_toAB = rv_level1_toAB+1;
              elseif array(1) == 0 && array(2) == 2
              rv_level1_toAC = rv_level1_toAC+1;
              elseif array(1) == 0 && array(2) == 3
              rv_level1_toAD = rv_level1_toAD+1;
              elseif array(1) == 1 && array(2) == 2 
              rv_level1_toBC = rv_level1_toBC+1;
              elseif array(1) == 1 && array(2) == 3 
              rv_level1_toBD = rv_level1_toBD+1;
              elseif array(1) == 2 && array(2) == 3 
              rv_level1_toCD = rv_level1_toCD+1;
              end
       elseif length(to_nodes_RV{i,j}) == 3
           array = to_nodes_RV{i,j};
           if array(1) == 0 && array(2) == 1 && array(3) == 2 
              rv_level1_toABC = rv_level1_toABC+1;
              elseif array(1) == 0 && array(2) == 1 && array(3) == 3 
              rv_level1_toABD = rv_level1_toABD+1;
              elseif array(1) == 0 && array(2) == 2 && array(3) == 3
              rv_level1_toACD = rv_level1_toACD+1;
              elseif array(1) == 1 && array(2) == 2 && array(3) == 3 
              rv_level1_toBCD = rv_level1_toBCD+1;   
           end
       end
       end
end
% level 2a
rv_level2a_toA = 0;rv_level2a_toB = 0;rv_level2a_toC = 0;rv_level2a_toD = 0;
rv_level2a_toAB = 0;rv_level2a_toAC = 0;rv_level2a_toAD = 0;rv_level2a_toBC = 0;rv_level2a_toBD = 0;rv_level2a_toCD = 0;
rv_level2a_toABC = 0;rv_level2a_toABD = 0;rv_level2a_toACD = 0;rv_level2a_toBCD = 0;
for i = 3:18
    for j = 1:16
       if length(to_nodes_RV{i,j}) == 1
         if to_nodes_RV{i,j} == 0
              rv_level2a_toA = rv_level2a_toA+1;
         elseif to_nodes_RV{i,j} == 1
              rv_level2a_toB = rv_level2a_toB+1;
         elseif to_nodes_RV{i,j} == 2
              rv_level2a_toC = rv_level2a_toC+1;
         elseif to_nodes_RV{i,j} == 3
              rv_level2a_toD = rv_level2a_toD+1;
         end
       elseif length(to_nodes_RV{i,j}) == 2
           array = to_nodes_RV{i,j};
              if array(1) == 0 && array(2) == 1 
              rv_level2a_toAB = rv_level2a_toAB+1;
              elseif array(1) == 0 && array(2) == 2
              rv_level2a_toAC = rv_level2a_toAC+1;
              elseif array(1) == 0 && array(2) == 3
              rv_level2a_toAD = rv_level2a_toAD+1;
              elseif array(1) == 1 && array(2) == 2 
              rv_level2a_toBC = rv_level2a_toBC+1;
              elseif array(1) == 1 && array(2) == 3 
              rv_level2a_toBD = rv_level2a_toBD+1;
              elseif array(1) == 2 && array(2) == 3 
              rv_level2a_toCD = rv_level2a_toCD+1;
              end
       elseif length(to_nodes_RV{i,j}) == 3
           array = to_nodes_RV{i,j};
           if array(1) == 0 && array(2) == 1 && array(3) == 2 
              rv_level2a_toABC = rv_level2a_toABC+1;
              elseif array(1) == 0 && array(2) == 1 && array(3) == 3 
              rv_level2a_toABD = rv_level2a_toABD+1;
              elseif array(1) == 0 && array(2) == 2 && array(3) == 3
              rv_level2a_toACD = rv_level2a_toACD+1;
              elseif array(1) == 1 && array(2) == 2 && array(3) == 3 
              rv_level2a_toBCD = rv_level2a_toBCD+1;   
           end
       end
       end
end
% level 2b
rv_level2b_toA = 0;rv_level2b_toB = 0;rv_level2b_toC = 0;rv_level2b_toD = 0;
rv_level2b_toAB = 0;rv_level2b_toAC = 0;rv_level2b_toAD = 0;rv_level2b_toBC = 0;rv_level2b_toBD = 0;rv_level2b_toCD = 0;
rv_level2b_toABC = 0;rv_level2b_toABD = 0;rv_level2b_toACD = 0;rv_level2b_toBCD = 0;
for i = 19:34
    for j = 1:16
       if length(to_nodes_RV{i,j}) == 1
         if to_nodes_RV{i,j} == 0
              rv_level2b_toA = rv_level2b_toA+1;
         elseif to_nodes_RV{i,j} == 1
              rv_level2b_toB = rv_level2b_toB+1;
         elseif to_nodes_RV{i,j} == 2
              rv_level2b_toC = rv_level2b_toC+1;
         elseif to_nodes_RV{i,j} == 3
              rv_level2b_toD = rv_level2b_toD+1;
         end
       elseif length(to_nodes_RV{i,j}) == 2
           array = to_nodes_RV{i,j};
              if array(1) == 0 && array(2) == 1 
              rv_level2b_toAB = rv_level2b_toAB+1;
              elseif array(1) == 0 && array(2) == 2
              rv_level2b_toAC = rv_level2b_toAC+1;
              elseif array(1) == 0 && array(2) == 3
              rv_level2b_toAD = rv_level2b_toAD+1;
              elseif array(1) == 1 && array(2) == 2 
              rv_level2b_toBC = rv_level2b_toBC+1;
              elseif array(1) == 1 && array(2) == 3 
              rv_level2b_toBD = rv_level2b_toBD+1;
              elseif array(1) == 2 && array(2) == 3 
              rv_level2b_toCD = rv_level2b_toCD+1;
              end
       elseif length(to_nodes_RV{i,j}) == 3
           array = to_nodes_RV{i,j};
           if array(1) == 0 && array(2) == 1 && array(3) == 2 
              rv_level2b_toABC = rv_level2b_toABC+1;
              elseif array(1) == 0 && array(2) == 1 && array(3) == 3 
              rv_level2b_toABD = rv_level2b_toABD+1;
              elseif array(1) == 0 && array(2) == 2 && array(3) == 3
              rv_level2b_toACD = rv_level2b_toACD+1;
              elseif array(1) == 1 && array(2) == 2 && array(3) == 3 
              rv_level2b_toBCD = rv_level2b_toBCD+1;   
           end
       end
       end
end
% level 3
rv_level3_toA = 0;rv_level3_toB = 0;rv_level3_toC = 0;rv_level3_toD = 0;
rv_level3_toAB = 0;rv_level3_toAC = 0;rv_level3_toAD = 0;rv_level3_toBC = 0;rv_level3_toBD = 0;rv_level3_toCD = 0;
rv_level3_toABC = 0;rv_level3_toABD = 0;rv_level3_toACD = 0;rv_level3_toBCD = 0;
for i = 35:70
    for j = 1:16
       if length(to_nodes_RV{i,j}) == 1
         if to_nodes_RV{i,j} == 0
              rv_level3_toA = rv_level3_toA+1;
         elseif to_nodes_RV{i,j} == 1
              rv_level3_toB = rv_level3_toB+1;
         elseif to_nodes_RV{i,j} == 2
              rv_level3_toC = rv_level3_toC+1;
         elseif to_nodes_RV{i,j} == 3
              rv_level3_toD = rv_level3_toD+1;
         end
       elseif length(to_nodes_RV{i,j}) == 2
           array = to_nodes_RV{i,j};
              if array(1) == 0 && array(2) == 1 
              rv_level3_toAB = rv_level3_toAB+1;
              elseif array(1) == 0 && array(2) == 2
              rv_level3_toAC = rv_level3_toAC+1;
              elseif array(1) == 0 && array(2) == 3
              rv_level3_toAD = rv_level3_toAD+1;
              elseif array(1) == 1 && array(2) == 2 
              rv_level3_toBC = rv_level3_toBC+1;
              elseif array(1) == 1 && array(2) == 3 
              rv_level3_toBD = rv_level3_toBD+1;
              elseif array(1) == 2 && array(2) == 3 
              rv_level3_toCD = rv_level3_toCD+1;
              end
       elseif length(to_nodes_RV{i,j}) == 3
           array = to_nodes_RV{i,j};
           if array(1) == 0 && array(2) == 1 && array(3) == 2 
              rv_level3_toABC = rv_level3_toABC+1;
              elseif array(1) == 0 && array(2) == 1 && array(3) == 3 
              rv_level3_toABD = rv_level3_toABD+1;
              elseif array(1) == 0 && array(2) == 2 && array(3) == 3
              rv_level3_toACD = rv_level3_toACD+1;
              elseif array(1) == 1 && array(2) == 2 && array(3) == 3 
              rv_level3_toBCD = rv_level3_toBCD+1;   
           end
       end
       end
end
%% OC
% OC
for i = 1:70
    for j = 1:16
        field1 = OC_json(i,j).cut_subsystem;
        field2 = field1.cut;
        from_nodes_OC(i,j) = {field2.from_nodes};
        to_nodes_OC(i,j) = {field2.to_nodes};
    end
end
% level 1
oc_level1_toA = 0;oc_level1_toB = 0;oc_level1_toC = 0;oc_level1_toD = 0;
oc_level1_toAB = 0;oc_level1_toAC = 0;oc_level1_toAD = 0;oc_level1_toBC = 0;oc_level1_toBD = 0;oc_level1_toCD = 0;
oc_level1_toABC = 0;oc_level1_toABD = 0;oc_level1_toACD = 0;oc_level1_toBCD = 0;
for i = 1:2
    for j = 1:16
       if length(to_nodes_OC{i,j}) == 1
         if to_nodes_OC{i,j} == 0
              oc_level1_toA = oc_level1_toA+1;
         elseif to_nodes_OC{i,j} == 1
              oc_level1_toB = oc_level1_toB+1;
         elseif to_nodes_OC{i,j} == 2
              oc_level1_toC = oc_level1_toC+1;
         elseif to_nodes_OC{i,j} == 3
              oc_level1_toD = oc_level1_toD+1;
         end
       elseif length(to_nodes_OC{i,j}) == 2
           array = to_nodes_OC{i,j};
              if array(1) == 0 && array(2) == 1 
              oc_level1_toAB = oc_level1_toAB+1;
              elseif array(1) == 0 && array(2) == 2
              oc_level1_toAC = oc_level1_toAC+1;
              elseif array(1) == 0 && array(2) == 3
              oc_level1_toAD = oc_level1_toAD+1;
              elseif array(1) == 1 && array(2) == 2 
              oc_level1_toBC = oc_level1_toBC+1;
              elseif array(1) == 1 && array(2) == 3 
              oc_level1_toBD = oc_level1_toBD+1;
              elseif array(1) == 2 && array(2) == 3 
              oc_level1_toCD = oc_level1_toCD+1;
              end
       elseif length(to_nodes_OC{i,j}) == 3
           array = to_nodes_OC{i,j};
           if array(1) == 0 && array(2) == 1 && array(3) == 2 
              oc_level1_toABC = oc_level1_toABC+1;
              elseif array(1) == 0 && array(2) == 1 && array(3) == 3 
              oc_level1_toABD = oc_level1_toABD+1;
              elseif array(1) == 0 && array(2) == 2 && array(3) == 3
              oc_level1_toACD = oc_level1_toACD+1;
              elseif array(1) == 1 && array(2) == 2 && array(3) == 3 
              oc_level1_toBCD = oc_level1_toBCD+1;   
           end
       end
       end
end
% level 2a
oc_level2a_toA = 0;oc_level2a_toB = 0;oc_level2a_toC = 0;oc_level2a_toD = 0;
oc_level2a_toAB = 0;oc_level2a_toAC = 0;oc_level2a_toAD = 0;oc_level2a_toBC = 0;oc_level2a_toBD = 0;oc_level2a_toCD = 0;
oc_level2a_toABC = 0;oc_level2a_toABD = 0;oc_level2a_toACD = 0;oc_level2a_toBCD = 0;
for i = 3:18
    for j = 1:16
       if length(to_nodes_OC{i,j}) == 1
         if to_nodes_OC{i,j} == 0
              oc_level2a_toA = oc_level2a_toA+1;
         elseif to_nodes_OC{i,j} == 1
              oc_level2a_toB = oc_level2a_toB+1;
         elseif to_nodes_OC{i,j} == 2
              oc_level2a_toC = oc_level2a_toC+1;
         elseif to_nodes_OC{i,j} == 3
              oc_level2a_toD = oc_level2a_toD+1;
         end
       elseif length(to_nodes_OC{i,j}) == 2
           array = to_nodes_OC{i,j};
              if array(1) == 0 && array(2) == 1 
              oc_level2a_toAB = oc_level2a_toAB+1;
              elseif array(1) == 0 && array(2) == 2
              oc_level2a_toAC = oc_level2a_toAC+1;
              elseif array(1) == 0 && array(2) == 3
              oc_level2a_toAD = oc_level2a_toAD+1;
              elseif array(1) == 1 && array(2) == 2 
              oc_level2a_toBC = oc_level2a_toBC+1;
              elseif array(1) == 1 && array(2) == 3 
              oc_level2a_toBD = oc_level2a_toBD+1;
              elseif array(1) == 2 && array(2) == 3 
              oc_level2a_toCD = oc_level2a_toCD+1;
              end
       elseif length(to_nodes_OC{i,j}) == 3
           array = to_nodes_OC{i,j};
           if array(1) == 0 && array(2) == 1 && array(3) == 2 
              oc_level2a_toABC = oc_level2a_toABC+1;
              elseif array(1) == 0 && array(2) == 1 && array(3) == 3 
              oc_level2a_toABD = oc_level2a_toABD+1;
              elseif array(1) == 0 && array(2) == 2 && array(3) == 3
              oc_level2a_toACD = oc_level2a_toACD+1;
              elseif array(1) == 1 && array(2) == 2 && array(3) == 3 
              oc_level2a_toBCD = oc_level2a_toBCD+1;   
           end
       end
       end
end
% level 2b
oc_level2b_toA = 0;oc_level2b_toB = 0;oc_level2b_toC = 0;oc_level2b_toD = 0;
oc_level2b_toAB = 0;oc_level2b_toAC = 0;oc_level2b_toAD = 0;oc_level2b_toBC = 0;oc_level2b_toBD = 0;oc_level2b_toCD = 0;
oc_level2b_toABC = 0;oc_level2b_toABD = 0;oc_level2b_toACD = 0;oc_level2b_toBCD = 0;
for i = 19:34
    for j = 1:16
       if length(to_nodes_OC{i,j}) == 1
         if to_nodes_OC{i,j} == 0
              oc_level2b_toA = oc_level2b_toA+1;
         elseif to_nodes_OC{i,j} == 1
              oc_level2b_toB = oc_level2b_toB+1;
         elseif to_nodes_OC{i,j} == 2
              oc_level2b_toC = oc_level2b_toC+1;
         elseif to_nodes_OC{i,j} == 3
              oc_level2b_toD = oc_level2b_toD+1;
         end
       elseif length(to_nodes_OC{i,j}) == 2
           array = to_nodes_OC{i,j};
              if array(1) == 0 && array(2) == 1 
              oc_level2b_toAB = oc_level2b_toAB+1;
              elseif array(1) == 0 && array(2) == 2
              oc_level2b_toAC = oc_level2b_toAC+1;
              elseif array(1) == 0 && array(2) == 3
              oc_level2b_toAD = oc_level2b_toAD+1;
              elseif array(1) == 1 && array(2) == 2 
              oc_level2b_toBC = oc_level2b_toBC+1;
              elseif array(1) == 1 && array(2) == 3 
              oc_level2b_toBD = oc_level2b_toBD+1;
              elseif array(1) == 2 && array(2) == 3 
              oc_level2b_toCD = oc_level2b_toCD+1;
              end
       elseif length(to_nodes_OC{i,j}) == 3
           array = to_nodes_OC{i,j};
           if array(1) == 0 && array(2) == 1 && array(3) == 2 
              oc_level2b_toABC = oc_level2b_toABC+1;
              elseif array(1) == 0 && array(2) == 1 && array(3) == 3 
              oc_level2b_toABD = oc_level2b_toABD+1;
              elseif array(1) == 0 && array(2) == 2 && array(3) == 3
              oc_level2b_toACD = oc_level2b_toACD+1;
              elseif array(1) == 1 && array(2) == 2 && array(3) == 3 
              oc_level2b_toBCD = oc_level2b_toBCD+1;   
           end
       end
       end
end
% level 3
oc_level3_toA = 0;oc_level3_toB = 0;oc_level3_toC = 0;oc_level3_toD = 0;
oc_level3_toAB = 0;oc_level3_toAC = 0;oc_level3_toAD = 0;oc_level3_toBC = 0;oc_level3_toBD = 0;oc_level3_toCD = 0;
oc_level3_toABC = 0;oc_level3_toABD = 0;oc_level3_toACD = 0;oc_level3_toBCD = 0;
for i = 35:70
    for j = 1:16
       if length(to_nodes_OC{i,j}) == 1
         if to_nodes_OC{i,j} == 0
              oc_level3_toA = oc_level3_toA+1;
         elseif to_nodes_OC{i,j} == 1
              oc_level3_toB = oc_level3_toB+1;
         elseif to_nodes_OC{i,j} == 2
              oc_level3_toC = oc_level3_toC+1;
         elseif to_nodes_OC{i,j} == 3
              oc_level3_toD = oc_level3_toD+1;
         end
       elseif length(to_nodes_OC{i,j}) == 2
           array = to_nodes_OC{i,j};
              if array(1) == 0 && array(2) == 1 
              oc_level3_toAB = oc_level3_toAB+1;
              elseif array(1) == 0 && array(2) == 2
              oc_level3_toAC = oc_level3_toAC+1;
              elseif array(1) == 0 && array(2) == 3
              oc_level3_toAD = oc_level3_toAD+1;
              elseif array(1) == 1 && array(2) == 2 
              oc_level3_toBC = oc_level3_toBC+1;
              elseif array(1) == 1 && array(2) == 3 
              oc_level3_toBD = oc_level3_toBD+1;
              elseif array(1) == 2 && array(2) == 3 
              oc_level3_toCD = oc_level3_toCD+1;
              end
       elseif length(to_nodes_OC{i,j}) == 3
           array = to_nodes_OC{i,j};
           if array(1) == 0 && array(2) == 1 && array(3) == 2 
              oc_level3_toABC = oc_level3_toABC+1;
              elseif array(1) == 0 && array(2) == 1 && array(3) == 3 
              oc_level3_toABD = oc_level3_toABD+1;
              elseif array(1) == 0 && array(2) == 2 && array(3) == 3
              oc_level3_toACD = oc_level3_toACD+1;
              elseif array(1) == 1 && array(2) == 2 && array(3) == 3 
              oc_level3_toBCD = oc_level3_toBCD+1;   
           end
       end
       end
end
%%
tm_level1 = [];tm_level2a = [];tm_level3 = [];
rv_level1 = [];rv_level2a = [];rv_level3 = [];
oc_level1 = [];oc_level2a = [];oc_level3 = [];
tm_level1 = [tm_level1_toA,tm_level1_toB,tm_level1_toC,tm_level1_toD,...
tm_level1_toAB,tm_level1_toAC,tm_level1_toAD,tm_level1_toBC,tm_level1_toBD,tm_level1_toCD,...
tm_level1_toABC,tm_level1_toABD,tm_level1_toACD,tm_level1_toBCD,0,0;];

tm_level2a = [tm_level2a_toA,tm_level2a_toB,tm_level2a_toC,tm_level2a_toD,...
tm_level2a_toAB,tm_level2a_toAC,tm_level2a_toAD,tm_level2a_toBC,tm_level2a_toBD,tm_level2a_toCD,...
tm_level2a_toABC,tm_level2a_toABD,tm_level2a_toACD,tm_level2a_toBCD];

tm_level2b = [tm_level2b_toA,tm_level2b_toB,tm_level2b_toC,tm_level2b_toD,...
tm_level2b_toAB,tm_level2b_toAC,tm_level2b_toAD,tm_level2b_toBC,tm_level2b_toBD,tm_level2b_toCD,...
tm_level2b_toABC,tm_level2b_toABD,tm_level2b_toACD,tm_level2b_toBCD];

tm_level3 = [tm_level3_toA,tm_level3_toB,tm_level3_toC,tm_level3_toD,...
tm_level3_toAB,tm_level3_toAC,tm_level3_toAD,tm_level3_toBC,tm_level3_toBD,tm_level3_toCD,...
tm_level3_toABC,tm_level3_toABD,tm_level3_toACD,tm_level3_toBCD];

rv_level1 = [rv_level1_toA,rv_level1_toB,rv_level1_toC,rv_level1_toD,...
rv_level1_toAB,rv_level1_toAC,rv_level1_toAD,rv_level1_toBC,rv_level1_toBD,rv_level1_toCD,...
rv_level1_toABC,rv_level1_toABD,rv_level1_toACD,rv_level1_toBCD];

rv_level2a = [rv_level2a_toA,rv_level2a_toB,rv_level2a_toC,rv_level2a_toD,...
rv_level2a_toAB,rv_level2a_toAC,rv_level2a_toAD,rv_level2a_toBC,rv_level2a_toBD,rv_level2a_toCD,...
rv_level2a_toABC,rv_level2a_toABD,rv_level2a_toACD,rv_level2a_toBCD];

rv_level2b = [rv_level2b_toA,rv_level2b_toB,rv_level2b_toC,rv_level2b_toD,...
rv_level2b_toAB,rv_level2b_toAC,rv_level2b_toAD,rv_level2b_toBC,rv_level2b_toBD,rv_level2b_toCD,...
rv_level2b_toABC,rv_level2b_toABD,rv_level2b_toACD,rv_level2b_toBCD];

rv_level3 = [rv_level3_toA,rv_level3_toB,rv_level3_toC,rv_level3_toD,...
rv_level3_toAB,rv_level3_toAC,rv_level3_toAD,rv_level3_toBC,rv_level3_toBD,rv_level3_toCD,...
rv_level3_toABC,rv_level3_toABD,rv_level3_toACD,rv_level3_toBCD];

oc_level1 = [oc_level1_toA,oc_level1_toB,oc_level1_toC,oc_level1_toD,...
oc_level1_toAB,oc_level1_toAC,oc_level1_toAD,oc_level1_toBC,oc_level1_toBD,oc_level1_toCD,...
oc_level1_toABC,oc_level1_toABD,oc_level1_toACD,oc_level1_toBCD];

oc_level2a = [oc_level2a_toA,oc_level2a_toB,oc_level2a_toC,oc_level2a_toD,...
oc_level2a_toAB,oc_level2a_toAC,oc_level2a_toAD,oc_level2a_toBC,oc_level2a_toBD,oc_level2a_toCD,...
oc_level2a_toABC,oc_level2a_toABD,oc_level2a_toACD,oc_level2a_toBCD];

oc_level2b = [oc_level2b_toA,oc_level2b_toB,oc_level2b_toC,oc_level2b_toD,...
oc_level2b_toAB,oc_level2b_toAC,oc_level2b_toAD,oc_level2b_toBC,oc_level2b_toBD,oc_level2b_toCD,...
oc_level2b_toABC,oc_level2b_toABD,oc_level2b_toACD,oc_level2b_toBCD];

oc_level3 = [oc_level3_toA,oc_level3_toB,oc_level3_toC,oc_level3_toD,...
oc_level3_toAB,oc_level3_toAC,oc_level3_toAD,oc_level3_toBC,oc_level3_toBD,oc_level3_toCD,...
oc_level3_toABC,oc_level3_toABD,oc_level3_toACD,oc_level3_toBCD];

figure
bar(tm_level1)
set(gca,'xtick',[1:14])
set(gca,'xticklabel',{'A','B','C','D','AB','AC','AD','BC','BD','CD','ABC','ABD','ACD','BCD'})

figure
bar(tm_level2a)
set(gca,'xticklabel',{'A','B','C','D','AB','AC','AD','BC','BD','CD','ABC','ABD','ACD','BCD'})

figure
bar(tm_level2b)
set(gca,'xticklabel',{'A','B','C','D','AB','AC','AD','BC','BD','CD','ABC','ABD','ACD','BCD'})

figure
bar(tm_level3)
set(gca,'xticklabel',{'A','B','C','D','AB','AC','AD','BC','BD','CD','ABC','ABD','ACD','BCD'})


figure
bar(rv_level1)
set(gca,'xticklabel',{'A','B','C','D','AB','AC','AD','BC','BD','CD','ABC','ABD','ACD','BCD'})

figure
bar(rv_level2a)
set(gca,'xticklabel',{'A','B','C','D','AB','AC','AD','BC','BD','CD','ABC','ABD','ACD','BCD'})
figure
bar(rv_level2b)
set(gca,'xticklabel',{'A','B','C','D','AB','AC','AD','BC','BD','CD','ABC','ABD','ACD','BCD'})
figure
bar(rv_level3)
set(gca,'xticklabel',{'A','B','C','D','AB','AC','AD','BC','BD','CD','ABC','ABD','ACD','BCD'})
figure
bar(oc_level1)
set(gca,'xticklabel',{'A','B','C','D','AB','AC','AD','BC','BD','CD','ABC','ABD','ACD','BCD'})
figure
bar(oc_level2a)
set(gca,'xticklabel',{'A','B','C','D','AB','AC','AD','BC','BD','CD','ABC','ABD','ACD','BCD'})
figure
bar(oc_level2b)
set(gca,'xticklabel',{'A','B','C','D','AB','AC','AD','BC','BD','CD','ABC','ABD','ACD','BCD'})
figure
bar(oc_level3)
set(gca,'xticklabel',{'A','B','C','D','AB','AC','AD','BC','BD','CD','ABC','ABD','ACD','BCD'})

% saveas(1,'tm1.jpg')
% saveas(2,'tm2a.jpg')
% saveas(3,'tm2b.jpg')
% saveas(4,'tm3.jpg')
% saveas(5,'rv1.jpg')
% saveas(6,'rv2a.jpg')
% saveas(7,'rv2b.jpg')
% saveas(8,'rv3.jpg')
% saveas(9,'oc1.jpg')
% saveas(10,'oc2a.jpg')
% saveas(11,'oc2b.jpg')
% saveas(12,'oc3.jpg')

%% final plot
% figure
% tm_level1_final = [sum(tm_level1(1:4)),sum(tm_level1(5:10)),sum(tm_level1(11:14))];
% bar(tm_level1_final/32);set(gca,'xticklabel',{'','',''});ylabel('Frequency');
% figure
% rv_level1_final = [sum(rv_level1(1:4)),sum(rv_level1(5:10)),sum(rv_level1(11:14))];
% bar(rv_level1_final/32);set(gca,'xticklabel',{'','',''});ylabel('Frequency');
% figure
% oc_level1_final = [sum(oc_level1(1:4)),sum(oc_level1(5:10)),sum(oc_level1(11:14))];
% bar(oc_level1_final/32);set(gca,'xticklabel',{'','',''});ylabel('Frequency');
% 
% figure
% tm_level2_final = [tm_level2a(1)+tm_level2b(4),sum(tm_level2a(2:4))+sum(tm_level2b(1:3)),...
%     sum(tm_level2a(8:10))+sum(tm_level2b(5:7)),sum(tm_level2a(5:7))+sum(tm_level2b(8:10)),tm_level2a(14)+sum(tm_level2b(11:13)),sum(tm_level2a(11:13))+tm_level2b(14)];
% bar(tm_level2_final/512);set(gca,'xticklabel',{'','',''});ylabel('Frequency');
% figure
% rv_level2_final = [rv_level2a(1)+rv_level2b(4),sum(rv_level2a(2:4))+sum(rv_level2b(1:3)),...
%     sum(rv_level2a(8:10))+sum(rv_level2b(5:7)),sum(rv_level2a(5:7))+sum(rv_level2b(8:10)),rv_level2a(14)+sum(rv_level2b(11:13)),sum(rv_level2a(11:13))+rv_level2b(14)];
% bar(rv_level2_final/512);set(gca,'xticklabel',{'','',''});ylabel('Frequency');
% figure
% oc_level2_final = [oc_level2a(1)+oc_level2b(4),sum(oc_level2a(2:4))+sum(oc_level2b(1:3)),...
%   oc_level2a(14)+sum(oc_level2b(11:13)),sum(oc_level2a(11:13))+oc_level2b(14)];
% bar(oc_level2_final/512);set(gca,'xticklabel',{'','',''});ylabel('Frequency');

figure
tm_level3_final = [sum(tm_level3(1:4)),tm_level3(5)+tm_level3(10),...
    sum(tm_level3(11:14))];
bar(tm_level3_final/576);set(gca,'xticklabel',{'','',''});ylabel('Frequency');
figure
rv_level3_final = [sum(rv_level3(1:4)),sum(rv_level3(6:9)),rv_level3(5)+rv_level3(10),...
    sum(rv_level3(11:14))];
bar(rv_level3_final/576);set(gca,'xticklabel',{'','',''});ylabel('Frequency');
figure
oc_level3_final = [sum(oc_level3(1:4)),sum(oc_level3(6:9)),oc_level3(5)+oc_level3(10),...
    sum(oc_level3(11:14))];
bar(oc_level3_final/576);set(gca,'xticklabel',{'','',''});ylabel('Frequency');
