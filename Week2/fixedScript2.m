%Task: Calcualte the cost of items in a grocery store

itemPrices = [2.5, 3.0, 4.5, 5.0]; %prices of 4 items was correct
itemQuantities = [2,1,3,0]; %added a 0 for the fourth item quantity

%Calculate the total cost for each item
totalCost = itemPrices .* itemQuantities%used element wise multiplication.*

%Display the overall cost (using sum to get the overall cost)
fprintf('the total cost of the grocery items is $ %.2f\n', sum(totalCost))
%it needs to be a backslash when using floats, also added a $ sign