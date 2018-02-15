
% simData = load('sim_data/DIST_Induction_750_80.mat');
% simData = load('sim_data/DIST_Induction_750_30.mat');
% simData = load('sim_data/DIST_Induction_1200_30.mat');

simData = load('sim_data/DIST_Induction1200_30.mat');

N = length(simData.simOut.get('Speed_ref'));
n = 1:N;
% n = (floor(N/7):N);

figure(1); clf; 

%% Plot Speed Signal Error
subplot(1,2,1); 

speed = simData.simOut.get('Speed_ref');
t = speed(:,1); 
error = simData.Speed_Target-speed(:,2);
% plot(t(n), error(n),'LineWidth',2);
plot(t(n), speed(n,2),'LineWidth',2);
legend('measured', 'Location' ,'best');
title('Speed Error Response'); 
xlabel('t [sec]'); ylabel('e(t) = n* - n')
grid on;

%% Plot Torque Signals
subplot(1,2,2); hold on;
torque = simData.simOut.get('Torque'); 
t = torque(:,1);
plot(t(n), torque(n,2));
plot(t(n), torque(n,3), 'LineWidth',2);
plot([t(n(1)), simData.Mech_Load_Time([2,2]), simData.T], simData.Mech_Load([1,1,2,2]),'LineWidth',2);
title('Torque Response');
xlabel('t [sec]'); ylabel('[Nm]')
legend('Actual Torque', 'Ref Torque', ...
    [num2str(simData.Mech_Load/simData.NominalTorque*100),'% Disturbace'], 'Location' ,'best');
grid on;
%%
suptitle(['Induction Motor | ',...
    num2str(simData.Mech_Load(1)/simData.NominalTorque*100),'-',...
    num2str(simData.Mech_Load(2)/simData.NominalTorque*100),'% Disturbance']); 
% : Speed Target = ',num2str(simData.Speed_Target),'rpm']);

