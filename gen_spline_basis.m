function B = gen_spline_basis(knots, pts, k)
%����������
% knots �ǽڵ�
% pts ���ʷֳ����ĵ�
% k: ����
%
%Example
% B = gen_spline_basis;
% pts = linspace(0,1,101)';
% plot(pts, B);
%
% knots = [0 0 0 0 1/3 2/3 1 1 1 1];
% pts = linspace(0,1,101);
% B = gen_spline_basis(knots, pts, 4);
% plot(pts, B);

if ~exist('knots', 'var') || isempty(knots)
    knots = [0 0 0 0 1/3 2/3 1 1 1 1];
end

if ~exist('pts', 'var') || isempty(pts)
    pts = linspace(0,1,101);
end

if ~exist('k', 'var') || isempty(k)
    k = 3;
end
K = k + 1;

N = length(pts);
M = length(knots);
% nBasis = M - K;
B = zeros(N, M-1);

% M���㣬M-1������
for i = 1:M-1  % 1��������
    B(:,i)= (pts>=knots(i) & pts<knots(i+1));  % ����ҿ�
end
B(end,M-1) = 1; % ���һ������Ϊ1

for k_ = 2:K
    for i = 1:M-k_
        B(:,i) = convolve(knots, pts, B(:,i), B(:,i+1), i, k_);
    end
    
    % ���һ����
    % i=M-k
    if knots(i+k_-1) == knots(i)
        c1 = 0;
    else
        c1 = (pts(end)-knots(i)) / (knots(i+k_-1)-knots(i));
    end
    
    if knots(i+k_) == knots(i+1)
        c2 = 1;
    else
        c2 = (knots(i+k_)-pts(end)) / (knots(i+k_)-knots(i+1));
    end
    
    B(end,M-k_) = c1*B(end,i) + c2*B(end,i+1);
end

B = B(:, 1:M-K);

