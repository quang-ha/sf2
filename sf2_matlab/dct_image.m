function [Q, image] = dct_image(X, q, ratio, N)
%% X - original image with removed offset
%% N - dct_ii(N)
%% q - 1 for quantise, 0 for non-quantise.

C = dct_ii(N);
Q = colxfm(colxfm(X, C)', C)';
if q ~= 0
    Q = quantise(Q, q, q*ratio);
end

image = regroup(Q,N);

return