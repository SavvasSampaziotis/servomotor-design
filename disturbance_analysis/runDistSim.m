
clear;

modelName = 'Induction_Motor.slx';

Speed_Target = 1200; % Percentage of Nominal Velocity that is the target of the system.

if(Speed_Target == 1200)
    speed_Kp = 0.15
    speed_Ki = 0.0455
elseif (Speed_Target == 750)
    speed_Kp = 0.14;
    speed_Ki = 0.101;
end

Mech_Load = 0.30;    % Percentage of Nominal Load exerted on Motor.    
simOut80 = sim(modelName, 'SaveFormat', 'Dataset');

Mech_Load = 0.20;    % Percentage of Nominal Load exerted on Motor.    
simOut50 = sim(modelName, 'SaveFormat', 'Dataset');

Mech_Load = 0.0;    % Percentage of Nominal Load exerted on Motor.    
simOut00 = sim(modelName, 'SaveFormat', 'Dataset');


save('data/InductionDistSimData.mat');