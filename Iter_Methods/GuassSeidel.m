%gauss-seidel.m
%Amie Demmel
%
%Modified Jacobi to be Gauss-Seidel to solve user defined matrix,vector and %inital guess

format long

A = input('enter the A matrix of the system : ');
b = input('enter the b vector of the system : ');
x = input('enter inital guess of x : ');

%Initalize
n = size(A);
m = n(2);
n = n(1);
tol_tester = 1;
tol = 10^-5;
step = 0;
overflow = 30;
flag = 0;

%Loop while tolerance is not meet or max iteration not met
while (tol_tester > tol)&&(step < overflow)
    nx = b;
    for i=1:n
        for j=1:m
            if j ~= i
                nx(i)=nx(i)-A(i,j)*x(j); %Subtract out other x values
            end
        end
        if A(i,i) ~= 0 %check for division of zero
            x(i) = nx(i)/A(i,i); %Set new x into x vector now, so new info %is used
        else
            flag = 1;
            error='Zero Diagonal Entry not allowed!'
            break
        end
    end
    
    if flag == 1 %stop if trying to divide by zero
        break
    end

    %increment tester and step
    tol_tester = norm(b-A*x,2);
    step = step+1;
        
     if mod(step,5)==0 %print every five steps
        step 
        soln = x
        norm(b-A*x,2)
     end
end

if mod(step,5) ~=0 %print last step if not already printed
 step 
 soln = x
 norm(b-A*x,2)
end