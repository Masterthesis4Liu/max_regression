function[max_ID, max_value] = read_max_angle(csv_file_name)

fid = fopen(csv_file_name,'r');
data = textscan(fid,'%q%q%q%q','Delimiter',',');
spring_number_cell = data{1,1};
angle_cell = data{1,4};
spring_number_cell(1) =[];%
angle_cell(1) = [];%delete the head of the column
fclose(fid);

angle_value = zeros(size(angle_cell,1),1);
angle_value = str2double(angle_cell);
%angle_value1 = cellfun(@(x)str2double(x),angle_cell);
spring_value = zeros(size(spring_number_cell,1),1);
spring_value = str2double(spring_number_cell);

%get the maximum of the shear angle
[max_value,index] = max(abs(angle_value));
max_value = angle_value(index);
max_ID = spring_value(index);

end




