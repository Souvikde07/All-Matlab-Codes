function [] = Euler_cfd(x0,y0,h)
xn = 0.2;
x = x0:h:xn;
n = length(x);
f = @(x,y) (x+y);
y(1) = y0;
for i=2:n
    y(i) = y(i-1)+h*f(x(i-1),y(i-1));
end
fprintf('Approximate solution by Eulers method is y(%f)=%f\n',x(end),y(end));
plot(x,y,'b-*');
hold on 
%x=linspace(0,5,1000);
m=dsolve('Dy= x+y','y(0)=1','x');
m = eval(m);
disp(m);
plot(x,m,'r');
grid on 
legend('Approximate solution by Eulers method','Exact solution');
end