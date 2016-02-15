function img_number()
    clear all;
    close all;
    echo off;
    I = imread('../img/2016011912.bmp');
    I=I(612:625,900:946,:);
    I_int = rgb2gray(I);
    
    I_int=~im2bw(I_int,0.5);   %binary and reverse
    I_x_pro = sum(I_int,1);    % project to the x axis
    imshow(I_int)
	num_x_start=strfind(I_x_pro~=0,[0 1])+1; %find the start point of a specific figure
	num_x_end=strfind(I_x_pro==0,[0 1]); %find the end point of a specific figure
	
	I_y_pro = sum(I_int,2);   % project to the y axis
    num_y_start=strfind(I_y_pro'~=0,[0 1])+1; %find the start point of a specific figure
	num_y_end=strfind(I_y_pro'==0,[0 1]); %find the end point of a specific figure
	
	fig_num = size(num_x_start);   % how many figures in the image
	fig_stdwidth = 6;
	fig_stdheight = num_y_end-num_y_start+1;
	for ii=1:fig_num(2)
        I_std_ele_fig = imresize(I_int(num_y_start:num_y_end,num_x_start(ii):num_x_end(ii)), [fig_stdheight fig_stdwidth]);
		std_x_pro = sum(I_std_ele_fig,1)
		std_y_pro = sum(I_std_ele_fig,2)'
    end
	