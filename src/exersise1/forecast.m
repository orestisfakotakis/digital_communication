function [a]=forecast(x,p)
r=zeros(p,1);
R=zeros(p,p);
for i=1:p
 for n=p+1:length(x)
 r(i)=x(n)*x(n-i)+r(i);
 end
 r(i)=r(i)*(1/(length(x)-p));
end
for i=1:p
 for j=1:p
 for n=p+1:length(x)+1
 R(i,j)= x(n-i)*x(n-j)+R(i,j);
 end

 R(i,j)= R(i,j)*(1/(length(x)-p+1));
 end
end
a = mldivide(R,r);
end
