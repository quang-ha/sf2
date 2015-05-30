function Y = dwt_svd(X, q, iter);
%% We here can consider how many iteration we can suppress

for i=1:iter
    total = total + bpp(Yq(1:2^(8-i),2^(8-i)+1:2^(8-i+1)))*(2^(8-i))*(2^(8-i)); 
    total = total + bpp(Yq(2^(8-i)+1:2^(8-i+1),2^(8-i)+1:2^(8-i+1)))*(2^(8-i))*(2^(8-i)); 
    total = total + bpp(Yq(2^(8-i)+1:2^(8-i+1),1:2^(8-i)))*(2^(8-i))*(2^(8-i)); 
end    

end

