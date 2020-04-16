function [] = func(Training_Path,TestImage)
Training_Data = ReadFace(Training_Path);
[m, A, Eigenfaces] = EigenfaceCore(Training_Data);
OutputName = Recognition(TestImage, m, A, Eigenfaces);

SelectedImage = strcat(Training_Path,'\',OutputName);
SelectedImage = imread(SelectedImage);

Visualize_Eigenface(Eigenfaces,128,128);

figure('name','Recognition Result')
subplot(1,2,1);
imshow(im)
title('Test Image');

subplot(1,2,2);
imshow(SelectedImage);
title('Recognition Result');
disp('Done')
end