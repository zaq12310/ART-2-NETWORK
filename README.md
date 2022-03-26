# ART-2-NETWORK
ART-2神经网络在入侵检测中的应用

第六次作业

运行import_1,导入数据并进行数据预处理（将样本矩阵转化为0-1矩阵

抽取5个样本点来进行识别，样本点存储在data.mat中的X1矩阵中

其中X1矩阵的最后三列代表为样本点的标签特征，

![image](https://user-images.githubusercontent.com/92127845/160222693-df8c9e66-9e1f-42e3-ad45-ac35b4ce509d.png)


设置阈值为0.995

运行exam6.m

normal为相似值

![image](https://user-images.githubusercontent.com/92127845/160222690-64b23fe2-0f10-4d4a-b7a5-c42c32429253.png)

上述两个表格进行比较，可以看出：该神经网络成功的识别出了入侵状态（第1，2，3行）
