clc,clear
a0=load('economy.txt');
a=a0';b0=a(:,[1:7]);dd0=a(:,[8:end]);
[b,ps]=mapstd(b0);%�ѷ������ݱ�׼��
dd=mapstd('apply',dd0,ps);%���������ݱ�׼��
group=[1 2 2 2 2 1 2];%��֪�����ı�׼��
s=svmtrain(b',group);%ѵ��֧��������
sv_index=s.SupportVectorIndices%����֧�������ı��
beta=s.Alpha%����֧��������Ȩϵ��
bb=s.Bias%���ط���ϵ���ĳ�����
mean_and_std_trans=s.ScaleData %��һ�з�����֪�������ֵ�������෴�����ڶ��з��ص��Ǳ�׼������ĵ���
check=svmclassify(s,b')%��֤��֪������Ĵ�����
solution=svmclassify(s,dd')%�Դ�����������з���
