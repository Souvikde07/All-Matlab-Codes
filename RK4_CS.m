function [xy] = RK4_CS(x1,y1,h)
xn = 0.2;
f = @(x,y)(x+y);
y(1)=y1;
x = x1:h:xn;
n = length(x);
for i=2:n
    k1 = h*f(x(i-1),y(i-1));
    k2 = h*f(x(i-1)+h/2,y(i-1)+k1/2);
    k3 = h*f(x(i-1)+h/2,y(i-1)+k2/2);
    k4 = h*f(x(i-1)+h,y(i-1)+k3);
    y(i) = y(i-1)+ (1/6)*(k1+2*k2+2*k3+k4);
end
fprintf('Approximate solution runge-kutta fourth order method is y(%f)=%f\n',x(end),y(end));
plot (x,y,'r*-');
hold on
%x= linspace(0,3000,1000);
u = dsolve('Dy = (x+y)','y(0)=1','x');
u = eval(u);
disp(u);
plot(x,u);
%axis([-10,50,0,50]);
grid on;
legend('RK4 sol.','Exact sol');
end

