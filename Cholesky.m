%Problem: 1.4.16 
%Amie Demmel 1/16/14
%
%Checks a matrix for Positive Definiteness and Calculates R, 
%storing R over A

%Asks for input
A = input('Enter matrix A :  ')

%Determines n using the MATlab size function to get dimensions and then
%since any matrix that possibly would be positive definate has to be
%square, using just the first dimension as n
m = size(A);
n = m(1);

%Initialize R and flag
R = zeros(n);
flag = 0;

%Main for loop to cycle through the rows
for i = 1:n
    %Calculates the first row R(1,1) and R(1,j)
   if i == 1
        R(i,i) = (A(i,i))^(1/2);
        for j = 2:n
            R(i,j) = A(i,j)/R(i,i);
        end
   else
       %Calculates the other rows by first obtaining R(i,i) and then using
       %the pervious row and R(i,i) to obtain R(i,j) - cycling row by row
        R(i,i) = A(i,i);
        for k = 1:i-1
            R(i,i) = R(i,i) - R(k,i)*R(k,i);
        end
        %Check for positive definate, can not square root a negative and a
        %zero diagonal also disquailifies matrix
        if R(i,i) <= 0
            flag = 1;
        else   
            R(i,i) = (R(i,i))^(1/2);
            for j = i+1:n
                R(i,j) = A(i,j);
                for k = 1:i-1
                    R(i,j)= R(i,j) - R(k,i)*R(k,j);
                end
                R(i,j) = R(i,j)/R(i,i);
            end
        end
   end
end

%Returns results either that A is not positive definite or the Cholesky
%Factor stored over A; If A is not positive definite then it is not stored
%over

if flag
     'A is not postive definite'
     R
else
    A = R
end


%%%%%Explaination of Output%%%%%
%
%