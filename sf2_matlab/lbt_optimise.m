function [min, save] = lbt_optimise(X, N)

min = 2.2878e5;
save = 1;

for s = 1.4000:0.0001:1.5000
    [Z, Yr, Xp, Pr, Pf] = dct_lbt(X, N, 0, s);
    [error, q_step] = dct_optimise(Xp, N);
    [Z, Yr, Xp, Pr, Pf] = dct_lbt(X, N, q_step, s);
    
    if min > dctbpp(Yr, N)
        min = dctbpp(Yr, N);
        save = s;
    end
    
end

return