function std_err = min_std( X, q, ratio, N )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
s = 1.4018;

Xq = quantise(X, 17);
ref_std = std(X(:) - Xq(:));

I = size(X, 1);
t = [(1+N/2):(I-N/2)];
[Pr, Pf] = pot_ii(N, s);
Xp = X;
Xp(t, :) = colxfm(Xp(t,:), Pf);
Xp(:, t) = colxfm(Xp(:,t)', Pf)';

[Yq, Yr] = dct_image(Xp, q, ratio, N);
Z = dct_constr(Yq, N);

Zp = Z;
Zp(:,t) = colxfm(Zp(:,t)', Pr')';
Zp(t,:) = colxfm(Zp(t,:), Pr');

Z = Zp;

std_err = abs(std(X(:) - Z(:)) - ref_std);

return;

