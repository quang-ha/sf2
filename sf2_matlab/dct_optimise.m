Xq = quantise(X, 17);
ref_std = std(X(:) - Xq(:));

min = 10;
save = 17;

for q = 15:0.01:25
    [Yq, Yr] = dct_image(X, N, q);
    Zq = dct_constr(Yq, N);
    
    std_err = std(X(:) - Zq(:));
    
    if min > abs(std_err - ref_std)
        save = q;
        min = abs(std_err - ref_std);
    end
    
end

min
save