[y,fs,nbits]= wavread('2.wav'); 
%sound(y,fs,nbits);   % 播放声音
% y就是音频信号； 
% fs是采样频率，比如说16000就是每秒16000次； 
% nbit是采样精度，比如说16就是指16位精度的采样。

p=audioplayer(y,fs);
play(p);


%%
[y, fs]=wavread('3.wav');
sound(y, fs);  % 播放此音訊
time=(1:length(y))/fs;  % 時間軸的向量
plot(time, y);  % 畫出時間軸上的波形
%%
fileName='c.wav';
[y, fs, nbits]=wavread(fileName);
fprintf('音訊檔案 "%s" 的資訊：\n', fileName);
fprintf('音訊長度 = %g 秒\n', length(y)/fs);
fprintf('取樣頻率 = %g 取樣點/秒\n', fs);
fprintf('解析度 = %g 位元/取樣點\n', nbits);
%%
fileName='c.wav';
[y, fs, nbits]=wavread(fileName);
y0=y*(2^nbits/2)+(2^nbits/2); % y0 是原先儲存在音訊檔案中的值
difference=sum(abs(y0-round(y0)))

%%
fileName='flanger.wav';
[y, fs]=wavread(fileName); % 讀取音訊檔
sound(y, fs);  % 播放音訊
left=y(:,1);   % 左聲道音訊
right=y(:,2);  % 右聲道音訊
subplot(2,1,1), plot((1:length(left))/fs, left);
subplot(2,1,2), plot((1:length(right))/fs, right);
%%
[y,fs]=wavread('c.wav', [4001 5000]);  % 讀取第4001至5000點
figure; plot(y)

%%
load handel.mat  % 載入儲存於 handel.mat 的音訊
wavplay(y, Fs);  % 播放此音訊
%%
[y, fs]=wavread('c.wav');
wavplay(1*y, fs, 'sync');   % 播放1倍震幅的音訊
wavplay(3*y, fs, 'sync');   % 播放2倍震幅的音訊
wavplay(5*y, fs, 'sync');   % 播放3倍震幅的音訊
%%
[y, fs]=wavread('c.wav');
wavplay(y, 1.0*fs, 'sync'); % 播放 1.0 倍速度的音訊
wavplay(y, 1.2*fs, 'sync'); % 播放 1.2 倍速度的音訊
wavplay(y, 1.5*fs, 'sync'); % 播放 1.5 倍速度的音訊
wavplay(y, 2.0*fs, 'sync'); % 播放 2.0 倍速度的音訊
%%
[y, fs]=wavread('c.wav');
wavplay(y, 1.0*fs, 'sync');  % 播放 1.0 倍速度的音訊
wavplay(y, 0.9*fs, 'sync');  % 播放 0.9 倍速度的音訊
wavplay(y, 0.8*fs, 'sync');  % 播放 0.8 倍速度的音訊
wavplay(y, 0.6*fs, 'sync');  % 播放 0.6 倍速度的音訊

