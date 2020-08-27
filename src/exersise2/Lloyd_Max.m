    function [xq,centers,D]=Lloyd_Max(x,N,min_value,max_value)

    [xq,centers]=my_quantizer(x,N,min_value,max_value);
    T=zeros(1,length(centers));
    M=length(centers);
    e=10^(-5);
    


    i=1;
    D(i)=(centers(1)-centers(M))/M;

    while(1)
    i=i+1;
            T=(centers(1:M-1)+centers(2:M))/2; 
            D(i)=mean((x-centers(xq)').^2);
            for k=2:M-1
                 I=sum((x<T(k-1)).*(x>=T(k)).*x); 
                 n=sum((x<T(k-1)).*(x>=T(k)));
                 
                 if (n==0 )
                     centers(k)=(T(k-1)+T(k))/2;
                 else
                     centers(k)=I/n;    
                 end
            end

            xq=xq*0;
            for k=2:M-1
            xq=xq+(x<T(k-1)).*(x>=T(k)).*k;
            

            end
            xq=xq+(x>=T(1));
            xq=xq+(x<=T(M-1))*M;
                 
            if (abs(D(i)-D(i-1))<e) 
                break;
            end
            
    end    
            
            