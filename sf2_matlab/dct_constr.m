function Z = dct_constr(Y, N)
%% Y = image used for reconstruction
%% N - dct_ii(N)

C = dct_ii(N);
Z = colxfm(colxfm(Y', C')', C');
%image = regroup(Z,N)/N;

return