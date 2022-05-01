%%
knots   = [0 0 0 0 1/3 2/3 1 1 1 1];  % ����������Լ�д�ڵ�
pts     = 0:0.01:1;
B       = gen_spline_basis(knots, pts);

subplot(3, 1, 1)
plot(pts, B)

%% ����
x=[0 1 1 0 0 1]';
y=[1 1 0 0 -1 -1]';

subplot(3, 1, 2)
plot(B*x, B*y, x, y, 'r-o')

%%
x=[0 0.05 0.20 0.3 0.40 0.60]';
y=[0 0.20 0.35 0.4 0.42 0.43]';

subplot(3, 1, 3)
plot(B*x, B*y, x, y, 'r-o')

