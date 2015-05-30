function [Z, Yr, Xp, Pr, Pf] = dct_lbt(X,q, ratio, N, s);

%if (nargin<4)
%[Pr, Pf] = pot_ii(N);
%else
  [Pr, Pf] = pot_ii(N, s);
%end

I = size(X, 1);
t = [(1+N/2):(I-N/2)];
Xp = X;
Xp(t, :) = colxfm(Xp(t,:), Pf);
Xp(:, t) = colxfm(Xp(:,t)', Pf)';

[Yp, Yr] = dct_image(Xp,q, ratio, N);
Z = dct_constr(Yp, N);

Zp = Z;
Zp(:,t) = colxfm(Zp(:,t)', Pr')';
Zp(t,:) = colxfm(Zp(t,:), Pr');

Z = Zp;

return;