function [] = Simps13(f,a,b,n)
h=(b-a)/n;
Int=f(a)+f(b);
for i=1:n-1
    x=a+i*h;
    if mod(i,2)==0
        Int=Int+2*f(x);
    else
        Int=Int+4*f(x);
    end
end
I=(h/3)*Int;
fprintf('Integration of the given function in interval (a,b) is \n');
disp (I)
end

