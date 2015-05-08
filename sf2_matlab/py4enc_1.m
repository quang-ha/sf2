load lighthouse.mat;

%% Work out matrix of 128
offset = 128 * ones(size(X));

%% First part, generating X1 and Y0
h = 0.25*[1 2 1];

% Generate cell
num_steps = 7;
X_cell = cell(num_steps+2,1);
Y_cell = cell(num_steps+1,1);

% First cell with mean = 0
X_cell{1} = X - 128;

%% For loop

for i=2:1:num_steps
    
%Decimate image
X_cell{i} = rowdec(X_cell{i-1}, h);X_cell{i} = X_cell{i}';
X_cell{i} = rowdec(X_cell{i}, h); X_cell{i} = X_cell{i}';
draw(X_cell{i})

%Interpolate image;
temp = rowint(X_cell{i}, 2*h);temp = temp';
temp = rowint(temp, 2*h); temp = temp';

Y_cell{i-1} = X_cell{i-1} - temp;

end

draw_cell(Y_cell);
%draw(beside(Y_cell{1},beside(Y_cell{2},beside(Y_cell{3}, beside(Y_cell{4}, Y_cell{5})))));