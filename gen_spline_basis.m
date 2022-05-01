function B = gen_spline_basis(knots, pts, k)
%产生样条基
% knots 是节点
% pts 是剖分出来的点
% k: 次数
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

% M个点，M-1个区间
for i = 1:M-1  % 1阶样条基
    B(:,i)= (pts>=knots(i) & pts<knots(i+1));  % 左闭右开
end
B(end,M-1) = 1; % 最后一个点设为1

for k_ = 2:K
    for i = 1:M-k_
        B(:,i) = convolve(knots, pts, B(:,i), B(:,i+1), i, k_);
    end
    
    % 最后一个点
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

