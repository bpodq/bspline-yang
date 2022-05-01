x=[0 0.05 0.20 0.3 0.40 0.60 0.70 0.95]';
y=[0 0.20 0.35 0.4 0.42 0.43 0.44 0.45]';

% knots = [0 0 0 0 1 1 1 1];
% knots = [0 0 0 0 1/3 2/3 1 1 1 1];
% knots = [0 0 0 0 1/4 2/4 3/4 1 1 1 1];
% knots = [0 0 0 0 1/5 2/5 3/5 4/5 1 1 1 1]; 

pts = linspace(x(1), x(end), 1001);

%%
% �ú��������ڵ�
knots = gen_knots(length(x), x(1), x(end));
% knots = gen_x_knots(x);
B = gen_spline_basis(knots, pts);  % 3������
subplot(3,1,1); plot(B*x, B*y, x, y, 'r*')  % ֱ����������������

%%
k = 4;
knots = gen_knots(length(x), x(1), x(end), 2, k);  % ׼��������
B = gen_spline_basis(knots, pts, k);
subplot(3,1,2); plot(B*x, B*y, x, y, 'r*')  % ֱ����������������

%%
k = 2;
knots = gen_knots(length(x), x(1), x(end), 2, k);  % ׼��������
B = gen_spline_basis(knots, pts, k);
subplot(3,1,3); plot(B*x, B*y, x, y, 'r*')  % ֱ����������������
