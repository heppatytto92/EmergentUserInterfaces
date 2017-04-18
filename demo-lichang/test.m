[y,fs,nbits]= wavread('2.wav'); 
%sound(y,fs,nbits);   % ��������
% y������Ƶ�źţ� 
% fs�ǲ���Ƶ�ʣ�����˵16000����ÿ��16000�Σ� 
% nbit�ǲ������ȣ�����˵16����ָ16λ���ȵĲ�����

p=audioplayer(y,fs);
play(p);


%%
[y, fs]=wavread('3.wav');
sound(y, fs);  % ���Ŵ���Ӎ
time=(1:length(y))/fs;  % �r�g�S������
plot(time, y);  % �����r�g�S�ϵĲ���
%%
fileName='c.wav';
[y, fs, nbits]=wavread(fileName);
fprintf('��Ӎ�n�� "%s" ���YӍ��\n', fileName);
fprintf('��Ӎ�L�� = %g ��\n', length(y)/fs);
fprintf('ȡ���l�� = %g ȡ���c/��\n', fs);
fprintf('������ = %g λԪ/ȡ���c\n', nbits);
%%
fileName='c.wav';
[y, fs, nbits]=wavread(fileName);
y0=y*(2^nbits/2)+(2^nbits/2); % y0 ��ԭ�ȃ�������Ӎ�n���е�ֵ
difference=sum(abs(y0-round(y0)))

%%
fileName='flanger.wav';
[y, fs]=wavread(fileName); % �xȡ��Ӎ�n
sound(y, fs);  % ������Ӎ
left=y(:,1);   % ������Ӎ
right=y(:,2);  % ������Ӎ
subplot(2,1,1), plot((1:length(left))/fs, left);
subplot(2,1,2), plot((1:length(right))/fs, right);
%%
[y,fs]=wavread('c.wav', [4001 5000]);  % �xȡ��4001��5000�c
figure; plot(y)

%%
load handel.mat  % �d�냦��� handel.mat ����Ӎ
wavplay(y, Fs);  % ���Ŵ���Ӎ
%%
[y, fs]=wavread('c.wav');
wavplay(1*y, fs, 'sync');   % ����1���������Ӎ
wavplay(3*y, fs, 'sync');   % ����2���������Ӎ
wavplay(5*y, fs, 'sync');   % ����3���������Ӎ
%%
[y, fs]=wavread('c.wav');
wavplay(y, 1.0*fs, 'sync'); % ���� 1.0 ���ٶȵ���Ӎ
wavplay(y, 1.2*fs, 'sync'); % ���� 1.2 ���ٶȵ���Ӎ
wavplay(y, 1.5*fs, 'sync'); % ���� 1.5 ���ٶȵ���Ӎ
wavplay(y, 2.0*fs, 'sync'); % ���� 2.0 ���ٶȵ���Ӎ
%%
[y, fs]=wavread('c.wav');
wavplay(y, 1.0*fs, 'sync');  % ���� 1.0 ���ٶȵ���Ӎ
wavplay(y, 0.9*fs, 'sync');  % ���� 0.9 ���ٶȵ���Ӎ
wavplay(y, 0.8*fs, 'sync');  % ���� 0.8 ���ٶȵ���Ӎ
wavplay(y, 0.6*fs, 'sync');  % ���� 0.6 ���ٶȵ���Ӎ

