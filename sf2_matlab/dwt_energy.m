function total = dwt_energy(Yq, iter)

total = 0;
for i=1:iter
    total = total + bpp(Yq(1:2^(8-i),2^(8-i)+1:2^(8-i+1)))*(2^(8-i))*(2^(8-i)); 
    total = total + bpp(Yq(2^(8-i)+1:2^(8-i+1),2^(8-i)+1:2^(8-i+1)))*(2^(8-i))*(2^(8-i)); 
    total = total + bpp(Yq(2^(8-i)+1:2^(8-i+1),1:2^(8-i)))*(2^(8-i))*(2^(8-i)); 
end

total = total + bpp(Yq(1:2^(8-iter), 1:2^(8-iter)))*(2^(8-iter))*(2^(8-iter));


return