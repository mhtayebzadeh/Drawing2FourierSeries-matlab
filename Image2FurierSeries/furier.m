clc;clear all; close all;

% % % % % % % % % % % % % % % % % % 
% Initialize....                  %
% % % % % % % % % % % % % % % % % % 
I = imread('pic.jpg');      % input image
n_max=10;        
y_min=-1;   % y axis min 
y_max=1;    % y axis max
% by default x_min = -1 and x_max = 1;

% % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % 

    I2 = rgb2gray(I);
    J = imadjust(I2);
    BW = imbinarize(J,'adaptive','ForegroundPolarity','dark','Sensitivity',0.1);
    BW = bwareaopen(~BW,30);
    se = strel('disk',10);
    BW = imclose(BW,se);
    BW = bwareaopen(~BW,50);
    E = edge(BW);
    img=E;
    s=regionprops(img,'BoundingBox');
    img = imcrop(img,(s.BoundingBox));
    imshow(img);
    [h w]=size(img);
    w=w-1;
    h=h-1;
    x=1:w;
    y=zeros(1,w);

for i=1:w
    n=0;sum=0
   for j=1:h
       if img(j,i)==1
           sum=sum+(h-j);
           n=n+1;
       end
   end
   if n==0
        y(1,i)=0;
   else
       y(1,i)=(sum/n);
   end
end

% % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % 
% save('var.mat','x','y','w')
% clear all;
% clc;
% load('var.mat')
x=x*((2)/w)-1;
y=(abs(y_max-y_min)/h)*y+y_min;
% % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % 
    [m n]=size(x);
    b=zeros(2*n_max+1,1);
    z=[ones(n,1)];
    for i=1:n_max
        z=[z sin(i*pi*x')];
    end
    for i=1:n_max
        z=[z cos(i*pi*x')];
    end
    b=(z'*z)\(z'*y');
    y2=(z*b)';
    
% % % % % % % % % % % % % % % % % % 

figure;
hold on;
plot(x,y,'.')
plot(x,y2)
format long
clc;
disp('furier series coefficients :');
disp('a_0=')
disp(b(1));
disp('coefficients of sin(ix)')
disp(b(2:n_max+1)');
disp('coefficients of cos(ix)')
disp(b(n_max+2:2*n_max+1)');

