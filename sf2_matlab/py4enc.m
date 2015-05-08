load lighthouse.mat;

%% Work out matrix of 128
offset = 128 * ones(size(X));

%% First part, generating X1 and Y0
h = 0.25*[1 2 1];

%%First round
%Decimate image
X = X - 128;
X1 = rowdec(X, h);X1 = X1';
X1 = rowdec(X1,h); X1 = X1';

%Interpolate image;
X1_1 = rowint(X1, 2*h);X1_1 = X1_1';
X1_1 = rowint(X1_1, 2*h); X1_1 = X1_1';

Y0 = X - X1_1;

%%Second round
%Decimate image
X2 = rowdec(X1, h); X2 = X2';
X2 = rowdec(X2, h); X2 = X2';

%Interpolate image
X2_1 = rowint(X2, 2*h); X2_1 = X2_1';
X2_1 = rowint(X2_1, 2*h); X2_1 = X2_1';

Y1 = X1 - X2_1;

%%Third round
%Decimate image
X3 = rowdec(X2, h); X3 = X3';
X3 = rowdec(X3, h); X3 = X3';

%Interpolate image
X3_1 = rowint(X3, 2*h); X3_1 = X3_1';
X3_1 = rowint(X3_1, 2*h); X3_1 = X3_1';

Y2 = X2 - X3_1;

%%Four round
%Decimate image
X4 = rowdec(X3, h); X4 = X4';
X4 = rowdec(X4, h); X4 = X4';

%Interpolate image
X4_1 = rowint(X4, 2*h); X4_1 = X4_1';
X4_1 = rowint(X4_1, 2*h); X4_1 = X4_1';

Y3 = X3 - X4_1;


draw(beside(Y0,beside(Y1,beside(Y2,beside(Y3,X4)))));
