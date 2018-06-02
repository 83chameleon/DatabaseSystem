#include<iostream>
#include<fstream>
#include<string>
#include<tuple>
#include "CBTree.h"

#define fileTest "testData.txt"
#define fileResult "result.txt"
#define maxRecord 100
#define maxLine 5
#define min -1
#define max 10

using namespace std;

struct record {
	int num;
	string str;
};

int loserTree[maxLine];
record *re = new record[maxLine];

void createFile() {
	fstream file;
	file.open(fileTest, ios::out | ios::trunc | ios::binary);
	srand(0);

	//生成随机数据

	int list[maxRecord];
	for (int i = 0; i < maxRecord; i++) {
		list[i] = i;
	}
	for (int i = maxRecord - 1; i >= 0; i--) {
		swap(list[i], list[rand() % maxRecord]);
	}

	//写入随机数据
	string str;
	for (int i = 0; i < maxRecord; i++) {
		str = "第" + to_string(i) + "条记录baba";
		file << list[i] << "\t" << str.substr(0, 12) << endl;
	}
	file.close();
}

void quickSort(record records[], int left, int right) {
	if (left >= right)
		return;
	int low = left, high = right, key = records[left].num;
	string keyStr = records[left].str;
	while (low < high) {
		while (low < high && records[high].num >= key)
			high--;
		records[low].num = records[high].num;
		records[low].str = records[high].str;
		while (low < high && records[low].num <= key)
			low++;
		records[high].num = records[low].num;
		records[high].str = records[low].str;

	}
	records[low].num = key;
	records[low].str = keyStr;
	quickSort(records, left, low - 1);
	quickSort(records, low + 1, right);
}

void groupSort() {
	fstream file, fileLine;
	record *records = new record[maxRecord/maxLine];
	string filePart;
	file.open(fileTest, ios::in | ios::binary);
	for (int i = 0; i < maxLine; i++) {

		//读入数据
		filePart = "filePart" + to_string(i) + ".txt";
		for (int j = i*(maxRecord / maxLine); j < (i + 1)*(maxRecord / maxLine); j++) {
			file >> records[j % (maxRecord / maxLine)].num >> records[j % (maxRecord / maxLine)].str;
		}

		//分组排序
		quickSort(records, 0, maxRecord / maxLine - 1);

		//写入小文件
		fileLine.open(filePart, ios::out | ios::binary);
		for (int j = 0; j < maxRecord / maxLine; j++) {
			fileLine << records[j].num << "\t" << records[j].str << endl;
		}
		fileLine.close();
	}
	file.close();
}

//调整败者树
void adjust(int child) {
	int father = (child + maxLine) / 2, temp;
	while (father > 0) {
		if (re[child].num > re[loserTree[father]].num) {
			temp = child;
			child = loserTree[father];
			loserTree[father] = temp;
		}
		father /= 2;
	}
	loserTree[0] = child;
}

//创建败者树
void createLoserTree() {
	for (int i = 0; i < maxLine; i++) {
		loserTree[i] = maxLine;
	}
	for (int i = maxLine - 1; i >= 0; i--) {
		adjust(i);
	}
}

void mergeSort() {
	fstream file, fileLine[maxLine];
	string filePart;
	file.open(fileResult, ios::out);
	for (int i = 0; i < maxLine; i++) {
		filePart = "filePart" + to_string(i) + ".txt";
		fileLine[i].open(filePart, ios::in | ios::binary);
	}

	//初始读入数据
	for (int i = 0; i < maxLine; i++) {
		fileLine[i] >> re[i].num >> re[i].str;
	}

	//利用败者树进行归并排序
	createLoserTree();
	while (re[loserTree[0]].num < maxRecord) {
		file << re[loserTree[0]].num << "\t" << re[loserTree[0]].str << endl;
		fileLine[loserTree[0]] >> re[loserTree[0]].num >> re[loserTree[0]].str;
		if (fileLine[loserTree[0]].eof()) {
			re[loserTree[0]].num = maxRecord;
		}
		adjust(loserTree[0]);
	}

	for (int i = 0; i < maxLine; i++) {
		fileLine[i].close();
	}
	file.close();
}

int main() {
	createFile();
	groupSort();
	mergeSort();
	cout << "--------多路排序完成--------";
	getchar();


	//创建B树索引
	fstream file;
	file.open(fileResult, ios::in | ios::out | ios::binary);
	CBTree<int, int> bTree;
	int num, position;
	string str;
	for (int i = 0; i < maxRecord; i++) {

		position = file.tellg();
		file >> num >> str;
		bTree.insert(num, position);
	}

	//展示B树索引
	bTree.display();

	//查询B树索引
	cout << "--------查找A = 5的记录--------" << endl;
	int searchA = 5;
	if (bTree.contain(searchA)) {
		file.seekg(bTree.getposition());
		file >> num >> str;
		cout << num << "\t" << str << endl;
	}
	else {
		cout << "无记录" << endl;
	}

	//B树索引删除
	cout << "--------删除索引 A = 5的记录--------" << endl;
	int deleteA = 5;
	string deleteB = "假的记录lalalala";
	if (bTree.contain(deleteA)) {
		file.seekp(bTree.getposition());
		int pos = file.tellp();
		file >> num >> str;
		file.seekp(pos);
		file << endl << -1 << "\t" << deleteB.substr(0, 12);
		bTree.remove(deleteA);
		bTree.display();
	}
	else {
		cout << "无记录" << endl;
	}

	//B树索引插入
	cout << "--------插入索引 A = 5, B = '插入测试babababa' 的记录--------" << endl;
	int insertA = 5;
	string insertB = "插入测试babababa";
	if (!bTree.contain(insertA)) {
		file.seekp(0, ios::end);
		bTree.insert(insertA, file.tellp());
		file << insertA << "\t" << insertB.substr(0, 12);
		bTree.display();
	}
	else {
		cout << "该记录已存在" << endl;
	}

	//查询B树索引
	cout << "--------查找A = 5的记录--------" << endl;
	searchA = 5;
	if (bTree.contain(searchA)) {
		file.seekg(bTree.getposition());
		file >> num >> str;
		cout << num << "\t" << str << endl;
	}
	else {
		cout << "无记录" << endl;
	}

	file.close();
	getchar();
	return 0;
}