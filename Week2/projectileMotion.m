gravity = 9.81; %defining gravity in m/s^2

initialVelocity = 50; %starting velocity in m^s

t=0:.1:10; %defining a time vector from 0 to 10 in intervals of .1 sec

y=initialVelocity.*t - (.5).*(gravity).*(t.^2);  %

plot(t,y)   %this plots the height vs. time graph
xlabel('time,s')
ylabel('height,m')
title('Projectile Motion Under Gravity')