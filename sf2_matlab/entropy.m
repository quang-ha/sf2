%% Xcell
% Initialise first two components
bpp_X = bpp(X_cell{1});
bits_X = bpp(X_cell{1}) * size(X_cell{1}, 1) * size(X_cell{1}, 2);
bpp_X_q = bpp(quantise(X_cell{1}, 17));
bits_X_q = bpp(quantise(X_cell{1}, 17)) * size(X_cell{1}, 1) * size(X_cell{1}, 2);

for i=2:1:size(X_cell, 1)
    % Entropy prior to quantisation
    bpp_X = [bpp_X bpp(X_cell{i})];
    bits_X = [bits_X bpp(X_cell{i}) * size(X_cell{i}, 1) * size(X_cell{i}, 2)];
    % Entropy after 17-steps quantisation
    bpp_X_q = [bpp_X_q bpp(quantise(X_cell{i}, 17))];
    bits_X_q = [bits_X_q bpp(quantise(X_cell{1}, 17)) * size(X_cell{1}, 1) * size(X_cell{1}, 2)];
end

%% Ycell
% Initialise first two components
bpp_Y = bpp(Y_cell{1});
bits_Y = bpp(Y_cell{1}) * size(Y_cell{1}, 1) * size(Y_cell{1}, 2);
bpp_Y_q = bpp(quantise(Y_cell{1}, 17));
bits_Y_q = bpp(quantise(Y_cell{1}, 17)) * size(Y_cell{1}, 1) * size(Y_cell{1}, 2);

for i=2:1:size(Y_cell, 1)
    % Entropy prior to quantisation
    bpp_Y = [bpp_Y bpp(Y_cell{i})];
    bits_Y = [bits_Y bpp(Y_cell{i}) * size(X_cell{i}, 1) * size(X_cell{i}, 2)];
    % Entropy after 17-steps quantisation
    bpp_Y_q = [bpp_Y_q bpp(quantise(X_cell{i}, 17))];
    bits_Y_q = [bits_Y_q bpp(quantise(X_cell{1}, 17)) * size(X_cell{1}, 1) * size(X_cell{1}, 2)];
end

%% Zcell
% Initialise first two components
bpp_Z = bpp(Z_cell{1});
bits_Z = bpp(Z_cell{1}) * size(Z_cell{1}, 1) * size(Z_cell{1}, 2);
bpp_Z_q = bpp(quantise(Z_cell{1}, 17));
bits_Z_q = bpp(quantise(Z_cell{1}, 17)) * size(Z_cell{1}, 1) * size(Z_cell{1}, 2);

for i=2:1:size(Z_cell, 1)
    % Entropy prior to quantisation
    bpp_Z = [bpp_Z bpp(Z_cell{i})];
    bits_Z = [bits_Z bpp(Z_cell{i}) * size(Z_cell{i}, 1) * size(Z_cell{i}, 2)];
    % Entropy after 17-steps quantisation
    bpp_Z_q = [bpp_Z_q bpp(quantise(Z_cell{i}, 17))];
    bits_Z_q = [bits_Z_q bpp(quantise(Z_cell{1}, 17)) * size(Z_cell{1}, 1) * size(Z_cell{1}, 2)];
end