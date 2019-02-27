%% load
clear;clc;
load('TM_json.mat');
%% minimum(phi_cau,phi_eff) purview
for i = 1:70 %70 conbinations
    for j = 1:16 % 16 states
    for k = 1:15 % 15 concepts
        field1 = TM_json(i,j).ces;
        field2 = field1.concepts(k);
        phi = field2.phi; 
        cause = field2.cause;effect = field2.effect;
        cause_field1 = cause.ria;effect_field1 = effect.ria;
        cause_phi = cause_field1.phi;effect_phi = effect_field1.phi;
        %cau = 1;eff = 2;both = 3;
        if cause_phi == effect_phi
              cau_or_eff(j,k) = 3;
        elseif phi == cause_phi
              cau_or_eff(j,k) = 1;
              first_order_purview = cause_field1.purview;
              first_order_purview_cell(j,k) = {first_order_purview};
        elseif phi == effect_phi
              cau_or_eff(j,k) = 2;
              first_order_purview = effect_field1.purview;
              first_order_purview_cell(j,k) = {first_order_purview};
        end             
    end
    end
              cau_or_eff70(1,i) = {cau_or_eff};
              first_order_purview_70(1,i) = {first_order_purview_cell};
end
%% level 3:1
% 1:3
% concept A
k_range = [1 2 3 4 8 9 10 14];
A = 0;B = 0;C = 0;D = 0;BC = 0;BD = 0;CD = 0;BCD = 0;
AB = 0;AC = 0;AD = 0;ABC = 0;ABD = 0;ACD = 0;ABCD = 0;
for k = 1:8
A = 0;B = 0;C = 0;D = 0;BC = 0;BD = 0;CD = 0;BCD = 0;
AB = 0;AC = 0;AD = 0;ABC = 0;ABD = 0;ACD = 0;ABCD = 0;
for i = 3:18
    for j = 1:16
    data1 = first_order_purview_70{1,i};
    data2 = data1{j,k};
    if length(data2) == 1
      if data2 == 0
        A = A+1;
      elseif data2 == 1
        B = B+1;
      elseif data2 == 2
        C = C+1;
      elseif data2 == 3
        D = D+1;
      end
    elseif length(data2) == 2
       if data2(1) == 0 && data2(2) == 1
        AB = AB+1;
       elseif data2(1) == 0 && data2(2) == 2
        AC = AC+1;
       elseif data2(1) == 0 && data2(2) == 3
        AD = AD+1;
       elseif data2(1) == 1 && data2(2) == 2
        BC = BC+1;
       elseif data2(1) == 1 && data2(2) == 3
        BD = BD+1;
       elseif data2(1) == 2 && data2(2) == 3
        CD = CD+1;
       end
    elseif length(data2) == 3
       if data2(1) == 0 && data2(2) == 1 && data2(3) == 2
        ABC = ABC+1;
       elseif data2(1) == 0 && data2(2) == 1 && data2(3) == 3
        ABD = ABD+1;
        elseif data2(1) == 0 && data2(2) == 2 && data2(3) == 3
        ACD = ACD+1;
       elseif data2(1) == 1 && data2(2) == 2 && data2(3) == 3
        BCD = BCD+1;
       end
     elseif length(data2) == 4
        ABCD = ABCD+1;
    end
    end
end
purview_mat1(k,:) = [A B C D AB AC AD BC BD CD BCD ABC ABD ACD ABCD];
end
a = purview_mat1(1,1);b = purview_mat1(1,[5 6 7 11 12 13 15]);c = purview_mat1(1,[2 3 4 8 9 10 14]);
d = purview_mat1(2:8,[2 3 4 8 9 10 14]);e = purview_mat1(2:8,[5 6 7 11 12 13 15]);f = purview_mat1(2:8,1);
within1 = sum(a(:))+sum(d(:));
across1 = sum(b(:))+sum(e(:));
other1 = sum(c(:))+sum(f(:));
bar([within1 across1 other1]/(16*8*16))
set(gca,'xticklabel',{'Purview within','Purview across','Purview other'})
ylabel('Frequency (Total counts 3456)')
% 1:3
% concept A
k_range = [1 2 3 4 5 6 7 11];
A = 0;B = 0;C = 0;D = 0;BC = 0;BD = 0;CD = 0;BCD = 0;
AB = 0;AC = 0;AD = 0;ABC = 0;ABD = 0;ACD = 0;ABCD = 0;
for k = 1:8
A = 0;B = 0;C = 0;D = 0;BC = 0;BD = 0;CD = 0;BCD = 0;
AB = 0;AC = 0;AD = 0;ABC = 0;ABD = 0;ACD = 0;ABCD = 0;
for i = 19:34
    for j = 1:16
    data1 = first_order_purview_70{1,i};
    data2 = data1{j,k};
    if length(data2) == 1
      if data2 == 0
        A = A+1;
      elseif data2 == 1
        B = B+1;
      elseif data2 == 2
        C = C+1;
      elseif data2 == 3
        D = D+1;
      end
    elseif length(data2) == 2
       if data2(1) == 0 && data2(2) == 1
        AB = AB+1;
       elseif data2(1) == 0 && data2(2) == 2
        AC = AC+1;
       elseif data2(1) == 0 && data2(2) == 3
        AD = AD+1;
       elseif data2(1) == 1 && data2(2) == 2
        BC = BC+1;
       elseif data2(1) == 1 && data2(2) == 3
        BD = BD+1;
       elseif data2(1) == 2 && data2(2) == 3
        CD = CD+1;
       end
    elseif length(data2) == 3
       if data2(1) == 0 && data2(2) == 1 && data2(3) == 2
        ABC = ABC+1;
       elseif data2(1) == 0 && data2(2) == 1 && data2(3) == 3
        ABD = ABD+1;
        elseif data2(1) == 0 && data2(2) == 2 && data2(3) == 3
        ACD = ACD+1;
       elseif data2(1) == 1 && data2(2) == 2 && data2(3) == 3
        BCD = BCD+1;
       end
     elseif length(data2) == 4
        ABCD = ABCD+1;
    end
    end
end
purview_mat1(k,:) = [A B C D AB AC AD BC BD CD BCD ABC ABD ACD ABCD];
end
a = purview_mat1([1 2 3 5 6 7 8],[1 2 3 5 6 8 11]);b = purview_mat1([1 2 3 5 6 7 8],[7 9 10 12 13 14 15]);c = purview_mat1([1 2 3 5 6 7 8],4);
d = purview_mat1(4,4);e = purview_mat1(4,[7 9 10 12 13 14 15]);f = purview_mat1(4,[1 2 3 5 6 8 11]);
within2 = sum(a(:))+sum(d(:));
across2 = sum(b(:))+sum(e(:));
other2 = sum(c(:))+sum(f(:));
bar([within1+within2 across1+across2 other1+other2]/4096)
set(gca,'xticklabel',{'Purview within','Purview across','Purview other'})
ylabel('Frequency (Total counts 4096)')
%% level 2:2
% 2:2
% concept A
k_range = [1 2 3 4 5 10];a = [];b = [];c = [];
A = 0;B = 0;C = 0;D = 0;BC = 0;BD = 0;CD = 0;BCD = 0;
AB = 0;AC = 0;AD = 0;ABC = 0;ABD = 0;ACD = 0;ABCD = 0;
for k = 1:6
A = 0;B = 0;C = 0;D = 0;BC = 0;BD = 0;CD = 0;BCD = 0;
AB = 0;AC = 0;AD = 0;ABC = 0;ABD = 0;ACD = 0;ABCD = 0;
for i = 35:70
    for j = 1:16
    data1 = first_order_purview_70{1,i};
    data2 = data1{j,k};
    if length(data2) == 1
      if data2 == 0
        A = A+1;
      elseif data2 == 1
        B = B+1;
      elseif data2 == 2
        C = C+1;
      elseif data2 == 3
        D = D+1;
      end
    elseif length(data2) == 2
       if data2(1) == 0 && data2(2) == 1
        AB = AB+1;
       elseif data2(1) == 0 && data2(2) == 2
        AC = AC+1;
       elseif data2(1) == 0 && data2(2) == 3
        AD = AD+1;
       elseif data2(1) == 1 && data2(2) == 2
        BC = BC+1;
       elseif data2(1) == 1 && data2(2) == 3
        BD = BD+1;
       elseif data2(1) == 2 && data2(2) == 3
        CD = CD+1;
       end
    elseif length(data2) == 3
       if data2(1) == 0 && data2(2) == 1 && data2(3) == 2
        ABC = ABC+1;
       elseif data2(1) == 0 && data2(2) == 1 && data2(3) == 3
        ABD = ABD+1;
        elseif data2(1) == 0 && data2(2) == 2 && data2(3) == 3
        ACD = ACD+1;
       elseif data2(1) == 1 && data2(2) == 2 && data2(3) == 3
        BCD = BCD+1;
       end
     elseif length(data2) == 4
        ABCD = ABCD+1;
    end
    end
end
purview_mat(k,:) = [A B C D AB AC AD BC BD CD BCD ABC ABD ACD ABCD];
end
a = purview_mat([1 2 5],[1,2,5]);b = purview_mat([1 2 5],[6 7 8 9 11 12 13 14 15]);c = purview_mat([1 2 5],[3,4,10]);
d = purview_mat([3 4 6],[3,4,10]);e = purview_mat([3 4 6],[6 7 8 9 11 12 13 14 15]);f = purview_mat([3 4 6],[1 2 5]);
within = sum(a(:))+sum(d(:));
across = sum(b(:))+sum(e(:));
other = sum(c(:))+sum(f(:));
bar([within across other]/(16*6*36))
set(gca,'xticklabel',{'Purview within','Purview across','Purview other'})
ylabel('Frequency (Total counts 3456)')