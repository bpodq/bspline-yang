%%
n = 6; k = 4;
knots   = linspace(0, 1, n+k);  % 这里用均匀节点
pts     = 0:0.01:1;
B       = gen_spline_basis(knots, pts);
subplot(3, 1, 1)
plot(pts, B)  % 注意左右两个端点值都为0

%%
x=[0 0.05 0.20 0.3 0.40 0.60]';
y=[0 0.20 0.35 0.4 0.42 0.43]';
subplot(3, 1, 2)
plot(B*x, B*y, x, y, 'r-o')  % 样条基决定了这种现象，最后回到零点

%%
x=[1 2 3 4 5 6]';
y=[2 1 3 4 6 5]';
subplot(3, 1, 3)
plot(B*x, B*y, x, y, 'r-o')  % 样条基决定了这种现象，最后回到零点

