%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 这个例子展示 1 -- m-1 次B样条曲线
%
%                      Yang Weiqiang 
%                          2021/6/29
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

m = 4;  % 点的个数
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
    knots = gen_knots(m, 0, 1, 2, k);  % 准均匀样条
    B = gen_spline_basis(knots, pts, k);
    subplot(3, 3, I); plot(B*x, B*y, x, y, 'r*')  % 直接用样条生成曲线
    I = I + 1;
end
