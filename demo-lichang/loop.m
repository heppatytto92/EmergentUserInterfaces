[y,fs,nbits]= wavread('2.wav'); 
%sound(y,fs,nbits);   % ��������
% y������Ƶ�źţ� 
% fs�ǲ���Ƶ�ʣ�����˵16000����ÿ��16000�Σ� 
% nbit�ǲ������ȣ�����˵16����ָ16λ���ȵĲ�����

for i=1:10
    if i<10
        sound(y,fs,nbits);
    end
end
    
%p=audioplayer(y,fs);
%play(p);
% it works