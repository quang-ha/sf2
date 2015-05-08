function Xf = convol_row(X,h)
    % Section 5, performing convolution of 15-sample half-cosine with each
    % row of the test image. 
    Xf = conv(X(1,:), h);
    for i=2:1:size(X,1)
        Xf = [Xf; conv(X(i,:), h)];
    end
    
    return
end