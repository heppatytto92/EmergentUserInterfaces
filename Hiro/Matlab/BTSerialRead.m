clear all; clc;
delete(instrfindall)
instrreset;
b = Bluetooth(' MUSIC_DJ',1);

try
    fopen(b);
catch err
    fclose(instrfind);
    error('Make sure if Bluetooth connection is established.');
end

while true
    %% Read buffer data
    out = fscanf(b);
    fprintf(out);
    pause(0.1)
end

fclose(b);
