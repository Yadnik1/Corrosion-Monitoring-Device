clear;
close all;
clc;

desired_dia_range = [17,20];
desired_liftoff_range = [5,5];
max_datapoint = 500;
y_intercept_point = 0.8;
slope_point_1 = 100;
slope_point_2 = 105;

% Read f
% ile
opts = detectImportOptions("chamfered.xlsx");
opts.Sheet = 'Sheet1';
matrix = readmatrix("chamfered.xlsx",opts);

mydata_matrix(:,1:3) = matrix(:,1:3);
mydata_matrix(:,4:1474) = log(matrix(:,4:1474));

%plot values
figure;
for row=1:length(mydata_matrix(:,1))
    if and(mydata_matrix(row,3)>=desired_dia_range(1),mydata_matrix(row,3)<=desired_dia_range(end))
        if and(mydata_matrix(row,1)>=desired_liftoff_range(1),mydata_matrix(row,1)<=desired_liftoff_range(end))
            plot(mydata_matrix(row,5:max_datapoint+4));
            hold on;
        end
    end
end

hold off;

% calculated_matrix = [[0,0],[0,0]];
% %calculating intercept and slope
% for row = 1:length(mydata_matrix(:,1))
%     calculated_matrix(row,1:4) = mydata_matrix(row,1:4);
%     calculated_matrix(row,5) = findIndex(mydata_matrix(row,5:max_datapoint+4),y_intercept_point);
%     calculated_matrix(row,6) = log(mydata_matrix(row,slope_point_1));
%     calculated_matrix(row,7) = log(mydata_matrix(row,slope_point_2));
%     calculated_matrix(row,8) = (log(mydata_matrix(row,slope_point_2))-log(mydata_matrix(row,slope_point_1)))/(slope_point_2-slope_point_1)*1000;
% 
% end

% x = 100:120;
% x2 = 0:200;
% [p,S] = polyfit(x,mydata_matrix(32,x+4),1);
% [y_fit,delta] = polyval(p,x2,S);
% 
% figure;
% plot(1:500,mydata_matrix(32,5:504),'b',x2,y_fit,'r');

% value_1 = gradient(mydata_matrix(32,5:504))*1000; %smooth(,,15)
% value_1_index = findIndex(value_1,-2);
% x = value_1_index-10 : value_1_index+10;
% x2 = 0:200;
% [p,S] = polyfit(x,mydata_matrix(32,x+4),1);
% [y_fit,delta] = polyval(p,x2,S);
% figure;
% plot(1:500,mydata_matrix(32,5:504),'b',x2,y_fit,'r');
% %plot(1:500,mydata_matrix(32,5:504),'b',value_1_index,mydata_matrix(32,value_1_index+4),'r+');


function index = findIndex(array,value)
    new_array = abs(array-value);
    new_value = min(new_array);
    index = find(new_array == new_value,1);
end