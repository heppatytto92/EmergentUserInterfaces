clear;clc;close all

%%����ͼ��

I_gray=imread('test3.JPG');
level=graythresh(I_gray);  %%���ֵ������ֵ
[height,width]=size(I_gray);
bw=im2bw(I_gray,level);    %%��ֵ��ͼ��
figure(1),imshow(bw);      %%��ʾ��ֵ��ͼ��
[L,num]=bwlabel(bw,4);     %%��ע������ͼ���������ӵĲ���
plot_x=zeros(1,1);         %%���ڼ�¼����λ�õ�����
plot_y=zeros(1,1);

%%������
sum_x=0;sum_y=0;area=0;
[height,width]=size(bw);
for i=1:height
    for j=1:width
        if L(i,j)==1
            sum_x=sum_x+i;
            sum_y=sum_y+j;
            area=area+1;
        end
    end
end
%%��������
plot_x(1)=fix(sum_x/area);
plot_y(1)=fix(sum_y/area);
figure(2);imshow(bw);

%%������ĵ�
hold on
plot(plot_y(1) ,plot_x(1), '*')