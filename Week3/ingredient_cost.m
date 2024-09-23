totalcost=0;
while true
    %ask for cost and quantity
    COST=input('Enter the cost of the ingredient:')
    Quantity=input('Enter the quantity required:')

    %calculate total cost
    itemcost=COST*Quantity; %calculates item cost
    totalcost=totalcost+itemcost; %calculates total cost

    %asks test subject if they want to keep shoping
    MORE = input('Would you like to keep shoping?(yes/no):','s')

    if strcmp(MORE,'no') %strcmp is a function chat gpt taught me that compares strings instead of using ==
        break
    end
end
disp(totalcost)