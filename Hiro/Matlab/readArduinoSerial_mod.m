% Copyright 2014 The MathWorks, Inc.

%% Create serial object for Arduino
s = serial('/dev/cu.usbmodem1421'); % change the COM Port number as needed
%% Connect the serial port to Arduino
%s.InputBufferSize = 1; % read only one byte every time
try
    fopen(s);
catch err
    fclose(instrfind);
    error('Make sure you select the correct COM Port where the Arduino is connected.');
end

while true
    %% Read buffer data
    out = fscanf(s);
    fprintf(out);
    pause(0.1)
    
end
fclose(s);

