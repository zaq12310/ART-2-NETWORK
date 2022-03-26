%导入数据集

raw=readcell('数据.xlsx');
a=size(raw);

%每一行都代表一个样本
%样本特征有：duration，protocol_type,service,flag,src_bytes,dst_bytes
%提取两种类型的数据作为样本点
%第一种类型为字符型
%第二种类型为数值型


    %数值型
    x1=raw(:,1);
    x1=cell2mat(x1);
    x1=de2bi(x1,'left-msb');
    x5=raw(:,5);
    x5=cell2mat(x5);
    x5=de2bi(x5,'left-msb');
    x6=raw(:,6);
    x6=cell2mat(x6);
    x6=de2bi(x6,'left-msb');

    %字符型
    x2=zeros(a(1),1);
    x3=zeros(a(1),6);
    x4=zeros(a(1),4);
    x7=zeros(a(1),3);
    for i=1:a(1)
        a2=raw{i,2};
        if strcmp('tcp',a2)==1
            x2(i,1)=0;
        elseif strcmp('icmp',a2)==1
            x2(i,1)=1;
        end
        a3=raw{i,3};
        x3(i,:)=a3_x3(a3);
        a4=raw{i,4};
        x4(i,:)=a4_x4(a4);
        a7=raw{i,7};
        x7(i,:)=a7_x7(a7);
    end
    
%     x7=x7/max(x7);
    X=[x1 x2 x3 x4 x5 x6 x7];
    %这六种情况各取10个
%   normal’,,’ ipsweep’,’
% buffer_overflow’, ‘guess_passwd’,’ portsweep’,’ smurf’
% 分别为0,1，2，3，4，5在第7列

%随机取10个
X1=X (randi (a(1),1,5),:);

% data是原始数据，
% randi (a,1,b)是从data数据库的前a行抽 取 b行的 随机 样本，
% 并保存在Need Data数据库中。


    save 'data.mat' X1

    
