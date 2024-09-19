
A = [2 -1 0; 3 4 1; 5 6 2];
A = [A [4 -2 -1]'];

n = size(A, 1);
L = zeros(n);
U = zeros(n, n+1);

for i=1:(n+1)
    if i <= n 
        L(i, 1) = A(i, 1);
    end
    U(1, i)= 1/A(1,1) * A(1, i);
end

for i=2:n
    for j = i:n
        L(j,i)=A(j,i) - sum(  L(j, 1:(i-1)) .* U( 1:(i-1), i )'  );
    end

    for j = i:(n+1)
        U(i, j) = 1/L(i,i) * (A(i, j) - sum( L(i, 1:(i-1) ) .* U(1:(i-1), j)' ));
    end
    
end


