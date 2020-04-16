function [m, A, Eigenfaces] = EigenfaceCore(Training_Data)
m = mean(Training_Data,2);
Train_Number = size(Training_Data,2);
temp_m = [];  
for i = 1 : Train_Number
    temp_m = [temp_m m];
end
A = double(Training_Data) - temp_m;

L = A'*A;
[V D] = eig(L); 
Eig_vec = [];
for i = 1 : size(V,2) 
    if( D(i,i)>1000 ) %thresh
        Eig_vec = [Eig_vec V(:,i)];
    end
end

Eigenfaces = A * Eig_vec;