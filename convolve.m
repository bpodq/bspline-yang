function z = convolve(knots, pts, y1, y2, i, k)
% knots  : �ڵ�
% pts   : �ʷֵ�
% y1   : ����1
% y2   : ����2
% B   : ������

N = length(pts);
% M = length(ti)-1;

c1 = zeros(N,1); % ϵ��1
c2 = zeros(N,1);

% ��������
idx = (pts >= knots(i) & pts < knots(i+k-1));
c1(idx) = (pts(idx)-knots(i)) / (knots(i+k-1)-knots(i));

idx = (pts>=knots(i+1) & pts<knots(i+k));
c2(idx) = (knots(i+k)-pts(idx)) / (knots(i+k)-knots(i+1));

z = c1.*y1 + c2.*y2;

