function [y,y_hat]=main(x,p,NA)
N=10000;
y_=zeros(N,1);
y=zeros(N,1);
y_hat=zeros(N,1);
yhat=zeros(N,1);
a=forecast(x,p);
aq=quantizer(a,8,2,-2);
aq
for n=1:p
 y(n)=x(n);
 yhat(n)=quantizer(y(n),NA,3,-3);
 y_hat(n)=yhat(n);
end
for n=p+1:N
 for i=1:p
 y_(n)=aq(i)*y_hat(n-i)+y_(n);
 end
 y(n)=x(n)-y_(n);
 yhat(n)=quantizer(y(n),NA,3,-3);
 y_hat(n)=y_(n)+yhat(n);
end
l=[1:10000];
plot(l,x,'b.-',l,y_hat,'r.-')
end