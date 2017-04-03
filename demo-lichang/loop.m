[y,fs,nbits]= wavread('2.wav'); 
%sound(y,fs,nbits);   % 播放声音
% y就是音频信号； 
% fs是采样频率，比如说16000就是每秒16000次； 
% nbit是采样精度，比如说16就是指16位精度的采样。

for i=1:10
    if i<10
        sound(y,fs,nbits);
    end
end
    
%p=audioplayer(y,fs);
%play(p);
% it works