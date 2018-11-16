function[s,b]=creationbruit(f,fe)
A=sqrt(2)*10^(1/4) 
te=1/fe ;
t=[0:te:2] ;
s=A*sin(2*pi*f*t) ;

b=randn(size(s)) ;
b=(b-mean(b))/std(b) ;
sb = s + b ;
plot(t,sb,t,s,t,b) 
E=0;
for n=1:length(s)
    E=E+s(n)^2;
end
%2 : E=sum(x.^2)
%3 : x*x'
%4 : norm(x)^2

m=0;
for n=1:length(s)
    m=m+s(m);
end
m=m/length(s);

%m=sum(sb)/length(sb)





