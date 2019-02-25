function [] =TrapInt (f,a,b,n)
h=(b-a)/n;
Int = f(a)+f(b);
for i=1:n-1
    x=a+i*h;
    Int=Int+2*f(x);
end
I=(h/2)*Int;
fprintf('Integration of the given function in interval (a,b) is \n ');
disp(I)
end

