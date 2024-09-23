Acceleration=9.81; %m/s^2
t=0;
h_initial = input("what is the initial height of the ball in meters?:");
y=h_initial
while y>0: length(t)
   
    %calculate the height at specific times
    fprintf('at time t=%.1f seconds, the height of the ball is %.2f meters\n',t,y);
    y=-Acceleration*.5*t^2+h_initial;
    t=t+.1;


   
end
    fprintf('at aproximatly t=%.1f, the ball reaches the ground',t)


