clc;
close all;

fm=0.4;
fc=20;
fs=160;
t=0:1/fs:10;
c=cos(2*pi*fc*t);
m=cos(2*pi*fm*t);
y=ammod(m,fc,fs);
subplot(5,1,1);
plot(t,m);
subplot(5,1,2);
plot(t,c);
subplot(5,1,3);
plot(t,y);
vd(1)=0;
for i=2:length(y)
    if y(i)>vd(i-1)
       vd(i)=y(i);
    else 
       vd(i)=vd(i-1)-0.023*vd(i-1);
    end
end

h=fir1(100,0.0125,"low");
fout=filter(h,1,vd);
subplot(5,1,4);
plot(t,fout);
subplot(5,1,5);
plot(t,vd);
