% Student: Gregory Zipprich
% Assisted by: Nobody

clear
clc

fileID = fopen('gear_data.csv','r');

% Check if the file was opened successfully
if fileID == -1
    error('File could not be opened. Check if the file exists and the name is correct.');
end

%specifying the format to read 2 integer(%d) collmns
formatSpec = '%d %d';

%use textscan and tell it how to read the data

dataArray = textscan(fileID, formatSpec, 'Delimiter', ',', 'HeaderLines',1, 'MultipleDelimsAsOne', true, 'EndOfLine', '\r\n');


fclose(fileID);

% Print dataArray for debugging
disp('Data Array Content:');
disp(dataArray);

driverTeeth = dataArray{1};
drivenTeeth = dataArray{2};

%display for verification
%disp('Driver Teeth:');
%disp(driverTeeth);
%disp('Driven Teeth:');
%disp(drivenTeeth);

% Ensure both arrays have been read properly
if isempty(driverTeeth) || isempty(drivenTeeth)
    error('Error: One of the arrays is empty. Check the CSV file format.');
end

gearRatios = zeros(length(driverTeeth), 1);  % Preallocate the array


for i=1:length(driverTeeth) 
    gearRatios(i) = gearRatioCalc(driverTeeth(i), drivenTeeth(i));
end
    % Display the results

% Display the results
disp('Gear Ratios:');
disp(gearRatios);

% Prepare data for writing to CSV
outputData = [driverTeeth, drivenTeeth, gearRatios];  % Combine into a matrix
outputCell = num2cell(outputData);  % Convert to cell array

outputCell = [{'Driver Teeth', 'Driven Teeth', 'Gear Ratios'}; outputCell];


writecell(outputCell, 'gear_data.csv')