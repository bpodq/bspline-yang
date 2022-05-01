%% 
load term_structure_data;  % û������

knots = gen_knots(length(x), x(1), x(end));
% knots = gen_x_knots(x);

pts = linspace(x(1), x(end), 1001);
B = gen_spline_basis(knots, pts);
subplot(3,1,1); plot(B*x, B*y, x, y, 'r*')  % ֱ�������ݶ��������м���

%% ���ȶ�
beta = spline_regress(pts, B, x, y);  % �ع飬�����
subplot(3,1,2);
plot(x, y, 'r*'); hold on
plot(pts, B*beta); hold off

%% better
N = 12;
knots = gen_knots(N, x(1), x(end)); % �ý��ٸ����Ļ��ع�
B = gen_spline_basis(knots, pts);
beta = spline_regress(pts, B, x, y);
subplot(3,1,3);
plot(x, y, 'r*'); hold on
plot(pts, B*beta); hold off
