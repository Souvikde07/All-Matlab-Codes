function [] =LangPoly(X,Y)
n=length(X);
syms x;
poly=0;
for i=1:n
    LP=1;
    for j=1:n
        if i~=j
            LP=LP*(x-X(j))/(X(i)-X(j));
        end
        poly=poly+(LP*Y(i));
    end
    poly=simplify(poly);
end
fprintf('Required langranges interpolating polynomial is \n');
y=5.5;
eval(poly)
disp(ploy)
plot(X,Y);
end

