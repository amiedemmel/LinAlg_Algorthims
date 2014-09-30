%sorex.m
%Amie Demmel
%
%Successive over-relaxation algorithm for the specific pde model 8.1.8

format long

%input relaxation factor and mesh size to use
w = input('relaxation factor : ');
h = input('mesh size : ');

%set n from mesh size and f by problem and initialize u and x
n = 1/h + 1;
u = zeros(n);
f = 0;
x = zeros(n,1);

%boundry conditions g(x,y) used to set the boundries on u
for j=0:n-1
    x = j*h;
    u(n,j+1)=x;
    u(j+1,1)=(x-1)*sin(x);
    u(j+1,n)=x*(2-x);
end

%u  %A check on the formation of u

%Initialize control variables
tol_tester = 1;
tol = 10^-8;
step = 0;
overflow = 26000;
flag = 0;
d = 0;

while (tol_tester > tol)&&(step < overflow)
    %step  %uncomment to print the step
    u_old = u; %set u_old so the test value below can be computed
    %SOR algorithm steps for non-boundry u
    for i=2:n-1
        for j=2:n-1
            nu = .25*(u(i-1,j)+u(i,j-1)+u(i,j+1)+u(i+1,j)+h^2*f);
            d = nu - u(i,j);
            u(i,j) = u(i,j) + w*d;
        end
    end
    
    %set new test value and increment step 
    tol_tester = norm(u - u_old,2)/norm(u,2);
    step = step + 1;
    
    %if mod(step,5)==0
    %   step 
    %    norm(u,2)
    %end
end

%print the step and end test value to check it meet tolerance set
%if mod(step,5) ~=0
 step 
 tol_tester
%end