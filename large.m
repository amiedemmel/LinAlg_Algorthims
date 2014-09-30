%tol = input('input tolerance for deciding if sv are small : ');
tol = .1;
r = input('how many matrices to test? ');
x = zeros(1,r);
y = zeros(1,r);
n = 0;
m = 0;
for j = 1:r
    n = input('n = ');
    m = input('m = ');
    %while n == 0
        %n = randi(100,1);
    %end
    %while m == 0
        %m = randi(100,1);
    %end
    A = randn(n,m);
    [U,S,V]=svd(A);
    
    if n > m
        k = m;
    else
        k = n;
    end
        y(j) = S(k,k);
    if abs(y) <= tol
        x(j) = 1;
    end
end

plot(y)