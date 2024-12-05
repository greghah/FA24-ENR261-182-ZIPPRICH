
% This is my temperature PID control function. This has everything the 2
%PID example functions has but also inclueds disturbance which represents
%the temperature loss or gain due to external factors that my PID has
%to help against
function[time,temperature,error] = simulateTemparaturePIDControl(kP,kI,kD,setpoint,initialTemp,disturbance)
    %Time variables
    dt=0.1;
    time = 0:dt:100; %Time vector from 0 to 100 in steps of .1[1x1000 row]
    
    %Create a temperature array and error array
    temperature = zeros(size(time));
    error = zeros(size(time));
    
    %Create and store initial data
    temperature(1) = initialTemp;
    integral=0;
    lastError = setpoint - initialTemp;
    
    for i=2:length(time)
        %define the PID varables
        error(i) = setpoint - temperature(i-1);
        P = kP * error(i);
        integral = integral + error(i) *dt;
        I = kI * integral;
        derivative = (error(i)-lastError)/dt;
        D = kD * derivative;
        %use PID variables to determine temperature adjustments
        heatingPower = P + I + D;
        temperature(i) = temperature(i-1) + heatingPower * dt + disturbance * dt;
        %update previous error to the current error before restarting the loop
        %and increading the i value
        lastError = error(i);
    end
end


