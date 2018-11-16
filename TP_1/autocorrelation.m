function[]=autocorrelation()
f0=20;fe=100;te=1/fe;
A=1;
te=1/fe ;
t=[0:te:10] ;
x=A*sin(2*pi*f0*t) ;
figure(1);plot(t,x);
maxlag=30;
[tx,lag]=xcorr(x,'unbiased',maxlag);
lag=-maxlag:maxlag
plot(lag,tx)
b=randn(size(x)) ;
b=(b-mean(b))/std(b) ;
b=b*sqrt(7);
xb = x + b ;
[txb,lag]=xcorr(xb,'unbiased',maxlag);
plot(lag,txb,lag,tx) ;



