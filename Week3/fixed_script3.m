%Student: Gregory Zipprich
%Assisted by: Nobody

% Check if a number is positive, negative, or zero

num = input('Enter a number: ');

if num > 0                          %added new lines and indents
    disp('The number is positive.');
elseif num < 0
    disp('The number is negative.');
else
    disp('The number is zero.');
end
% Calculate the sum of even numbers between 1 and 100 using a while loop 
% and incrementing i by 2 for each loop iteration.

sum_even = 0;
i = 2;

while i <= 100
    sum_even = sum_even + i; 
    i = i + 2;  %missing increment for i
end
fprintf('The sum of even numbers between 1 and 100 is: %d\n', sum_even);