% % %�ó����Ǵ�ز���ѧ�߳��쳣��ͼ�λ���
%  data=importdata('�߳��쳣.txt');
% %����һ����������ĸ߳��쳣ֱ�۾���
% high=zeros(10,13);
% for i=1:130
%     if(rem(i,13)==0)
%         high((11-floor(i/13)),(rem(i,13)+13))=data(i,3);
%     else
%    high((10-floor(i/13)),rem(i,13))=data(i,3);
%     end
% end
% h = heatmap(high);
data=importdata('�߳��쳣.txt');
xlswrite('�߳��쳣.xls', data);