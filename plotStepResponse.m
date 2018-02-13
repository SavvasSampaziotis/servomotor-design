function [ Ess, Overshoot, tr, ts ] = plotStepResponse( t, y, r )
%PLOTSTEPRESPONSE Summary of this function goes here
%   Detailed explanation goes here

y = y - mod(10*y,1)/10; %Accuracy of 0.1 is enough for our application

target = r(end);
e = abs(target-y);
Ess = e(end);
Overshoot = (max(abs(y))-abs(target))/target*100;

hold on;

%% Ref and Respose
plot(t, y, t, r);

%% Overshoot time-stamp
[y_overshoot,i_overshoot]=max(abs(y));
stem(t(i_overshoot),sign(y(i_overshoot))*y_overshoot,'r--');

%% Rise Time
e = abs((y-target)/target)*100;
y_90 = y(e<=10);
tr = nan;
if ~isempty(y_90)
    y_90 = y_90(1);
    t_90 = t(e<=10); t_90 = t_90(1);
    tr = t_90-0;
    stem([t_90],[y_90] ,'g--');
end


%% Settling Time
e_98 = e(e>=2); % We use the 2% Criterion
if isempty(e_98)
    return;
else
    e_98 = e_98(end);
    ts = t(e>=2); ts = ts(end);
    stem(ts, y(t==ts), 'm--');
end

%% Absolute Settling Time
PLOT_ABSOLUTE = false;
% Quantize absolute error to 1-point decimal e.g. 13.200
e = abs(target-y);
% e = e - mod(10*e,1)/10;
e_100 = e(e==0); % Error Signal Time Stamps where e==0
if ~isempty(e_100)
    ts_100 = t(e>0); ts_100 = ts_100(end);
    PLOT_ABSOLUTE = (ts_100 ~= t(end));
end

if PLOT_ABSOLUTE
    stem(ts_100, y(t==ts_100), 'y--');
    legend('Response','Target', ...
        ['Overshoot:',num2str(Overshoot,'%.2f'),'%'],...
        ['Rise Time = ',num2str(tr,'%.2f'), 'sec'],...
        ['Settling Time = ',num2str(ts,'%.2f'), 'sec'],...
        ['Abs Settle Time = ', num2str(ts_100,'%.2f'), 'sec'],...
        'location', 'best');
else
    legend('Response','Target', ...
        ['Overshoot:',num2str(Overshoot,'%.2f'),'%'],...
        ['Rise Time = ',num2str(tr,'%.2f'), 'sec'],...
        ['Settling Time = ',num2str(ts,'%.2f'), 'sec'],...
        'location', 'best');
end

end

