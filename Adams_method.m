function [ ] = Adams_method(x1,y1,xn,h)
f=@(x,y) x-y^2;
x=x1:h:xn;
n=length(x);
y(1)=y1;
maxit=100;
for i=1:3
    k1=h*f(x(i),y(i));
    k2=h*f(x(i)+h/2,y(i)+k1/2);
    k3=h*f(x(i)+h/2,y(i)+k2/2);
    k4=h*f(x(i)+h,y(i)+k3);
    y(i+1)=y(i)+(1/6)*(k1+2*k2+2*k3+k4);
end
%Predictor Formula
for i=4:n-1
    y(i+1)=y(i)+(h/24)*(55*f(x(i),y(i))-59*f(x(i-1),...
        y(i-1))+37*f(x(i-2),y(i-2))-9*f(x(i-3),y(i-3)));
    s(i+1,1)=y(i+1);
    for j=1:maxit
        s(i+1,j+1)=y(i)+(h/24)*(9*f(x(i+1),...
            s(i+1,j))+19*f(x(i),y(i))-5*f(x(i-1),...
            y(i-1))+1*f(x(i-2),y(i-2)));
        if abs(s(i+1,j+1)-s(i+1,j))<10^(-6)
            y(i+1)=s(i+1,j+1);
            break
        end
    end
end
fprintf('approx. sol. by Adam y(%f)=%f\n',x(end),y(end))
u=eval(dsolve('Dy=(x-y^2)','y(0)=0','x'));
plot(x,y)
hold on 
grid on
plot(x,u,'r*')
xlabel('t');
ylabel('i(t)');
legend('Exact solution','Approxiated solun')
end