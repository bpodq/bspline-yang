x=[0 0.05 0.20 0.3 0.40 0.60 0.70 0.95]';
y=[0 0.20 0.35 0.4 0.42 0.43 0.44 0.45]';

% knots = [0 0 0 0 1 1 1 1];
% knots = [0 0 0 0 1/3 2/3 1 1 1 1];
% knots = [0 0 0 0 1/4 2/4 3/4 1 1 1 1];
% knots = [0 0 0 0 1/5 2/5 3/5 4/5 1 1 1 1]; 

pts = linspace(x(1), x(end), 1001);

% 这里用函数产生节点
knots = gen_knots(length(x), x(1), x(end));
% knots = gen_x_knots(x);

%%
B = gen_spline_basis(knots, pts);
subplot(3,1,1); plot(B*x, B*y, x, y, 'r*')  % 直接用样条生成曲线

%% 回归导致过拟合
beta = spline_regress(pts, B, x, y);
subplot(3,1,2);
plot(x, y, 'r*'); hold on
plot(pts, B*beta); hold off

%% 用更少的样条回归，better
knots = gen_knots(5, x(1), x(end));
B = gen_spline_basis(knots, pts);
beta = spline_regress(pts, B, x, y);
subplot(3,1,3);
plot(x, y, 'r*'); hold on
plot(pts, B*beta); hold off

