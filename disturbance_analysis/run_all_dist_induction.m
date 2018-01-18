%% This scripts runs all the simulations for various controller settings.
clear;

%% Parameters that are constant throughout the set of sims
modelName = './models/Induction_Motor.slx';

DATA_DIR = './sim_data/';

T = 2; % Sim Time 

NominalTorque = 9.95;
Mech_Load_Time = [0 T/2];

%% Speed Target: 80% of Nominal Velocity.
Speed_Target = 1200; 
speed_Kp = 0.15;
speed_Ki = 0.0455;

Mech_Load = [0.10, 0.30]*NominalTorque;    % Percentage of Nominal Load 
simOut = sim(modelName, 'StopTime', num2str(T), 'SaveFormat', 'Dataset');
save([DATA_DIR,'DIST_Induction_',num2str(Speed_Target),'_',num2str(Mech_Load(2)/NominalTorque*100),'.mat']);

Mech_Load = [0.20, 0.80]*NominalTorque;    % Percentage of Nominal Load 
simOut = sim(modelName, 'StopTime', num2str(T), 'SaveFormat', 'Dataset');
save([DATA_DIR,'DIST_Induction_',num2str(Speed_Target),'_',num2str(Mech_Load(2)/NominalTorque*100),'.mat']);


%% Speed Target: 50% of Nominal Velocity.
Speed_Target = 750;
speed_Kp = 0.14;
speed_Ki = 0.101;

Mech_Load = [0.10, 0.30]*NominalTorque;    % Percentage of Nominal Load 
simOut = sim(modelName, 'StopTime', num2str(T), 'SaveFormat', 'Dataset');
save([DATA_DIR,'DIST_Induction_',num2str(Speed_Target),'_',num2str(Mech_Load(2)/NominalTorque*100),'.mat']);

Mech_Load = [0.20, 0.80]*NominalTorque;    % Percentage of Nominal Load 
simOut = sim(modelName, 'StopTime', num2str(T), 'SaveFormat', 'Dataset');
save([DATA_DIR,'DIST_Induction_',num2str(Speed_Target),'_',num2str(Mech_Load(2)/NominalTorque*100),'.mat']);


