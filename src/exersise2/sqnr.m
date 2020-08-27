% πηγή A
[y,fs,Nq]=wavread('speech.wav');
wavplay(y,fs);

min_value=min(y);
max_value=max(y);
 

 
    %κληση  των κβαντιστών
    [xq2, centers2]=Uniformly_quantized(y,2,min_value,max_value);
    [xq4, centers4]=Uniformly_quantized(y,4,min_value,max_value);
    [xq8, centers8]=Uniformly_quantized(y,8,min_value,max_value);
    
    [xq_L2, centers_L2,D2]=Lloyd_Max(y,2,max_value);
    [xq_L4, centers_L4,D4]=Lloyd_Max(y,4,max_value);
    [xq_L8, centers_L8,D8]=Lloyd_Max(y,8,max_value);
    
    %υπολογισμός sqnr 
    SQNR2=mean(y.^2)/mean((y-centers2(xq2)').^2)
    SQNR4=mean(y.^2)/mean((y-centers4(xq4)').^2)
    SQNR8=mean(y.^2)/mean((y-centers8(xq8)').^2)
    SQNR_L2=mean(y.^2)/mean((y-centers_L2(xq_L2)').^2)  
    SQNR_L4=mean(y.^2)/mean((y-centers_L4(xq_L4)').^2)
    SQNR_L8=mean(y.^2)/mean((y-centers_L8(xq_L8)').^2)