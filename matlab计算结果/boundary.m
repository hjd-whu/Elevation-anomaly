%�ó����Ǵ�ز���ѧ�߳��쳣��ҵ
data=importdata('���ո�.txt');
% ʵ�ʵĿ��õ�ֻ��14612��
i=1:14612;
X=data(i,1);
Y=data(i,2);
% ʡ��Ļ�ͼ
plot(X ,Y);
north=0;%���棬��ֵ
south=1000;%���棬Сֵ
west=1000;%��ߣ�Сֵ
east=0;%�ұߣ���ֵ
%Ѱ�ҵ�ͼ�ı߽�Ӧ��������
for i=1:14612
    X=data(i,1);
    Y=data(i,2);
   if(X<west)
       west=X;
   end
   if(X>east)
       east=X;
   end
   if(Y<south)
       south=Y;
   end
   if(Y>north)
       north=Y;
   end
end
%���������������յľ���,m��������n���������������0.5
m=0;
n=0;
% �����������Ӧ���м��м��еĲ��֣�����Ϳ���ע�͵�
% for i=1:1000
%     if(west<east)
%     west=west+0.5;
%     n=n+1;
%     end
%     
%     if(south<north)
%     south=south+0.5;
%     m=m+1;
%     end
% end
Result=zeros(130,2);
for i=1:130
    Result(i,1)=west+0.5*(rem(i,13)-1);
    Result(i,2)=south+0.5*(floor(i/13));
       if(rem(i,13)==0)
        Result(i,1)=west+0.5*12;
        Result(i,2)=south+0.5*(floor(i/13)-1);
       end
end
xlswrite('�߳��쳣.xls', Result);