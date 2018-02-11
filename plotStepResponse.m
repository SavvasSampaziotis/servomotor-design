function [ Ess, Overshoot, tr, ts ] = plotStepResponse( t, y, r )
%PLOTSTEPRESPONSE Summary of this function goes here
%   Detailed explanation goes here

% Speed_Target = 750; 
% sim(modelName);
% t = Speed_ref(:,1);

target = max(r);
e = target-y;
Ess = e(end);
Overshoot = (max(y)-target)/target*100;


hold on;

%% Ref and Respose
plot(t, y, t, r);

%% Overshoot time-stamp
[y_overshoot,i_overshoot]=max(y); 
stem(t(i_overshoot),y_overshoot,'r--'); 

%% Rise Time
y_90 = y(y>=target*0.9); y_90 = y_90(1);
t_90 = t(y>=target*0.9); t_90 = t_90(1);
% y_10 = y(y>=target*0.1); y_10 = y_10(1);
% t_10 = t(y>=target*0.1); t_10 = t_10(1);
tr = t_90-0;
stem([t_90],[y_90] ,'g--'); 



%% Settling Time
e = abs(e/target)*100;
e_98 = e(e>=2); % We use the 0.02 Criterion
if isempty(e_98)
    return;
else
    e_98 = e_98(end);
    ts = t(e>=2); ts = ts(end);
    stem(ts, y(t==ts), 'm--');
end

legend('Response','Target', ...
    ['Overshoot:',num2str(Overshoot,'%.2f'),'%'],...
    ['Rise Time = ',num2str(tr,'%.2f'), 'sec'],...
    ['Settling Time = ',num2str(ts,'%.2f'), 'sec'],...
    'location', 'best');

end

