function filteredMaterials = filterMaterials(filename,maxDensity,minTensileStrength,maxCost)
%read table from csv file
data = readtable(filename);

%sort thru the data using the users inputs and select the materials that
%are allowed
densityFilter = data.Density <= maxDensity;
costFilter = data.CostPerKg <= maxCost;
tensileStrengthFilter = data.TensileStrength >= minTensileStrength;


%make new data table filled with true and false values, make sure you use
%the same order as in the csv file so your tables are similar

filterCriteria = densityFilter&tensileStrengthFilter&costFilter;

%create filtered data table of what matches criteria

filteredMaterials = data(filterCriteria,:);