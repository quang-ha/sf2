%% First part, generating X1 and Y0
h = 0.25*[1 2 1];

% Generate cell
num_steps = 8;
Z_cell = cell(num_steps, 1);

% First cell
Z_cell{num_steps} = rowint(X_cell{num_steps+1}, 2*h);
Z_cell{num_steps} = rowint(Z_cell{num_steps}', 2*h); Z_cell{num_steps} = Z_cell{num_steps}';

Z_cell{num_steps} = Z_cell{num_steps} + Y_cell{num_steps};

%% For loop

for i=num_steps-1:-1:1
    
%Decimate image
Z_cell{i} = rowint(Z_cell{i}, 2*h);
Z_cell{i} = rowint(Z_cell{i}', 2*h); Z_cell{i} = Z_cell{i}';

Z_cell{i} = Z_cell{i} + Y_cell{i};

end

draw_cell(Z_cell);
max(abs(X_cell{1}(:) - Z_cell{1}(:)))