function v = ybspline(x, y, u)

if nargin<3
    x = [ 1.0000    3.0000    5.0000    7.5000   10.5000   13.5000   16.5000   19.5000   22.5000   25.5000   28.5000   31.5000   34.5000   37.5000   40.5000   43.5000   46.5000   49.5000   52.5000   55.5000   58.5000   61.5000   64.5000   67.5000   70.5000   73.0000   75.0000   77.0000];
    y =  [0   77.9611   70.7764   66.6472   63.8111   63.4083   62.8042   62.2986   61.9278   63.2139   62.7465   63.1111   62.5653   61.4431     61.7722   61.8931   65.2153   72.8889  104.5694  153.6889  225.0917  289.8264  369.8764  397.5458  423.6194  398.9139  369.1653  309.0236];
    x = x(21:28)';
    y = y(21:28)';
end

x = x(:); y = y(:);
knots   = [0 0 0 linspace(0, 1, length(x)-2) 1 1 1];
pts     = linspace(0, 1, 101);
B       = gen_spline_basis(knots, pts);

xx = B*x;
yy = B*y;

v = interp1(xx, yy, u, 'pchip');

