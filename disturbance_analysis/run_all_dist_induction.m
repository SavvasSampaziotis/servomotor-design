%% This scripts runs all the simulations for various controller settings.
% clear;

%% Parameters that are constant throughout the set of sims
DATA_DIR = './sim_data/';

% modelName = './models/Induction_Motor.slx';
% fileName = [DATA_DIR,'DIST_','Induction'];

modelName = './models/PM_Motor_Ver2015.slx';
fileName = [DATA_DIR,'DIST_','PM_Motor'];



Pos_Target = 200;
pos_Kp = 0; % Not used
Slew_Rate = 600000;
T = 2; % Sim Time 

NominalTorque = 9.95;
Mech_Load_Time = [0 T/2];

%% Speed Target: 80% of Nominal Velocity.
% Speed_Target = 1200; speed_Kp = 0.15; speed_Ki = 0.0455;
Speed_Target = 1400; speed_Kp = 0.0738; speed_Ki = 0.106;

Mech_Load = [0.10, 0.30]*NominalTorque;    % Percentage of Nominal Load 
simOut = sim(modelName, 'StopTime', num2str(T), 'SaveFormat', 'Dataset');
save([fileName,num2str(Speed_Target),'_',num2str(Mech_Load(2)/NominalTorque*100),'.mat']);

Mech_Load = [0.20, 0.80]*NominalTorque;    % Percentage of Nominal Load 
simOut = sim(modelName, 'StopTime', num2str(T), 'SaveFormat', 'Dataset');
save([fileName,num2str(Speed_Target),'_',num2str(Mech_Load(2)/NominalTorque*100),'.mat']);


%% Speed Target: 50% of Nominal Velocity.
% Speed_Target = 750; speed_Kp = 0.14; speed_Ki = 0.101;
Speed_Target = 2240; speed_Kp = 0.075; speed_Ki = 0.048;

Mech_Load = [0.10, 0.30]*NominalTorque;    % Percentage of Nominal Load 
simOut = sim(modelName, 'StopTime', num2str(T), 'SaveFormat', 'Dataset');
save([fileName,num2str(Speed_Target),'_',num2str(Mech_Load(2)/NominalTorque*100),'.mat']);

Mech_Load = [0.20, 0.80]*NominalTorque;    % Percentage of Nominal Load 
simOut = sim(modelName, 'StopTime', num2str(T), 'SaveFormat', 'Dataset');
save([fileName,num2str(Speed_Target),'_',num2str(Mech_Load(2)/NominalTorque*100),'.mat']);


