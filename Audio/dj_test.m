frameLength = 256;
fileReader = dsp.AudioFileReader(...
    'Little_Glass_Men_-_01_-_Waiting_for_Gyrotron.mp3',...
    'SamplesPerFrame',frameLength);
deviceWriter = audioDeviceWriter(...
    'SampleRate',fileReader.SampleRate);

dRG = noiseGate(...     
    'SampleRate',fileReader.SampleRate,...  
    'Threshold',-25,...    
    'AttackTime',10e-3,...     
    'ReleaseTime',20e-3,...       
    'HoldTime',0);  

reverb = reverberator('PreDelay',1,'WetDryMix',0.5);
octFilt = octaveFilter(500,'1/2 octave','SampleRate',fileReader.SampleRate);

tic
while ~isDone(fileReader)
    signal = fileReader();
    
    % Add noise to signal
    noisySignal = signal + 0.0025*randn(frameLength,1);
    processedSignal = dRG(noisySignal);
    
    % Reverberation
    audioWithReverb = reverb(signal);
    
    % Octave filter
    audioOctFilt = octFilt(signal);
    
    % Play the audio. Change parameters accordingly.
    deviceWriter(audioWithReverb);
    
    % Play for x seconds
    if toc >= 7
        break
    end
end

release(fileReader);
release(deviceWriter);
release(dRG);                                               %<---
