clc,clear
a=textread('carcent.txt');
x=a(:,2);
x=nonzeros(x);
t=[2016 2017 2020 2030 2060]';
t0=t(1);x0=x(1);
fun=@(cs,td)cs(1)./(1+((cs(1)/x0)-1)*exp(-cs(2)*(td-t0)));%cs(1)=xm,cs(2)=r;
cs=lsqcurvefit(fun,rand(2,1),t(2:end),x(2:end),zeros(2,1))
tw=[2016:1:2050];
xhat=fun(cs,tw);
plot(tw,xhat,'r')
