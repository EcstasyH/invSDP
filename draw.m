%x(n+1) = f(x(n),y(n))
%y(n+1) = g(x(n),y(n))

x = linspace(-5,5,100);
y = linspace(-5,5,100);
[X, Y] = meshgrid(x,y);

U = zeros(size(X));
V = zeros(size(Y));
for i = 1:numel(X)
    nx = X(i);
    ny = Y(i);
    %U(i) = f(X(i),Y(i));
    U(i) = 1*ny;
    V(i) = 1*(-nx+nx^3/3-ny);
    %V(i) = g(X(i),Y(i));
end

figure;
quiver(X,Y,U,V);
xlabel('x');
ylabel('y');