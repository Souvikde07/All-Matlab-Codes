function [] = Euler_mod(xo,yo,h)
xn = 0.2;
x = xo:h:xn;
n = length(x);
f = @ (x,y)(x+y);
y(1) = yo;
yp(1) = yo;
max_it = 10;
for i=2:n
    yp(i) = y(i-1)+h*f(x(i-1),y(i-1));
    s(i,1) = yp(i);
    for j = 2:max_it
        s(i,j) = y(i-1)+ h/2*(f(x(i-1),y(i-1))+f(x(i),s(i,j-1)));
        if (abs(s(i,j)-s(i,j-1))<10^(-6))
            y(i) = s(i,j);
            break;
        end
    end
end
fprintf('Approximate solution by Eulers modified method is y(%f)=%f\n',x(end),y(end));
plot(x,yp,'m--');
hold on;
plot(x,y,'r*');
hold on;
%x = linspace(0,500,1000);
u = dsolve('Dy=x+y','y(0)=1','x');
u = eval(u);
disp(u);
plot(x,u);
%axis([-10,50,0,50]);
grid on;
legend('Approximate solution by Eulers method','Approximate solution by Eulers modified method','Exact Sloution');
end