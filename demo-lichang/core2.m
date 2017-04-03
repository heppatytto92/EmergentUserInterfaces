image = imread('test3.jpg');  
image = rgb2gray(image);  
thresh = graythresh(image);  
image = ~im2bw(image,thresh);%背景色和前景色互换  
imshow(image);  
[L,num] = bwlabel(image,8);%标记二值化图像中的连通部分  
plotx = zeros(1,1);%记录质心位置坐标的变量  
ploty = zeros(1,1);  
%%求质心  
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
  
%%质心坐标  
plotx(1) = fix(sumx / area);  
ploty(1) = fix(sumy / area);  
dis = dataset(plotx(1),ploty(1));%变量dis为质心位置坐标数据(行列)  
figure(2);  
imshow(image);  
  
hold on  
plot(ploty(1),plotx(1),'*');  