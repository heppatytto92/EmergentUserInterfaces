[FileName, FilePath]=uigetfile('*.jpg;*.png;*.tif;*.img;*.gif;','请选择图像数据');
str=[FilePath FileName];
Image_f=imread(str);
figure(1),imshow(Image_f);title('original picture');

%RGB TO HSV
hsv_f = rgb2hsv(Image_f);
H = hsv_f(:,:,1)*255;
S = hsv_f(:,:,2)*255;
V = hsv_f(:,:,3)*255;

[y,x,z]=size(Image_f);
Red_y=zeros(y,1);
Pink_y=zeros(y,1);
Blue_y=zeros(y,1);
Orange_y=zeros(y,1);
Green_y=zeros(y,1);
Yellow_y=zeros(y,1);

 for i=1:y
    for j=1:x
             if((H(i,j) >= 245) && (H(i,j) <=255))  %(V(i,j)<255)      &&(V(i,j)>50)&&(S(i,j)>30)
                Red_y(i,1)= Red_y(i,1)+1;%红像素点统计
             elseif((H(i,j)>=220)&&(H(i,j)<245))  %(V(i,j)<255)   &&(V(i,j)>50)&&(S(i,j)>30)
                Pink_y(i,1)= Pink_y(i,1)+1;%绿像素点统计
             elseif((H(i,j)>=10)&&(H(i,j)<25))  %(V(i,j)<255)   &&(V(i,j)>50)&&(S(i,j)>30)
                Orange_y(i,1)= Orange_y(i,1)+1;
             elseif(((H(i,j)>=25)&&(H(i,j)<50)))  %(V(i,j)<255)    &&(V(i,j)>50)&&(S(i,j)>30)
                Yellow_y(i,1)= Yellow_y(i,1)+1;%
             elseif(((H(i,j)>=150)&&(H(i,j)<180)))  %(V(i,j)<255)    &&(V(i,j)>50)&&(S(i,j)>30)
                Blue_y(i,1)= Blue_y(i,1)+1;%
             elseif(((H(i,j)>=80)&&(H(i,j)<100)))  %(V(i,j)<255)    &&(V(i,j)>50)&&(S(i,j)>30)
                Green_y(i,1)= Green_y(i,1)+1;%
             end
     end      
 end
 
 Max_Red=max(Red_y)
Max_Orange=max(Orange_y)
Max_Pink=max(Pink_y)
 Max_Yellow=max(Yellow_y)
Max_Blue=max(Blue_y)
Max_Green=max(Green_y)
result=zeros(6,1);
if(Max_Red>80)
    result(1,1)=1;
end
if(Max_Orange>80)
    result(3,1)=1;
end
if(Max_Pink>80)
    result(2,1)=1;
end
if(Max_Yellow>80)
    result(4,1)=1;
end
if(Max_Blue>80)
    result(5,1)=1;
end
if(Max_Green>80)
    result(6,1)=1;
end