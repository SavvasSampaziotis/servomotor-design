
MOTOR_SELECT = 1; % Choose 1 for Induction
ONLY_SPEED = false;

if MOTOR_SELECT
    modelName = 'Induction';
    fileName = ['.\models\','Induction_Motor_V2015a','.slx'];
else
    modelName = 'PM_Motor';
    fileName = ['.\models\','PM_Motor_V2015a','.slx'];
end

 sim(fileName);

t = Angle(:,1);
if ONLY_SPEED
    figure(1); clf;
    plot(t, Speed_ref(:,2), t,Speed_ref(:,3));
    title([modelName,' Speed']);
    xlabel('[sec]'); ylabel('[rpm]');
    legend('measured','ref');
else
    figure(1); clf;
    subplot(1,2,1); plot(t, Angle(:,2), t,Angle(:,3));
    title([modelName,' Angle']); legend('measured','ref');
    xlabel('[sec]'); ylabel('[deg]');
   
    subplot(1,2,2); plot(t, Speed_ref(:,2), t,Speed_ref(:,3));
    title([modelName,' Speed']); legend('measured','ref');
    xlabel('[sec]'); ylabel('[rpm]');
end

figure(1); clf;
t = Torque(:,1);
subplot(4,1,1); plot(t, Torque(:,2), t, Torque(:,3));
title('Electromagnetic Torque'); legend('measured','ref');
ylabel('[Nm]');

subplot(4,1,2); 

subplot(4,1,3);

subplot(4,1,4); 
t = Iabc_G2(:,1);
plot(Iabc_G2(:,[2,5]));
title('Stator Current'); legend('measured','ref');
ylabel('[A]');
xlabel('[sec]');
