clear;
ONLY_SPEED= true;
modelName = './models/Induction_Motor.slx';
DATA_DIR = './sim_data/';
Mech_Load_Time = [0];
Mech_Load = [6];

Slew_Rate = 3000;

% 0.35 0.9
speed_Kp = 0.380; % These are awesome for SR=3000
speed_Ki = 0.600;

% 1.4
pos_Kp = 2.5;

%% Run sims
Speed_Target = 750; 
sim(modelName);
t = Speed_ref(:,1);
figure(1); clf; hold on; grid on;
[Ess(1),overshoot(1),tr(1),ts(1)]=plotStepResponse(t, Speed_ref(:,2), Speed_ref(:,3));

targetPer = 50;
modelName = 'Induction_Motor';
plotSim
% title(['Induction Motor: Speed Response | K_p=',num2str(speed_Kp),' K_I=',num2str(speed_Ki) ]);
% xlabel('[sec]'); ylabel('Error [rpm]');
% % legend('1200','750', 'location','best');
% 
% disp(['Ess = ', num2str(Ess)]);
% disp(['Ovs = ', num2str(overshoot), '%']);
% disp(['Tr = ', num2str(tr), ' sec']);
% disp(['Ts = ', num2str(ts), ' sec']);
% 
% 



