function knots = gen_knots(N, a, b, method, k)
% N: number of basis
% k: 次数，默认为3

if ~exist('N', 'var') || isempty(N)
    N = 6;
end

if ~exist('k', 'var') || isempty(k)
    k = 3;
end

if ~exist('a', 'var') || isempty(a)
    a = 0;
end

if ~exist('b', 'var') || isempty(b)
    b = 1;
end

if ~exist('method', 'var') || isempty(method)
    method = 2;
end

K = k + 1;

if N < K
    error('N must be greater than or equal to K');
end

switch method
    case 1
        knots = linspace(a, b, N+K);  % 均匀样条
    case 2
        knots = [a*ones(1,K-1) linspace(a, b, N-K+2) b*ones(1,K-1)];  % 准均匀样条
end

