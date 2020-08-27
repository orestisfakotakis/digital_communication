function [yhat]=quantizer(x,N,maxvalue,minvalue)
L=2^N;
D=((maxvalue - minvalue) / L);
akra=zeros(L,1);
center=zeros(L,1);
yhat=zeros(length(x),1);
for i=1:length(x)
 if x(i)<= minvalue
 yhat(i)=minvalue;
 elseif x(i) >= maxvalue
 yhat(i) = maxvalue;
 end
end
for i=1:L+1
 akra(i)=minvalue+(i-1)*D;
end
center(1)=minvalue+(D/2);
for i=2:L
 center(i)=center(i-1)+ D;
end
for i = 1:length(x)
 for t= 1 : L
 if ((x(i)<akra(t+1) && x(i) >= akra(t)))
 yhat(i)= center(t);
 end
 end
end