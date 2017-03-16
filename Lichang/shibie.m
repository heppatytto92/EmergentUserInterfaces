i = imread('test2.jpg');
C=im2bw(i,0.52);
imshow(C);title('C')
y=~C;
imshow(y);title('y')
  D=bwlabel(y,4);
  imshow(D);title('D')
  a=max(max(D));
 [b,c]=size(y);
 d=zeros(1,a+1);
 for i=1:b;
     for j=1:c;
          d(D(i,j)+1)=d(D(i,j)+1)+1;
     end
 end

 
 f=zeros(1,a+1);
 for i=2:a+1;
     f(i)=d(i)>0.01*b*c;
 end
 f2=find(f==1);
 g=length(f2);
 f1=f2-1;
 figure(1)
result=zeros(g,1);
 for i=1:g 
     [r1,c1]=find(D==f1(i));
     BW1=bwselect(D,c1,r1,4);
     SE = ones(2,4);
     E1 = imdilate(BW1,SE);
     F1=bwarea(E1);
     G1=bwperim(E1,4);
     H1=bwarea(G1);
     e(i)=4*3.14*F1/H1^2;
    if( 0.8927<e(i) & e(i)<1.1073)    
          subplot(4,3,i)       
          imshow(~E1);
          title('circle')  
     elseif(0.7<e(i) && e(i)<0.8927 )
            subplot(4,3,i)   
            imshow(~E1);
             title('rectangle/square')    
     elseif(e(i)<0.7)    
           subplot(4,3,i)     
           imshow(~E1);
            title('triangle')  
    end
      result(i,1)=e(i);
 end