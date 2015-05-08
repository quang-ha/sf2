function draw_cell( cell )
% This is used to draw the cell, which contains images at different pyramid
% depth. 
temp = beside(cell{1},cell{2});

for i=3:1:size(cell,1)
    temp = beside(temp,cell{i});
end
    
draw(temp);
end

