% CS-E4200 Emergent UI sample code for matlab
% Created by Hiroki Sunagawa

% Create Arduino instance
a = arduino('/dev/cu.usbmodem1421', 'uno')

% Setup PIn Configuration

%PWM pins
%uint8([0x44,0x02,0xbb,0x01])   % distance measure command
%configurePin(a, 'D5', 'DigitalOutput')
%writeDigitalPin(a, 'D5' , 1)
%configurePin(a, 'D3', 'DigitalInput')


acc = i2cdev(a, '0x68')
write(acc, 0, 'uint16')
writeRegister(acc, 14, hex2dec('0x3B'), 'uint16');


% Function Definition



% Read Pressure Sensor Value
fprintf('Pressure sensor value = %f\n', readVoltage(a, 'A0'))

% Read Proximity Sensor Value

% Read Accelerometer Value


