clear all
close all
clc

Training_Path = 'C:\Program Files\MATLAB\MATLAB Production Server\R2015a\bin\MAJORc\TrainDatabase';  %Set your directory for training data file
Testing_Path = 'C:\Program Files\MATLAB\MATLAB Production Server\R2015a\bin\MAJOR\TestDatabase';    %Set your directory for testing data file

flag=1

while (1==1)
    choice=menu('Menu',...
                'Capture Image',...
                'Input Image From File',...
                'Exit');
    if (choice==1)
        try cd ('C:\Program Files\MATLAB\MATLAB Production Server\R2015a\bin\MAJORc');close all; end;
        capturenow;
    end
    if (choice==2)
        disp('Pick a Testing Photo')
        [filename, pathname] = uigetfile({'*.jpg'},'Pick a Testing Photo');
        TestImage = [pathname, filename];
        im = imread(TestImage);
        Training_Data = ReadFace(Training_Path);
        [m, A, Eigenfaces] = EigenfaceCore(Training_Data);
        OutputName = Recognition(TestImage, m, A, Eigenfaces);
        SelectedImage = strcat(Training_Path,'\',OutputName);
        SelectedImage = imread(SelectedImage);
        figure('name','Recognition Result')
        subplot(1,2,1);
        imshow(im)
        title('Test Image');
        subplot(1,2,2);
        imshow(SelectedImage);
        title('Recognition Result');
        disp('Done')
    end
    if (choice==3)
        clear all;
        clc;
        close all;
        return;
    end 
end

