%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bezier curve basis and curve
%
%                      Yang Weiqiang
%                         2021/06/28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

x = [1 2 3 4]';
y = [0 1 1 0]';

n = length(x) - 1;     % order
m = 100;   % number of points

t = linspace(0, 1, m+1)';
A = zeros(m+1, n+1);  % Basis

for j = 0:n
    A(:, j+1) = t.^j .* (1-t).^(n-j) * nchoosek(n, j);
end


xx = A*x;
yy = A*y;

figure(1); plot(t, A) % plot basis

figure(2)
plot(x, y, '.-', 'markersize', 20)
hold on;
plot(xx, yy)
hold off

