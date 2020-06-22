%该程序是大地测量学高程异常作业
data=importdata('江苏改.txt');
% 实际的可用点只有14612个
i=1:14612;
X=data(i,1);
Y=data(i,2);
% 省界的画图
plot(X ,Y);
north=0;%上面，大值
south=1000;%下面，小值
west=1000;%左边，小值
east=0;%右边，大值
%寻找地图的边界应该在哪里
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
%构建包括整个江苏的矩阵,m是行数，n是列数，间隔都是0.5
m=0;
n=0;
% 用来计算最后应该有几行几列的部分，用完就可以注释掉
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
xlswrite('高程异常.xls', Result);