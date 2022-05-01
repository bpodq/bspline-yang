%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% �������չʾ 1 -- m-1 ��B��������
%
%                      Yang Weiqiang 
%                          2021/6/29
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m = 4;  % ��ĸ���
x = rand(1, m)'*100;
y = rand(1, m)'*100;

n = 1000;
xmin = min(x);
xmax = max(x);
pts = linspace(0, 1, n+1);

%%
clf
I = 1;
for k = 1:m-1
    knots = gen_knots(m, 0, 1, 2, k);  % ׼��������
    B = gen_spline_basis(knots, pts, k);
    subplot(3, 3, I); plot(B*x, B*y, x, y, 'r*')  % ֱ����������������
    I = I + 1;
end
