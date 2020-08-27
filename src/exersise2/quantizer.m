function [xq, centers] = my_quantizer(x, N, min_value,max_value)

levels = 2^N;
delta = (max_value-min_value)/(levels);

%vazoume oles tis times mesa sta oria
x2=(x<=min_value)*(min_value+delta/2)+(x>min_value).*(x<max_value).*x...
    +(x>=max_value)*(max_value-delta/2);

%vriskoume ta kentra 
centers = max_value - delta/2-delta*((1:levels)-1);

%vriskoume ta xq 
xq=floor((max_value-x2)/delta)+1;


