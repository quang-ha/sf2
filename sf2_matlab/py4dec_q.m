%% First part, generating X1 and Y0
h = 0.25*[1 2 1];

% Generate cell
Z_cell_q = cell(num_steps, 1);

% First cell
Z_cell_q{num_steps} = rowint(X_cell_q{num_steps+1}, 2*h);
Z_cell_q{num_steps} = rowint(Z_cell_q{num_steps}', 2*h); Z_cell_q{num_steps} = Z_cell_q{num_steps}';

Z_cell_q{num_steps} = Z_cell_q{num_steps} + Y_cell_q{num_steps};

%% For loop

for i=num_steps-1:-1:1
    
%Decimate image
Z_cell_q{i} = rowint(Z_cell_q{i+1}, 2*h);
Z_cell_q{i} = rowint(Z_cell_q{i}', 2*h); Z_cell_q{i} = Z_cell_q{i}';

Z_cell_q{i} = Z_cell_q{i} + Y_cell_q{i};

end

%draw_cell(Z_cell_q);
%std(X_cell{1}(:) - Z_cell_q{1}(:));
%max(abs(X_cell{1}(:) - Z_cell_q{1}(:)))