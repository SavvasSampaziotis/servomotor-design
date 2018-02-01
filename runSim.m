%% Run various simulations for nominal load values.
modelName = './models/Induction_Motor.slx';
DATA_DIR = './sim_data/';
Mech_Load_Time = 0;
Mech_Load = 6;

%% Speed = Target = 50%
Speed_Target = 750; 
speed_Kp = 0.14;
speed_Ki = 0.101;
simOut = sim(modelName, 'SaveFormat', 'Dataset');
save([DATA_DIR, 'Induction_50.mat']);

%% Speed = Target = 80%
Speed_Target = 1200;
speed_Kp = 0.15;
speed_Ki = 0.0455;
simOut = sim(modelName, 'SaveFormat', 'Dataset');
save([DATA_DIR, 'Induction_80.mat']);
