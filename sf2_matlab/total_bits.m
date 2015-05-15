function a = total_bits(b,  cell )

a = bpp(b{size(b, 1)}) * size(b{size(b, 1)}, 1) * size(b{size(b, 1)}, 2);
for i=1:1:size(cell,1)
    a = a + bpp(cell{i})*size(cell{i},1)*size(cell{i},2);
end

return