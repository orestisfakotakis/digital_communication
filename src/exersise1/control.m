function [] = control(x)
N=10000;
p = 4:8;
NA = 1:3;
yoliko=0;
TetraSfalm =zeros(5,3);
ya=zeros(N,1);
y_a=zeros(N,1);
yb=zeros(N,1);
y_b=zeros(N,1);
yc=zeros(N,1);
y_c=zeros(N,1);
yd=zeros(N,1);
y_d=zeros(N,1);
ye=zeros(N,1);
y_e=zeros(N,1);
yf=zeros(N,1);
y_f=zeros(N,1);
[ya,y_a]=main(x,5,1);
[yb,y_b]=main(x,5,2);
[yc,y_c]=main(x,5,3);
[yd,y_d]=main(x,7,1);
[ye,y_e]=main(x,7,2);
[yf,y_f]=main(x,7,3);
[ys,y_s]=main(x,8,1);
[yt,y_t]=main(x,8,2);
[yk,y_k]=main(x,8,3);
[yq,y_q]=main(x,4,1);
[yw,y_w]=main(x,4,2);
[yn,y_n]=main(x,4,3);
for i = 1:5
 for j = 1:3
 [y,y_]= main(x,p(i),NA(j));
 TetraSfalm(i,j) = Meso(y);
 end
end

 l=[1:3];

plot(l,TetraSfalm(1,:),'b.-', l,TetraSfalm(2,:),'r.-',
l,TetraSfalm(3,:),'k.-', l,TetraSfalm(4,:),'g.-', l,TetraSfalm(5,:),'c.-')
%B erotima
l=[1:10000];
subplot(6,2,1);
plot(l,x,'b.-',l,ya,'g.-')
legend('x','y(p=5,N=1)')
subplot(6,2,2);
plot(l,x,'b.-',l,yd,'g.-')
legend('x','y(p=7,N=1)')
subplot(6,2,3);
plot(l,x,'b.-',l,yb,'g.-')
legend('x','y(p=5,N=2)')
subplot(6,2,4);
plot(l,x,'b.-',l,ye,'g.-')
legend('x','y(p=7,N=2)')
subplot(6,2,5);
plot(l,x,'b.-',l,yc,'g.-')
legend('x','y(p=5,N=3)')
subplot(6,2,6);
plot(l,x,'b.-',l,yf,'g.-')
legend('x','y(p=7,N=3)')
%D erothma
%apeikonisi x,y'kapelo
subplot(6,2,7);
plot(l,x,'b.-',l,y_q,'r.-')
legend('x','y_hat(p=4,N=1)')
subplot(6,2,8);
plot(l,x,'b.-',l,y_w,'r.-')
legend('x','y_hat(p=4,N=2)')
subplot(6,2,9);
plot(l,x,'b.-',l,y_n,'r.-')
legend('x','y_hat(p=4,N=3)')
subplot(6,2,10);
plot(l,x,'b.-',l,y_s,'r.-')
legend('x','y_hat(p=8,N=1)')
subplot(6,2,11);
plot(l,x,'b.-',l,y_t,'r.-')
legend('x','y_hat(p=8,N=2)')
subplot(6,2,12);
plot(l,x,'b.-',l,y_k,'r.-')
legend('x','y_hat(p=8,N=3)')
end
KΩΔΙΚΕΣ MATLA