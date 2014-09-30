%%Problem 3.3.10 part b
%%leastsq.m
%%Amie Demmel
%
%This script solves the least squares problem using the qr command

%Input matrix, called A
A = input('enter least squares matrix: ');

%Finds Q and R decompostion of A
[Q,R] = qr(A);

%Enter the solution matrix(code can be modified by adding a loop to reuse A
%for multiple b vectors)
b = input('enter b vector: ');

%Initialize variables and calculates c, s.t. Ax = b => Rx = Q'*b = c
n = size(A);
m = n(1);
n = n(2);
c = Q'*b;

%Solves the Rx = c with backwards substitution since R is upper triangular
x = zeros(n,1);
for i = 1:n 
    k = (n+1)-i;
    x(k) = c(k);
    if i ~= 1
        for j = k+1:n
            x(k) = x(k)-R(k,j);
        end
    end
    x(k) = x(k)/R(k,k);
end

%Solution vector
x