fname = 'OC_level13.json';
OC_level13 = jsondecode(fileread(fname));
fname = 'OC_level2.json';
OC_level2 = jsondecode(fileread(fname));
%save('','') 
OC_json(1:2,:) = OC_level13(1:2,:);
OC_json(3:34,:) = OC_level2;
OC_json(35:70,:) = OC_level13(3:38,:);
