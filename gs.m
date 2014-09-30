%%gs.m
%%Classical Gram-Schmidt Algorithm
%%Amie Demmel
%%
%%This script calculates an orthonormal matrix and overwrites it on V,
%%(saving V as V1 for easy of norm calculations for the homework problem)
%%it simulatanously find the r matrix which when multiplied to the
%%orthnormal matrix should reproduce the original matrix

%Intialize and input variables
V = input('enter matrix : ');
V1 = V;
m = size(V);
n = m(1);
m = m(2);
flag = 0;
q = zeros(n,m);
r = zeros(m,m);

%Main for loop to orthogonalize the columnvectors in V
for k = 1:m
    %Loop to calculate r matrix entries, and to orthogonalize V will not
    %implent if k = 1 since the first column we will only normalize 
    for i = 1:k-1
        r(i,k) = V(:,i)'*V(:,k);
        V(:,k) = V(:,k) - (V(:,i))*r(i,k);
    end
    
    %Finds the length of the column
    r(k,k) = norm(V(:,k),2);
    
    %If the column vector= 0 flagged, otherwise the vector is normalized
    if r(k,k) == 0
        flag = 1;
    else
        V(:,k) = (1/r(k,k))*V(:,k);
    end
    
    %If the flag has been set, then exit script -> column vectors are not
    %linearly independent
     if flag == 1
        'The matrix is not linearly independent'
        break;
    end
end