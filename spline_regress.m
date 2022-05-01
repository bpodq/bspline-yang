function beta = spline_regress(pts, B, x, y)

V = zeros(length(x), size(B,2)); 
for j = 1:size(B,2)
    V(:,j) = interp1(pts, B(:,j), x);
end

beta = regress(y, V);

