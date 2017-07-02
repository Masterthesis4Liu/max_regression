clear;
clc;
format long;

files_name_list =[];
files = dir( 'shear*.csv' );
%files_name = {files.name};
%files_name1 = strvcat( files.name );
% for i = 1:length(files)
%     name = files(i).name;
%     name_str = char(name);
% end
max_dict = containers.Map();
for j = 1:length(files)
    csv_name= strcat('shearAngle_Run',int2str(j),'.csv');
    fprintf('File opend: %s.\n',csv_name);
    [max_ID, max_value] = read_max_angle(csv_name);
    %max_dict(int2str(j))= max_value;
    files_name_list(end+1) = max_value;
    fprintf('File closed: %s. \n',csv_name);
end

dlmwrite('data.csv',files_name_list,'Precision',7)