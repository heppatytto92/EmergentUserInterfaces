image = imread('test3.jpg');  
image = rgb2gray(image);  
thresh = graythresh(image);  
image = ~im2bw(image,thresh);%����ɫ��ǰ��ɫ����  
imshow(image);  
[L,num] = bwlabel(image,8);%��Ƕ�ֵ��ͼ���е���ͨ����  
plotx = zeros(1,1);%��¼����λ������ı���  
ploty = zeros(1,1);  
%%������  
sumx = 0;  
sumy = 0;  
area = 0;  
[height,width] = size(image);  
for i = 1 : height  
    for j = 1 : width  
        if L(i,j) == 1  
            sumx = sumx + i;  
            sumy = sumy + j;  
            area = area + 1;  
        end  
    end  
end  
  
%%��������  
plotx(1) = fix(sumx / area);  
ploty(1) = fix(sumy / area);  
dis = dataset(plotx(1),ploty(1));%����disΪ����λ����������(����)  
figure(2);  
imshow(image);  
  
hold on  
plot(ploty(1),plotx(1),'*');  