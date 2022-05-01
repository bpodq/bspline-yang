function knots = gen_x_knots(x, K)


if ~exist('x', 'var') || isempty(x)
    x = [0 1/3 2/3 1];
end

if ~exist('K', 'var') || isempty(K)
    K = 4;
end

a = x(1); b = x(end);
knots = [a*ones(1,K-1) x(:)' b*ones(1,K-1)];

