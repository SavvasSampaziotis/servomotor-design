%% Run various simulations for nominal load values.
clear;
modelName = 'Induction_Motor';
fileName = ['./models/',modelName,'.slx'];
DATA_DIR = './sim_data/';
Mech_Load_Time = 0;
Mech_Load = 6;

label = 'RAMP';
% label = STEP;

%% Speed = Target = 50%
targetPer = 50; % For Plotting Purposes only
ONLY_SPEED = true;

Speed_Target = 750; 
speed_Kp = 0.14;
speed_Ki = 0.100;
simOut = sim(fileName); %, 'SaveFormat', 'Structure');
save([DATA_DIR, 'Induction_',targetPer,'_Speed_', label,'.mat']);

%% Speed = Target = 80%
targetPer = 80; % For Plotting Purposes only
ONLY_SPEED = true;

Speed_Target = 1200;
speed_Kp = 0.15;
speed_Ki = 0.0455;
simOut = sim(fileName); %, 'SaveFormat', 'Structure');
save([DATA_DIR, 'Induction_80_Speed_Ramp.mat']);

%% TODO: Position Sim
% Angle_Target = 400; % For Plotting Purposes only
% ONLY_SPEED = false;
% 
% Speed_Target = 750; 
% speed_Kp = 0.14;
% speed_Ki = 0.101;
% simOut = sim(fileName); %, 'SaveFormat', 'Structure');
% save([DATA_DIR, 'Induction_50_Pos.mat']);

