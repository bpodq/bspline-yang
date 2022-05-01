function z = convolve(knots, pts, y1, y2, i, k)
% knots  : 节点
% pts   : 剖分点
% y1   : 向量1
% y2   : 向量2
% B   : 样条基

N = length(pts);
% M = length(ti)-1;

c1 = zeros(N,1); % 系数1
c2 = zeros(N,1);

% 向量运算
idx = (pts >= knots(i) & pts < knots(i+k-1));
c1(idx) = (pts(idx)-knots(i)) / (knots(i+k-1)-knots(i));

idx = (pts>=knots(i+1) & pts<knots(i+k));
c2(idx) = (knots(i+k)-pts(idx)) / (knots(i+k)-knots(i+1));

z = c1.*y1 + c2.*y2;

