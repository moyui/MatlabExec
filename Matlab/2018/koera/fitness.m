function[y,point] = fitness(x,e);%��Ӧ�Ⱥ���
for i=1:length(x)
    tempd=10^6;%��ʱ������
    arX=0;arY=0;dr=0;pointX=0;pointY=0;citypoint=1;
    for j=1:length(e)
        d= distance(x{1,i},e{1,j});
        if (d <= tempd)%����㵽������еľ���
            tempd=d;
            pointX=e{1,j}(1,1);
            pointY=e{1,j}(1,2);
            citypoint=j;
        end
    end
    y(i)=tempd;
    point{i}=[pointX pointY citypoint];%�������������ĸ��㣿
end

