Force = [100,200,300,400,500]; %Force Vector In Newtons

crossSectionArea = 50; %Area in square milimeters

displacement = [.1, .2, .3, .4, .5]; %Displacement in milimeters

originalLength = 100; %length in milimeters

stress = Force/crossSectionArea;    %defining and displaying stress
stress

strain = displacement/originalLength;   %defining and displaying strain
strain
plot(strain,stress)   %Plotting the stress-strain curve
xlabel('Strain')    %Labeling the X axis
ylabel('Stress N/mm')   %Labeling the Y axis
title('Strain vs. Stress')   %Adding the title of the plot