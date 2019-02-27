%% load
clear;clc;
load('OC_json.mat');
%% minimum(phi_cau,phi_eff) purview
for i = 1:70 %70 conbinations
    for j = 1:16 % 16 states
    for k = 1:15 % 15 concepts
        field1 = OC_json(i,j).ces;
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
% within
A = 0;B = 0;C = 0;D = 0;BC = 0;BD = 0;CD = 0;BCD = 0;
% Across
AB = 0;AC = 0;AD = 0;ABC = 0;ABD = 0;ACD = 0;ABCD = 0;
for i = 3:18
    for j = 1:16
        for k = 1:15
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
end
fo_purview_array13 = [A B C D BC BD CD BCD AB AC AD ABC ABD ACD ABCD];

% 3:1
% within
A2 = 0;B2 = 0;C2 = 0;D2 = 0;BC2 = 0;BD2 = 0;CD2 = 0;BCD2 = 0;
% Across
AB2 = 0;AC2 = 0;AD2 = 0;ABC2 = 0;ABD2 = 0;ACD2 = 0;ABCD2 = 0;
for i = 19:34
    for j = 1:16
        for k = 1:15
    data3 = first_order_purview_70{1,i};
    data4 = data1{j,k};
    if length(data4) == 1
      if data4 == 0
        A2 = A2+1;
      elseif data4 == 1
        B2 = B2+1;
      elseif data4 == 2
        C2 = C2+1;
      elseif data4 == 3
        D2 = D2+1;
      end
    elseif length(data4) == 2
       if data4(1) == 0 && data4(2) == 1
        AB2 = AB2+1;
       elseif data4(1) == 0 && data4(2) == 2
        AC2 = AC2+1;
       elseif data4(1) == 0 && data4(2) == 3
        AD2 = AD2+1;
       elseif data4(1) == 1 && data4(2) == 2
        BC2 = BC2+1;
       elseif data4(1) == 1 && data4(2) == 3
        BD2 = BD2+1;
       elseif data4(1) == 2 && data4(2) == 3
        CD2 = CD2+1;
       end
    elseif length(data4) == 3
       if data4(1) == 0 && data4(2) == 1 && data4(3) == 2
        ABC2 = ABC2+1;
       elseif data4(1) == 0 && data4(2) == 1 && data4(3) == 3
        ABD2 = ABD2+1;
        elseif data4(1) == 0 && data4(2) == 2 && data4(3) == 3
        ACD2 = ACD2+1;
       elseif data4(1) == 1 && data4(2) == 2 && data4(3) == 3
        BCD2 = BCD2+1;
       end
     elseif length(data4) == 4
        ABCD2 = ABCD2+1;
    end
        end
    end
end
fo_purview_array31 = [A2 B2 C2 D2 AB2 BC2 AC2 ABC2 AD2 BD2 CD2 ABD2 ACD2 BCD2 ABCD2];
bar([sum(fo_purview_array13(1:8))+sum(fo_purview_array31(1:8)),...
     sum(fo_purview_array13(9:15))+sum(fo_purview_array31(9:15))]/(15*16*32));
set(gca,'xticklabel',{'Purview within subjects','Purview across subjects'});
ylabel('Frequency (Total counts 7680)');title('3:1')
%% level 2:2
% within
A = 0;B = 0;C = 0;D = 0;AB = 0;CD = 0;
% Across
ABC = 0;ACD = 0;ABD = 0;BCD = 0;AC = 0;AD = 0;BD = 0;BC = 0;ABCD = 0;
for i = 35:70
    for j = 1:16
        for k = 1:15
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
end
fo_purview_array22 = [A B C D AB CD ABC BCD ABD ACD AC AD BC BD ABCD];
bar([sum(fo_purview_array22(1:6)),sum(fo_purview_array22(7:15))]/(15*36*16))
set(gca,'xticklabel',{'Purview within subjects','Purview across subjects'});
ylabel('Frequency (Total counts 8640)');title('2:2')
%% cause purview
for i = 1:70 %70 conbinations
    for j = 1:16 % 16 states
        for k = 1:15 % 15 concepts
        field1 = OC_json(i,j).ces;
        field2 = field1.concepts(k);
        phi = field2.phi; 
        cause = field2.cause;
        cause_field1 = cause.ria;
        first_order_purview = cause_field1.purview;
        first_order_purview_cell(j,k) = {first_order_purview};
 
              mipcell(j,k) = {first_order_purview};
        end
              cau_or_eff70(1,i) = {cau_or_eff};
              first_order_purview_cau70(1,i) = {first_order_purview_cell};
        end
end
%% level 3:1
% 1:3
% within
A = 0;B = 0;C = 0;D = 0;BC = 0;BD = 0;CD = 0;BCD = 0;
% Across
AB = 0;AC = 0;AD = 0;ABC = 0;ABD = 0;ACD = 0;ABCD = 0;
for i = 3:18
    for j = 1:16
        for k = 1:15
    data1 = first_order_purview_cau70{1,i};
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
end
fo_purview_array_cau13 = [A B C D BC BD CD BCD AB AC AD ABC ABD ACD ABCD];

% 3:1
% within
A2 = 0;B2 = 0;C2 = 0;D2 = 0;BC2 = 0;BD2 = 0;CD2 = 0;BCD2 = 0;
% Across
AB2 = 0;AC2 = 0;AD2 = 0;ABC2 = 0;ABD2 = 0;ACD2 = 0;ABCD2 = 0;
for i = 19:34
    for j = 1:16
        for k = 1:15
    data3 = first_order_purview_cau70{1,i};
    data4 = data1{j,k};
    if length(data4) == 1
      if data4 == 0
        A2 = A2+1;
      elseif data4 == 1
        B2 = B2+1;
      elseif data4 == 2
        C2 = C2+1;
      elseif data4 == 3
        D2 = D2+1;
      end
    elseif length(data4) == 2
       if data4(1) == 0 && data4(2) == 1
        AB2 = AB2+1;
       elseif data4(1) == 0 && data4(2) == 2
        AC2 = AC2+1;
       elseif data4(1) == 0 && data4(2) == 3
        AD2 = AD2+1;
       elseif data4(1) == 1 && data4(2) == 2
        BC2 = BC2+1;
       elseif data4(1) == 1 && data4(2) == 3
        BD2 = BD2+1;
       elseif data4(1) == 2 && data4(2) == 3
        CD2 = CD2+1;
       end
    elseif length(data4) == 3
       if data4(1) == 0 && data4(2) == 1 && data4(3) == 2
        ABC2 = ABC2+1;
       elseif data4(1) == 0 && data4(2) == 1 && data4(3) == 3
        ABD2 = ABD2+1;
        elseif data4(1) == 0 && data4(2) == 2 && data4(3) == 3
        ACD2 = ACD2+1;
       elseif data4(1) == 1 && data4(2) == 2 && data4(3) == 3
        BCD2 = BCD2+1;
       end
     elseif length(data4) == 4
        ABCD2 = ABCD2+1;
    end
        end
    end
end
fo_purview_array_cau31 = [A2 B2 C2 D2 AB2 BC2 AC2 ABC2 AD2 BD2 CD2 ABD2 ACD2 BCD2 ABCD2];
bar([sum(fo_purview_array_cau13(1:8))+sum(fo_purview_array_cau31(1:8)),...
     sum(fo_purview_array_cau13(9:15))+sum(fo_purview_array_cau31(9:15))]/(15*16*32));
set(gca,'xticklabel',{'Purview within subjects','Purview across subjects'});
ylabel('Frequency (Total counts 7680)');title('3:1')
%% level 2:2
% within
A = 0;B = 0;C = 0;D = 0;AB = 0;CD = 0;
% Across
ABC = 0;ACD = 0;ABD = 0;BCD = 0;AC = 0;AD = 0;BD = 0;BC = 0;ABCD = 0;
for i = 35:70
    for j = 1:16
        for k = 1:15
    data1 = first_order_purview_cau70{1,i};
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
end
fo_purview_array_cau22 = [A B C D AB CD ABC BCD ABD ACD AC AD BC BD ABCD];
bar([sum(fo_purview_array_cau22(1:6)),sum(fo_purview_array_cau22(7:15))]/(15*36*16))
set(gca,'xticklabel',{'Purview within subjects','Purview across subjects'});
ylabel('Frequency (Total counts 8640)');title('2:2')
%% effect purview
for i = 1:70 %70 conbinations
    for j = 1:16 % 16 states
        for k = 1:15 % 15 concepts
        field1 = OC_json(i,j).ces;
        field2 = field1.concepts(k);
        phi = field2.phi; 
        effect = field2.effect;
        effect_field1 = effect.ria;
        first_order_purview = effect_field1.purview;
        first_order_purview_cell(j,k) = {first_order_purview};
 
              mipcell(j,k) = {first_order_purview};
        end
              cau_or_eff70(1,i) = {cau_or_eff};
              first_order_purview_eff70(1,i) = {first_order_purview_cell};
        end
end
%% level 3:1
% 1:3
% within
A = 0;B = 0;C = 0;D = 0;BC = 0;BD = 0;CD = 0;BCD = 0;
% Across
AB = 0;AC = 0;AD = 0;ABC = 0;ABD = 0;ACD = 0;ABCD = 0;
for i = 3:18
    for j = 1:16
        for k = 1:15
    data1 = first_order_purview_eff70{1,i};
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
end
fo_purview_array_eff13 = [A B C D BC BD CD BCD AB AC AD ABC ABD ACD ABCD];

% 3:1
% within
A2 = 0;B2 = 0;C2 = 0;D2 = 0;BC2 = 0;BD2 = 0;CD2 = 0;BCD2 = 0;
% Across
AB2 = 0;AC2 = 0;AD2 = 0;ABC2 = 0;ABD2 = 0;ACD2 = 0;ABCD2 = 0;
for i = 19:34
    for j = 1:16
        for k = 1:15
    data3 = first_order_purview_eff70{1,i};
    data4 = data1{j,k};
    if length(data4) == 1
      if data4 == 0
        A2 = A2+1;
      elseif data4 == 1
        B2 = B2+1;
      elseif data4 == 2
        C2 = C2+1;
      elseif data4 == 3
        D2 = D2+1;
      end
    elseif length(data4) == 2
       if data4(1) == 0 && data4(2) == 1
        AB2 = AB2+1;
       elseif data4(1) == 0 && data4(2) == 2
        AC2 = AC2+1;
       elseif data4(1) == 0 && data4(2) == 3
        AD2 = AD2+1;
       elseif data4(1) == 1 && data4(2) == 2
        BC2 = BC2+1;
       elseif data4(1) == 1 && data4(2) == 3
        BD2 = BD2+1;
       elseif data4(1) == 2 && data4(2) == 3
        CD2 = CD2+1;
       end
    elseif length(data4) == 3
       if data4(1) == 0 && data4(2) == 1 && data4(3) == 2
        ABC2 = ABC2+1;
       elseif data4(1) == 0 && data4(2) == 1 && data4(3) == 3
        ABD2 = ABD2+1;
        elseif data4(1) == 0 && data4(2) == 2 && data4(3) == 3
        ACD2 = ACD2+1;
       elseif data4(1) == 1 && data4(2) == 2 && data4(3) == 3
        BCD2 = BCD2+1;
       end
     elseif length(data4) == 4
        ABCD2 = ABCD2+1;
    end
        end
    end
end
fo_purview_array_eff31 = [A2 B2 C2 D2 AB2 BC2 AC2 ABC2 AD2 BD2 CD2 ABD2 ACD2 BCD2 ABCD2];
bar([sum(fo_purview_array_eff13(1:8))+sum(fo_purview_array_eff31(1:8)),...
     sum(fo_purview_array_eff13(9:15))+sum(fo_purview_array_eff31(9:15))]/(15*16*32));
set(gca,'xticklabel',{'Purview within subjects','Purview across subjects'});
ylabel('Frequency (Total counts 7680)');title('3:1')
%% level 2:2
% within
A = 0;B = 0;C = 0;D = 0;AB = 0;CD = 0;
% Across
ABC = 0;ACD = 0;ABD = 0;BCD = 0;AC = 0;AD = 0;BD = 0;BC = 0;ABCD = 0;
for i = 35:70
    for j = 1:16
        for k = 1:15
    data1 = first_order_purview_eff70{1,i};
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
end
fo_purview_array_eff22 = [A B C D AB CD ABC BCD ABD ACD AC AD BC BD ABCD];
bar([sum(fo_purview_array_eff22(1:6)),sum(fo_purview_array_eff22(7:15))]/(15*36*16))
set(gca,'xticklabel',{'Purview within subjects','Purview across subjects'});
ylabel('Frequency (Total counts 8640)');title('2:2')
%% minimum(phi_cau,phi_eff) MIP
for i = 1:70 %70 conbinations
    for j = 1:16 % 16 states
        for k = 1:15 % 15 concepts
        field1 = OC_json(i,j).ces;
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
              cause_field2 = cause_field1.partition;
              part0 = cause_field2.part0; % left
              part1 = cause_field2.part1; % right
              left_nom = part0.mechanism;
              left_den = part0.purview;
              right_nom = part1.mechanism;
              right_den = part1.purview;
              mip = {left_nom,right_nom;right_nom,right_den};
              mipcell(j,k) = {mip};
        elseif phi == effect_phi
              cau_or_eff(j,k) = 2;
              effect_field2 = effect_field1.partition;
              part0 = effect_field2.part0; % left
              part1 = effect_field2.part1; % right
              left_nom = part0.mechanism;
              left_den = part0.purview;
              right_nom = part1.mechanism;
              right_den = part1.purview;
              mip = {left_nom,right_nom;right_nom,right_den};
              mipcell(j,k) = {mip};
        end
              cau_or_eff70(1,i) = {cau_or_eff};
              mip70(1,i) = {mipcell};
        end
    end
end