min_error = 10;
for i=5.0:0.01:20.0
    quantise_steps = i;
    py4enc;
    py4dec_q;
    std_err = std(X_cell{1}(:) - Z_cell_q{1}(:));
    if min_error > abs(std_err - ref_std)
        min_error = abs(std_err - ref_std);
        save = quantise_steps;
    end
end

min_error
save