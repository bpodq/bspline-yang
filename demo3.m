%% 与demo2类似，回到原点
n = 8; k = 4;
knots   = linspace(0, 1, n+k);
pts     = 0:0.01:1;
B       = gen_spline_basis(knots, pts);
subplot(3, 1, 1)
plot(pts,B)

%%
x=[0 0.05 0.20 0.3 0.40 0.60 0.70 0.80]';
y=[0 0.20 0.35 0.4 0.42 0.43 0.44 0.45]';
subplot(3, 1, 2)
plot(B*x, B*y, x, y, 'r-o')  % ?

%%
x=[0.05 0.20 0.3 0.40 0.60 0.70 0.80 0.90]';
y=[0.20 0.35 0.4 0.42 0.43 0.44 0.45 0.45]';
subplot(3, 1, 3)
plot(B*x, B*y, x, y, 'r-o')  % ?
