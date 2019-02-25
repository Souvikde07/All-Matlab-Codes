function[] =cubicspline(X,Y)
n=length(X);
A=zeros(n-2,n-2);
B=zero(n-2,1);
for i=1:n-1
    h(i)=X(i+1)-X(i);
end
for i=1:n-2
    A(i,i)=(h(i)+h(i+1))/3;
end
for i=1:n-3
    A(i,i+1)=h(i+1)/6;
    A(i+1,i)=h(i+1)/6;
end
for i=1:n-2
    B(i)=(Y(i+2)-Y(i+1))/h(i+1)-(Y(i+1)-Y(i))/h(i);
end
M=A\B;
M=[0;M;0];
disp(M)
syms t
for i=2:n
    f(i-1)=((X(i)-t)^3*M(i-1)+(t-X(i-1)^3*M(i))/6*(h(i-1))+...
        (X(i-1)-t)*(Y(i-1)-h(i-1)^2*M(i-1)/6)/h(i-1)+...
        (t-X(i-1))*(Y(i)-h(i-1)^2*M(i)/6)/h(i-1);
end
f=simplify(f);
disp(f)
t=X(i):0.01:X(n);
z=eval(f(1)).*(X(1))<=t&t<X(2);
for i=2:n-1
    z=z+eval(f(1)).*(X(i))<=t&t<X(i+1);
end
plot(t,z,'r',x,y,'*');
end

