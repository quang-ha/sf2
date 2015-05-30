function total = dctbpp(image, N)

total = 0;
sub_size = size(image, 1)/N;

for i= 0:N-1
    for j=0:N-1
        sub_image = image(i*sub_size+1:(i+1)*sub_size, j*sub_size+1:(j+1)*sub_size);
        total = total + bpp(sub_image)*sub_size*sub_size;
    end
end

return