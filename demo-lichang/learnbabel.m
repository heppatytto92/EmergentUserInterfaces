image = imread('test.jpg'); %%original picture 
i_gray = rgb2gray(image);  %gray_picture
thresh = graythresh(i_gray);  
i_change = ~im2bw(i_gray,thresh);%0-->1 1-->0
%keypoint
imshow(i_change);  
[L,num] = bwlabel(i_change,4);%标记二值化图像中的连通部分  
%[L,num] = bwlabel(i_change,8);%标记二值化图像中的连通部分  

maxValue=num;
sum_x=0;sum_y=0;area=0;


[height,width]=size(i_change);
result=zeros(maxValue,2); 
x_data=zeros(maxValue,1); 
y_data=zeros(maxValue,1); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hsv_f = rgb2hsv(image);
H = hsv_f(:,:,1)*255;
%S = hsv_f(:,:,2)*255;
%V = hsv_f(:,:,3)*255;

Red_y=zeros(height,1);
Blue_y=zeros(height,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



for q=1:num
    for i=1:height
        for j=1:width
            if L(i,j)==q
                sum_x=sum_x+i;
                sum_y=sum_y+j;
                area=area+1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                if((H(i,j) >= 240) && (H(i,j) <=255) || (H(i,j) >= 0) && (H(i,j) <=20))  %(V(i,j)<255)      &&(V(i,j)>50)&&(S(i,j)>30)
                    Red_y(i,1)= Red_y(i,1)+1;
                elseif(((H(i,j)>=150)&&(H(i,j)<=170)))  %(V(i,j)<255)    &&(V(i,j)>50)&&(S(i,j)>30)
                    Blue_y(i,1)= Blue_y(i,1)+1;
                end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            end
          
        end
      
    end
    x_data(q,1)=fix(sum_x/area);
    y_data(q,1)=fix(sum_y/area);
    if(fix(sum_y/area) < width/2)
       if(fix(sum_x/area)< height/3)
           result(q,1)=1;
       elseif(fix(sum_x/area)> ((height*2)/3))
           result(q,1)=3;
       else
           result(q,1)=2;
       end
    else
       if(fix(sum_x/area)< height/3)
           result(q,1)=4;
       elseif(fix(sum_x/area)> ((height*2)/3))
           result(q,1)=6;
       else
           result(q,1)=5;
       end
    end
    
    if(max(Red_y)>80)
       result(q,2)=1;
    end    
    if(max(Blue_y)>80)
       result(q,2)=2;
    end

    sum_x=0;sum_y=0;area=0;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

location=result(:,1);
color=result(:,1);
switch(max(location))
    case 1
        [y, fs]=wavread('1.wav');
    case 2
        [y, fs]=wavread('2.wav');
    case 3
        [y, fs]=wavread('3.wav');
    case 4
        [y, fs]=wavread('4.wav');
    case 5
        [y, fs]=wavread('5.wav');
    case 6
        [y, fs]=wavread('6.wav');
    otherwise
        [y, fs]=wavread('7.wav');
end
%wavplay(y, fs+fs*max(color)/10, 'sync'); 
for k=1:10
    wavplay(y, fs+fs*max(color)/10);    
end


