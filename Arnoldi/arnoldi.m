%arnoldi.m
%Amie Demmel
%4/23/14
%%
%Arnoldi Process: This script uses the arnoldi
%process that produces orthonormal q vectors which
%span the Krylov space

%Initialize constants and set user-defined variables
k = 0;
A = input('supply A : ');
n = length(A);
q1 = ones(n,1);
overflow = input('run arnoldi for how many steps?  ');
flag = 0;
q = zeros(n,overflow);

%normalize the inital vector to control scale
q(:,1) = q1/norm(q1,2);

%find the orthonormal krylov space for 'overflow'
while k < overflow
    k = k+1; %incriment step
    q(:,k+1) = A*q(:,k); %Aq term
    h(1:k,k) = q(:,1:k)'*q(:,k+1);
    q(:,k+1)= q(:,k+1)-q(:,1:k)*h(1:k,k); %orthogonalize
    s = q(:,1:k)'*q(:,k+1);
    q(:,k+1) = q(:,k+1) - q(:,1:k)*s; %reorthogonalize
    h(1:k,k) = h(1:k,k)+s;
    h(k+1,k) = norm(q(:,k+1),2);
    if h(k+1,k) == 0 %set flag to end loop, division by zero
        flag = 1;
        break
    end
    q(:,k+1) = q(:,k+1)/h(k+1,k); %normalize
end

%Report that the flag was invoked and at which step
if flag == 1
    steps_taken = k;
    'span is invariant under A'
end