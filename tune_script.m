clear;

modelName = './models/Induction_Motor.slx';
DATA_DIR = './sim_data/';
Mech_Load_Time = [0];
Mech_Load = [6];

figure(1); clf; hold on; grid on;
% 0.35 0.9
speed_Kp = 0.140;
speed_Ki = 0.100;


%% Run sims
Speed_Target = 750; 
sim(modelName);
t = Speed_ref(:,1);
[Ess(1),overshoot(1),tr(1),ts(1)]=plotStepResponse(t, Speed_ref(:,2), Speed_ref(:,3));

% 
% Speed_Target = 750; 
% sim(modelName);
% t = Speed_ref(:,1);
% e = Speed_Target-Speed_ref(:,2);
% plot(t, Speed_ref(:,2), t, Speed_ref(:,3));
% Ess(2) = e(end);
% overshoot(2) = (max(Speed_ref(:,2))-Speed_Target)/Speed_Target*100;

title(['Induction Motor: Speed Response | K_p=',num2str(speed_Kp),' K_I=',num2str(speed_Ki) ]);
xlabel('[sec]'); ylabel('Error [rpm]');
% legend('1200','750', 'location','best');

disp(['Ess = ', num2str(Ess)]);
disp(['Ovs = ', num2str(overshoot), '%']);
disp(['Tr = ', num2str(tr), '%']);
disp(['Ts = ', num2str(ts), '%']);





