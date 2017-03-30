clear all; clc;
delete(instrfindall)
instrreset;
b = Bluetooth(' MUSIC_DJ',1);
fopen(b);
figure
h = animatedline;
ax = gca;
ax.YGrid = 'on';
stop = false;
startTime = datetime('now');
while ~stop
    a = str2num(fscanf(b));
    % Get current time
    t =  datetime('now');
    % Add points to animation
    addpoints(h,datenum(t),a)
    % Update axes
    ax.XLim = datenum([t-seconds(15) t]);
    datetick('x','keeplimits')
    drawnow
end
fclose(b);