function [min, save] = dwt_optimise(X, iter);

Xq = quantise(X, 17);
ref_std = std(X(:) - Xq(:));

min = 10;
save = 5;

Y = nlevdwt(X, iter);

for q=5:0.01:13
    Yq = quantdwt(Y, q, iter);
    Z = nlevidwt(Yq, iter);
    error = std(X(:) - Z(:));
    if abs(error - ref_std) < min
        min = abs(error - ref_std);
        save = q;
    end
end

return;