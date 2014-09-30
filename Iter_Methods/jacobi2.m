%jacobi2.m
%Amie Demmel
%
%This script implements the jacobi algorithm for a user defined matrix, 
%b vector and initial guess of solution


format long

A = input('enter the A matrix of the system : ');
b = input('enter the b vector of the system : ');
x = input('enter inital guess of x : ');

%Initialize variables
n = size(A);
m = n(2);
n = n(1);
tol_tester = 1;
tol = 10^-5;
step = 0;
overflow = 30;
flag = 0;

%Loops while tolerance isn't meet or max iterations
while (tol_tester > tol)&&(step < overflow)
    nx = b;	%set x to b
    for i=1:n
        for j=1:m
            if j ~= i
                nx(i)=nx(i)-A(i,j)*x(j); %subtract out other values of x
            end
        end
        if A(i,i) ~= 0   %check to make sure we are not dividing by zero
            nx(i) = nx(i)/A(i,i);  %divide by x(i) coefficent
        else
            flag = 1;
            error='Zero Diagonal Entry not allowed!'
            break
        end
    end
    
    if flag == 1 %end if trying to divide by zero
        break
    end

    %Set new x value, new test value for tolerance and increment the step
    x = nx;
    tol_tester = norm(b-A*x,2);
    step = step+1;
    
     if mod(step,10)==0  %print only every 10 steps
        step 
        soln = x
        norm(b-A*x,2)
     end
end

if mod(step,10) ~=0 %print last step if it has not already been printed
 step 
 soln = x
 norm(b-A*x,2)
end