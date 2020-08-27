function [meso ] = Meso(y)
meso=0;
yoliko=0;
for n=1:10000
 yoliko= yoliko+y(n)^2;
end
meso=yoliko/10000;
end
