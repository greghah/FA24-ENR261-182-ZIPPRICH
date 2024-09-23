LOAD=input('enter the load in newtons:'); %in newtons
LENGTH=input('enter the length in meters:'); %in meters

STRESS=LOAD/LENGTH;
fprintf('The load on the beam is %.0f N, the length of the beam is %.0f meters, and the stress is %.1f N/m\n', LOAD, LENGTH, STRESS);
