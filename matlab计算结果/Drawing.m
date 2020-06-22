% % %该程序是大地测量学高程异常的图形绘制
%  data=importdata('高程异常.txt');
% %构建一个江苏整体的高程异常直观矩阵
% high=zeros(10,13);
% for i=1:130
%     if(rem(i,13)==0)
%         high((11-floor(i/13)),(rem(i,13)+13))=data(i,3);
%     else
%    high((10-floor(i/13)),rem(i,13))=data(i,3);
%     end
% end
% h = heatmap(high);
data=importdata('高程异常.txt');
xlswrite('高程异常.xls', data);