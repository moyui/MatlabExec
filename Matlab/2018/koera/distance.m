function [d] = distance(a,b);%//��a,b�����ľ���
a=a*pi/180;%ת��Ϊ����
b=b*pi/180;
d=6371*acos(cos(a(1)-b(1))*cos(a(2))*cos(b(2))+sin(a(2))*sin(b(2)));