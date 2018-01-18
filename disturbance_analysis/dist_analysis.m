
clear;

%% Induction 1200rpm 
load('InductionDistSimData.mat');


figure(1); clf; 

subplot(1,2,1); hold on;
speed = simOut80.get('Speed_ref'); plot(speed(:,1), speed(:,2));
speed = simOut50.get('Speed_ref'); plot(speed(:,1), speed(:,2));
speed = simOut00.get('Speed_ref'); plot(speed(:,1), speed(:,[2,3]));
legend('80% Load', '50% Load', '0% Load', 'Speed Ref', 'Location' ,'best');
title('Speed Response');

subplot(1,2,2); hold on;
torque = simOut80.get('Torque'); plot(torque(:,1), torque(:,2));
torque = simOut50.get('Torque'); plot(torque(:,1), torque(:,2));
torque = simOut00.get('Torque'); plot(torque(:,1), torque(:,[2,3]));
title('Torque Response');
legend('Actual Torque - 80% Load', 'Actual Torque - 50% Load', 'Actual Torque - 0% Load', 'Controller Estimated Torque', 'Location' ,'best');

suptitle('Induction Motor - Disturbance Sim: Speed Target = 1200rpm');