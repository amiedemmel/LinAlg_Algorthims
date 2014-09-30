%Jacobi Algorithm

%initial guess and system entry
A = input('enter the A matrix of the system : ');
b = input('enter the b vector of the system : ');
x = input('enter inital guess of x : ');

n = length(A);
N = diag(A);
M = zeros(n);
%tol = 10^-5;
tol = input('How many Jacobi steps? ');
tol_test = 1;
k = 0;

for i=1:n
    M(i,i) = N(i);
end
N = M - A;

while tol_test < tol
    k = k + 1;
    x = N*x + b;
    x = M\x;
    
    if mod(k,10)==0
        step = k
        soln = x
        norm(b-A*x,2)
    end
    %tol_test = norm(b-A*x,2);
    tol_test = k;
end

if mod(k,10)~= 0
step = k
soln = x
norm(b-A*x,2)
end
