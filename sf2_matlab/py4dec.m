load lighthouse.mat;

%% Work out matrix of 128
offset = 128 * ones(size(X4));

%% First part, generating X1 and Y0
h = 0.25*[1 2 1];
X4_1 = X4;% + offset;

%%First round
%Interpolate image = X4 + 2*offset;
X4_2 = rowint(X4_1, 2*h);X4_2 = X4_2';
X4_2 = rowint(X4_2,2*h); X4_2 = X4_2';

%Add high pass image
Z3 = X4_2 + Y3;

%%Second round
%Interpolate image
Z3_2 = rowint(Z3, 2*h); Z3_2 = Z3_2';
Z3_2 = rowint(Z3_2, 2*h); Z3_2 = Z3_2';

%Add high pass image
Z2 = Z3_2 + Y2;


%%Third round
%Interpolate image
Z2_2 = rowint(Z2, 2*h); Z2_2 = Z2_2';
Z2_2 = rowint(Z2_2, 2*h); Z2_2 = Z2_2';

%Add high pass image
Z1 = Z2_2 + Y1;

%%Fourth round
%Interpolate image
Z1_2 = rowint(Z1, 2*h); Z1_2 = Z1_2';
Z1_2 = rowint(Z1_2, 2*h); Z1_2 = Z1_2';

%Add high pass image
Z0 = Z1_2 + Y0;


draw(beside(Z0,beside(Z1,beside(Z2,beside(Z3,Y3)))));
