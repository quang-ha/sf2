function [mse_err, step_ratio, comp_ratio] = lbt_center_quantise(X)

%% initial parameters
s = 1.4018;
N = 64;
qstep = 19.06; 

%% reference values
Xq = quantise(X, 17);
ref_bits = bpp(Xq)*256*256;

%% start finding optimise value at different ratio
comp_ratio = [];
step_ratio = [0.3:0.01:2.0];
mse_err = [];

for i = 0.3:0.01:2.0
    %qstep = fminsearch(@(x) min_std(X, x, i, N), 23.0);
    I = size(X, 1);
    t = [(1+N/2):(I-N/2)];
    [Pr, Pf] = pot_ii(N, s);
    Xp = X;
    Xp(t, :) = colxfm(Xp(t,:), Pf);
    Xp(:, t) = colxfm(Xp(:,t)', Pf)';
 
    [Yq, Yr] = dct_image(Xp, qstep, i, N);
    err = min_std(X, qstep, i, N);
    mse_err = [mse_err err];
    bits = dctbpp(Yq, N);
    comp_ratio = [comp_ratio bits];
end

return