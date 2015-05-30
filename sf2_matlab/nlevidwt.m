function X = nlevidwt(Y, iter)

m = size(Y, 1);
X = Y;

for i = iter:-1:1
    t = 1:m/(2^(i-1));
    X(t,t) = idwt(X(t,t));
end

return;