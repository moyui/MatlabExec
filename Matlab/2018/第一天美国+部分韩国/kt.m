b=load('ktraffic.txt');
a=[2003 2004 2005 2006 2007 2008 2009 2010 2011];
a=a';
r=[ones(9,1),a.^2];
ab=r\b;
x0=2003:1:2018;
y0=ab(1)+ab(2)*x0.^2;
plot(a,b,'o',x0,y0,'r');
u=ab(1)+ab(2)*2016^2;

