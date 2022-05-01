%% 
load term_structure_data;  % 没有数据

knots = gen_knots(length(x), x(1), x(end));
% knots = gen_x_knots(x);

pts = linspace(x(1), x(end), 1001);
B = gen_spline_basis(knots, pts);
subplot(3,1,1); plot(B*x, B*y, x, y, 'r*')  % 直接用数据对样条进行计算

%% 不稳定
beta = spline_regress(pts, B, x, y);  % 回归，过拟合
subplot(3,1,2);
plot(x, y, 'r*'); hold on
plot(pts, B*beta); hold off

%% better
N = 12;
knots = gen_knots(N, x(1), x(end)); % 用较少个数的基回归
B = gen_spline_basis(knots, pts);
beta = spline_regress(pts, B, x, y);
subplot(3,1,3);
plot(x, y, 'r*'); hold on
plot(pts, B*beta); hold off
