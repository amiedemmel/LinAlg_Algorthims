%SOR

format long

A = input('enter the A matrix of the system : ');
b = input('enter the b vector of the system : ');
x = input('enter inital guess of x : ');
w = input('relaxation factor : ');

n = size(A);
m = n(2);
n = n(1);
tol_tester = 1;
tol = 10^-5;
step = 0;
overflow = 30;
flag = 0;
d = 0;

while (tol_tester > tol)&&(step < overflow)
    nx = b;
    for i=1:n
        for j=1:m
            if j ~= i
                nx(i)=nx(i)-A(i,j)*x(j);
            end
        end
        if A(i,i) ~= 0
            nx(i) = nx(i)/A(i,i); %Should use new information sooner
            d = nx(i)-x(i);
            x(i) = x(i)+w*d;
        else
            flag = 1;
            error='Zero Diagonal Entry not allowed!'
            break
        end
    end
    
    if flag == 1
        break
    end

    tol_tester = norm(b-A*x,2);
    step = step+1;

    if mod(step,5)==0
        step 
        soln = x
        norm(b-A*x,2)
     end
end

if mod(step,5) ~=0
 step 
 soln = x
 norm(b-A*x,2)
end