function final_image = dwt_code(X, N, M, qstep, dcbits )

% [vlc bits huffval] = jpegenc(X - 128, qstep, N, M, true, 16);
% final_image = jpegdec(vlc, qstep, N, M, bits, huffval, 16, 256, 256);

Y = nlevdwt(X, 3); % performing n level of dwt on image X
Yqug = quant1dwt(Y, qstep, 3); % quantising the image X based on MSE
Yq = dwtgroup(Yqug, (log(N)/log(2)));

Zi = quant2dwt(Yq, qstep, 3);
Zug = dwtgroup(Zq, -log(N)/log(2));
Z = nlevidwt(Zug, 3);

final_image = Z;
return;

