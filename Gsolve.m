b = input('Enter b : ');
for k = 1:(n-1)
    m = exch(k);
    if m ~= k
        swt = b(k);
        b(k) = b(m);
        b(m) = swt;
    end
end

for j = 1:(n-1)
    for i = (j+1):n
        b(i) = b(i) - A(i,j)*b(j);
    end
end

flag = 0;
for j = 0:n-1
    if A(n-j,n-j) == 0
        flag = 1;
        break
    end
    if n-j == n
        b(n-j) = b(n-j)/A(n-j,n-j);
    else
        for i = (n-j)+1:n
            b(n-j) = b(n-j) - A(n-j,i)*b(i);
        end
        b(n-j) = b(n-j)/A(n-j,n-j);
    end
end