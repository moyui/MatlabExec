%���²����ǵõ���������
cd = 112;%����destnation�Ľڵ���
rd = 69;%���destionation�Ľڵ���
rs = 85;%���supercharge�Ľڵ���
xv=[126.91 126.65 126.50 126.11 126.45 126.65 126.87 127.12 127.61 127.49 127.33 127.27 126.91];%�����Χ�㾭��ֵ(ע����β����)
yv=[36.92 37.25 37.05 36.71 36.58 36.00 36.13 36.03 36.01 36.34 36.43 36.65 36.92];%�����Χ��γ��ֵ(ͬ��)
%�����Ǹ������У�ũ�壬�е�����ע��ũ�����е�Ҫһһ��Ӧ
city={[127.23 36.21],[127.06 36.51],[127.00 36.47],[126.6 36.53],[127.08 36.27],[127.05 36.11],[126.6 36.19]};
rural={[126.4 36.30],[126.53 36.17],[126.61 36.04],[126.65 36.31],[126.50 36.42],[127.64 36.13]};
middle={[126.67 36.28],[127.02 36.13],[126.6 36.12],[126.66 36.36],[126.8 36.23],[127.18 36.19]};
showCX=[127.23 127.06 127.00 126.6 127.08 127.05 126.6];
showCY=[36.21 36.51 36.47 36.53 36.27 36.11 36.19];
showRX=[126.6 126.53 126.61 126.65 126.50 127.64];
showRY=[36.30 36.17 36.04 36.31 36.42 36.13];
%-----------
es = 126.11;%��������ߵ�ľ���
ed = 127.61;%�������ұߵ�ľ���
ns = 36.00;%�������±ߵ��γ��
nd = 37.25;%������������γ��

%-----------��������������QAQ
c1=2;c2=2;%ѧϰ����
w=0.4;%����Ȩֵ
vmaxX=0.1;vmaxY=0.1;%�ٶȳ�ʼ��
max=8;%��������

%���²������Բ���ȥ��
xcd=cell(1,cd);xrd=cell(1,rd);xrs=cell(1,rs);%����Ԫ������
ycd=[];yrd=[];yrs=[];%��ֵ�б�
pbestcd=[];pbestrd=[];pbestrs=[];%�������Ž�
vcdX=[];vrdX=[];vrsX=[];%����ٶ�
vcdY=[];vrdY=[];vrsY=[];
tempdistance=[];
drawcdX=[];drawrdX=[];drawrsX=[];
drawcdY=[];drawrdY=[];drawrsY=[];

%���½��г�ʼ��
%��ʼ������
%rand('state',sum(clock));%�����������
for i=1:cd %���ɳ���dest������ٶ�
    while(1)
        tempX=0;tempY=0;
        tempX = randi([es*100,ed*100],1,1)/100;%�����������
        tempY = randi([ns*100,nd*100],1,1)/100;%�������γ��
        in=inpolygon(tempX,tempY,xv,yv);%���ɵ��Ƿ�������
        if (in == 1)%��������
            xcd{1,i} = [tempX tempY];
            break;
        end
    end
    vcdX(i)=rand()/10;
    vcdY(i)=rand()/10;
end

for i=1:rd %����ũ��dest������ٶ�
    while(1)
        tempX=0;tempY=0;
        tempX = randi([es*100,ed*100],1,1)/100;%�����������
        tempY = randi([ns*100,nd*100],1,1)/100;%�������γ��
        in=inpolygon(tempX,tempY,xv,yv);%���ɵ��Ƿ�������
        if (in == 1)%��������
            xrd{1,i} = [tempX tempY];
            break;
        end
    end
    vrdX(i)=rand()/10;
    vrdY(i)=rand()/10;
end

for i=1:rs %����ũ��super������ٶ�
    while(1)
        tempX=0;tempY=0;
        tempX = randi([es*100,ed*100],1,1)/100;%�����������
        tempY = randi([ns*100,nd*100],1,1)/100;%�������γ��
        in=inpolygon(tempX,tempY,xv,yv);%���ɵ��Ƿ�������
        if (in == 1)%��������
            xrs{1,i} = [tempX tempY];
            break;
        end
    end
    vrsX(i)=rand()/10;
    vrsY(i)=rand()/10;
end

%������Ӧ�Ⱥ���,�����ֱ�߾���,���Ⱦ��룬γ�Ⱦ���,�����������
[ycd,necity]=fitness(xcd,city);
[yrd,nerural]=fitness(xrd,rural);
[yrs,nemiddle]=fitness(xrs,middle);
%��ʼ����ǰ���弫ֵ�����ҵ�Ⱥ�弫ֵ
for i=1:cd
   pbestcd(i)=ycd(i);
end
citynearPoint={};
for i=1:length(city)
    tempNumber=10^6;
    for j=1:cd
       if((city{1,i}(1,1)==necity{1,j}(1,1))&&(city{1,i}(1,2)==necity{1,j}(1,2)))
           if(pbestcd(j)<tempNumber)
               citynearPoint{1,i}=xcd{1,j}; %�ҵ�����ó�������ĵ�,˳�㱣��ڼ��������
               tempNumber=pbestcd(j);
           end
       end
    end
    if (tempNumber==10^6)%û�з��ָõ�
        citynearPoint{1,i}=0;%���е���ó��ж���Զ
    end
end
         
for i=1:rd
   pbestrd(i)=yrd(i);
end
ruralnearPoint={};
for i=1:length(rural)
    tempNumber=10^6;
    for j=1:rd
       if((rural{1,i}(1,1)==nerural{1,j}(1,1))&&(rural{1,i}(1,2)==nerural{1,j}(1,2)))
           if(pbestrd(j)<tempNumber)
               ruralnearPoint{1,i}=xrd{1,j}; %�ҵ������ũ������ĵ�
               tempNumber=pbestrd(j);
           end
       end
    end
    if (tempNumber==10^6)%û�з��ָõ�
        ruralnearPoint{1,i}=0;%���е����ũ�嶼��Զ
    end
end

for i=1:rs
   pbestrs(i)=yrs(i);;
end
middlenearPoint={};
for i=1:length(middle)
    tempNumber=10^6;
    for j=1:rs
       if((middle{1,i}(1,1)==nemiddle{1,j}(1,1))&&(middle{1,i}(1,2)==nemiddle{1,j}(1,2)))
           if(pbestrs(j)<tempNumber)
               middlenearPoint{1,i}=xrs{1,j}; %�ҵ������ũ������ĵ�
               tempNumber=pbestrs(j);
           end
       end
    end
    if (tempNumber==10^6)%û�з��ָõ�
        middlenearPoint{1,i}=0;%���е����ũ�嶼��Զ
    end
end

% ��ʼ�����
% ��������Ⱥ�㷨
for i=1:max
    for j=1:cd
        %����λ�����ٶȣ����÷�������ʽ��ͬʱ���¾�����γ��
        gbestcd=citynearPoint{1,necity{1,j}(1,3)};
        vcdX(j)=w*vcdX(j)+c1*rand()*(necity{1,j}(1,1)-xcd{1,j}(1,1))+c2*rand()*(gbestcd(1)-xcd{1,j}(1,1));
        vcdY(j)=w*vcdY(j)+c1*rand()*(necity{1,j}(1,2)-xcd{1,j}(1,2))+c2*rand()*(gbestcd(2)-xcd{1,j}(1,2));
        if (vcdX(j)>vmaxX) 
            vcdX(j)=vmaxX;
        end
        if (vcdX(j)>vmaxX) 
            vcdX(j)=vmaxX;
        end
            xcd{1,j}=[xcd{1,j}(1,1)+vcdX(j) xcd{1,j}(1,2)+vcdY(j)];
        %Խ���ж�
         in=inpolygon(xcd{1,j}(1,1),xcd{1,j}(1,2),xv,yv);%���ɵ��Ƿ�������
         if (in == 0) %Խ����
             point=1;value=0;
             for k=1:length(xv)
                 tempdistance(k)=distance(xcd{1,j},[xv(k) yv(k)]);
             end
             [value, point]=min(tempdistance);
             xcd{1,j}=[xv(point) yv(point)];           
         end 
    end
         [ycd,necity]=fitness(xcd,city);
         %���¸�����Ⱥ�弫ֵ
         for l=1:cd
             if (ycd(l)>pbestcd(l))
                 pbestcd(l)=ycd(l);
             end
         end
         for m=1:length(city)
            tempNumber=10^6;
            for n=1:cd
                if((city{1,m}(1,1)==necity{1,n}(1,1))&&(city{1,m}(1,2)==necity{1,n}(1,2)))
                    if(pbestcd(n)<tempNumber)
                        citynearPoint{1,m}=xcd{1,n}; %�ҵ�����ó�������ĵ�,˳�㱣��ڼ��������
                        tempNumber=pbestcd(n);
                    end
                end
            end
            if (tempNumber==10^6)%û�з��ָõ�
                citynearPoint{1,m}=0;%���е���ó��ж���Զ
            end
         end
end
         for k=1:cd
            drawcdX(k)=xcd{1,k}(1,1);
            drawcdY(k)=xcd{1,k}(1,2);
         end

for i=1:max
    for j=1:rd
        %����λ�����ٶȣ����÷�������ʽ��ͬʱ���¾�����γ��
        gbestrd=ruralnearPoint{1,nerural{1,j}(1,3)};
        vrdX(j)=w*vrdX(j)+c1*rand()*(nerural{1,j}(1,1)-xrd{1,j}(1,1))+c2*rand()*(gbestrd(1)-xrd{1,j}(1,1));
        vrdY(j)=w*vrdY(j)+c1*rand()*(nerural{1,j}(1,2)-xrd{1,j}(1,2))+c2*rand()*(gbestrd(2)-xrd{1,j}(1,2));
        if (vrdX(j)>vmaxX) 
            vrdX(j)=vmaxX;
        end
        if (vrdX(j)>vmaxX) 
            vrdX(j)=vmaxX;
        end
            xrd{1,j}=[xrd{1,j}(1,1)+vrdX(j) xrd{1,j}(1,2)+vrdY(j)];
        %Խ���ж�
         in=inpolygon(xrd{1,j}(1,1),xrd{1,j}(1,2),xv,yv);%���ɵ��Ƿ�������
         if (in == 0) %Խ����
             point=1;value=0;
             for k=1:length(xv)
                 tempdistance(k)=distance(xrd{1,j},[xv(k) yv(k)]);
             end
             [value, point]=min(tempdistance);
             xrd{1,j}=[xv(point) yv(point)];           
         end    
    end
         [yrd,nerural]=fitness(xrd,rural);
         %���¸�����Ⱥ�弫ֵ
         for l=1:rd
             if (yrd(l)>pbestrd(l))
                 pbestrd(l)=yrd(l);
             end
         end
         for m=1:length(rural)
            tempNumber=10^6;
            for n=1:rd
                if((rural{1,m}(1,1)==nerural{1,n}(1,1))&&(rural{1,m}(1,2)==nerural{1,n}(1,2)))
                    if(pbestrd(n)<tempNumber)
                        ruralnearPoint{1,m}=xrd{1,n}; %�ҵ�����ó�������ĵ�,˳�㱣��ڼ��������
                        tempNumber=pbestrd(n);
                    end
                end
            end
            if (tempNumber==10^6)%û�з��ָõ�
                ruralnearPoint{1,m}=0;%���е���ó��ж���Զ
            end
         end
end
         for k=1:rd
            drawrdX(k)=xrd{1,k}(1,1);
            drawrdY(k)=xrd{1,k}(1,2);
         end

for i=1:max
    for j=1:rs
        %����λ�����ٶȣ����÷�������ʽ��ͬʱ���¾�����γ��
        gbestrs=middlenearPoint{1,nemiddle{1,j}(1,3)};
        vrsX(j)=w*vrsX(j)+c1*rand()*(nemiddle{1,j}(1,1)-xrs{1,j}(1,1))+c2*rand()*(gbestrs(1)-xrs{1,j}(1,1));
        vrsY(j)=w*vrsY(j)+c1*rand()*(nemiddle{1,j}(1,2)-xrs{1,j}(1,2))+c2*rand()*(gbestrs(2)-xrs{1,j}(1,2));
        if (vrsX(j)>vmaxX) 
            vrsX(j)=vmaxX;
        end
        if (vrsX(j)>vmaxX) 
            vrsX(j)=vmaxX;
        end
            xrs{1,j}=[xrs{1,j}(1,1)+vrsX(j) xrs{1,j}(1,2)+vrsY(j)];
        %Խ���ж�
         in=inpolygon(xrs{1,j}(1,1),xrs{1,j}(1,2),xv,yv);%���ɵ��Ƿ�������
         if (in == 0) %Խ����
             point=1;value=0;
             for k=1:length(xv)
                 tempdistance(k)=distance(xrs{1,j},[xv(k) yv(k)]);
             end
             [value, point]=min(tempdistance);
             xrs{1,j}=[xv(point) yv(point)];           
         end    
    end
         [yrs,nemiddle]=fitness(xrs,middle);
         %���¸�����Ⱥ�弫ֵ
         for l=1:rs
             if (yrs(l)>pbestrs(l))
                 pbestrs(l)=yrs(l);
             end
         end
         for m=1:length(middle)
            tempNumber=10^6;
            for n=1:rs
                if((middle{1,m}(1,1)==nemiddle{1,n}(1,1))&&(middle{1,m}(1,2)==nemiddle{1,n}(1,2)))
                    if(pbestrs(n)<tempNumber)
                        middlenearPoint{1,m}=xrs{1,n}; %�ҵ�����ó�������ĵ�,˳�㱣��ڼ��������
                        tempNumber=pbestrs(n);
                    end
                end
            end
            if (tempNumber==10^6)%û�з��ָõ�
                middlenearPoint{1,m}=0;%���е���ó��ж���Զ
            end
         end
end
         for k=1:rs
            drawrsX(k)=xrs{1,k}(1,1);
            drawrsY(k)=xrs{1,k}(1,2);
         end

plot(xv,yv,'r',drawcdX,drawcdY,'*r',drawrdX,drawrdY,'*g',drawrsX,drawrsY,'*b',showCX,showCY,'or',showRX,showRY,'og');


