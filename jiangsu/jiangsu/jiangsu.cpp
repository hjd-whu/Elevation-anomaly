#include <iostream>
#include<sstream>
#include<fstream>
using namespace std;

int main()
{
	//这一部分是用来读取文件，放入有用信息的部分
	//放入文件地址，用来读取文件
	string fileName = "D:/学习要紧/大地测量学/大地测量学作业/第五次作业，高程异常/江苏改.txt";
	fstream file;
	file.open(fileName);
	//如果没有找到文件，则显示文件打开失败
	if (!file)
	{
		cout << "文件地址错误，打开失败！" << endl;
		return false;
	}
	string BL;//临时存储数据的每一行
	istringstream str;
	double X[14612];//用于存储可用的14612个经度
	double Y[14612];//用于存储可用的14612个经度
	for (int i = 0; i < 14612; i++)
	{
		getline(file, BL);
		str = istringstream(BL);
		str >> X[i] >> Y[i];
	}
	file.close();//关闭文件流


	//下一个部分开始寻找可以囊括所有点的最小矩形的情况
	double north = 0;//上面，大值
	double south = 1000;//下面，小值
	double west = 1000;//左边，小值
	double east = 0;//右边，大值
	//寻找地图边界
	for (int j = 0; j < 14612; j++)
	{
		if (X[j] < west)
			west = X[j];
		if (X[j] > east)
			east = X[j];
		if (Y[j] < south)
			south = Y[j];
		if (Y[j] > north)
			north = Y[j];
	}

	//这里的部分是用来寻找应该分割成多大
	//循环开始
	int Row = 0;
	int Column = 0;
	for(int i=0;i<1000;i++)//给定的一个比较大的值，因为行数列数一定小于这个数
	{
		if (west < east)
		{
			west = west + 0.5;
			Column = Column + 1;
		}
		if(south<north)
		{
			south = south + 0.5;
			Row = Row + 1;
		}
	}

	//最后的赋值输出阶段
	double Result[130][2];
	for (int i = 0; i < 130; i++)//循环130次，每一次放进一个点
	{
		Result[i][0] = west + 0.5 * (i % 13 );
		Result[i][1] = south + 0.5 * (int(i / 13) );
	}
	//输出文件
	ofstream file_result;
	//创建输出文件地址
	file_result.open("D:/学习要紧/大地测量学/大地测量学作业/第五次作业，高程异常/new_result.txt");//自行修改文件路径
	for (int i = 0; i < 130; i++)
	{
		file_result.flags(ios::fixed);
		file_result.precision(6);//设置保留小数位数
		file_result << Result[i][0] << "\t" << Result[i][1] << "\n";
	}
	//关闭输出文件流
	file_result.close();
	return 0;
}