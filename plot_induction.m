
% MOTOR_SELECT = 1; % Choose 1 for Induction
ONLY_SPEED = false;


modelName = 'Induction';
fileName = ['.\models\','Induction_Motor_V2015a','.slx'];

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
t = Isd(:,1);
plot(t, Iabc_G(:,2:3));
title('Stator Torque Current');
ylabel('[A]');

subplot(4,1,3);
t = Isd(:,1);
plot(t, Isd(:,2), t, Isd_ref(:,2));
title('Stator Field Current');
ylabel('[A]');

subplot(4,1,4);
t = Iabc_G2(:,1);
plot(t, Iabc_G2(:,[2,5]));
title('Stator Current');
ylabel('[A]');
xlabel('[sec]');
