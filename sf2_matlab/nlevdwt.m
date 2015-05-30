function Y = nlevdwt(X, iter)

m = size(X, 1);
Y = X;

for i = 1:1:iter
    t = 1:m/(2^(i-1));
    Y(t,t) = dwt(Y(t,t));
end

return;