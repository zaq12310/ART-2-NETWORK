function [xiu,normal,t_out ]= train(A,m,warn,W,T,normal,xiu,t_out)
%基于ART1改进算法的训练函数

% A为输入样本，每一行代表一个样本数据,
% m代表竞争层神经元个数,
% warn为阈值,
% W为输入层到输出层的内星权值
% T为外星权值,
% normal为相似度,
% xiu为计算分成了几类，使用了哪几个神经元,
% t_out为输出

a_size=size(A);
n=a_size(2);

T_c=zeros(1,a_size(1));

%%
%初始化
%找出竞争获胜点的中间过渡函数
z=zeros(1,n);
q=zeros(1,n);
v=zeros(1,n);
u=zeros(1,n);
p=zeros(1,n);
s=zeros(1,n);

a=1;
b=1;
c=1;
d=1;
e=0.00000000000000000000000000000000000000001;%e是一个比较小的正数
%判断结点信号是否稳定
tao=0.001;
Error=zeros(6,n);
for k=1:a_size(1)

    %%竞争出神经元
    y=zeros(1,m);
    %(3)竞争
    for j=1:m
        y(j)=W(j,:)*p';
    end
    %由于y太小，进行处理
    %     y=exp(y);
    % (4)选择竞争结果
    %并且如果有很多个一样大的，取位置最小的神经元
    count=zeros(1,m);
    for j=1:m
        if y(j)==max(y)
            %             count=j;
            count(j)=j;
        else
            count(j)=m+1;
        end
    end
    %     t=count;
    t=min(count);
    y_d=y;
    %%
    %F2层短期记忆调整
    stop=1;
    while stop==1

        for i=1:n
            %*********(1)
            z(i)=A(k,i)+a*u(i);
            %*********(2)
            q(i)=z(i)/(e+norm(z,2));
            %*********(3)
            v(i)=f(q(i))+b*f(s(i));
            %*********(4)
            u(i)=v(i)/(e+norm(v,2));
            %*********(5)
            p(i)=u(i)+d*W(t,i);
            %*********(6)
            s(i)=p(i)/(e+norm(p,2));
            Error(1,i)=z(i)-(A(k,i)+a*u(i));
            Error(2,i)=q(i)-(z(i)/(e+norm(z,2)));
            Error(3,i)=v(i)-(f(q(i))+b*f(s(i)));
            Error(4,i)=u(i)-(v(i)/(e+norm(v,2)));
            Error(5,i)=p(i)-(u(i)+d*W(t,i));
            Error(6,i)=s(i)-(p(i)/(e+norm(p,2)));

        end
        if Error<tao
            stop=0;
        end

    end
    %(7)
    r=(u+c*p)/(norm(u)+c*norm(p));
    %返回竞争获胜者

    normal_k=norm(r);

    normal(k)=normal_k;
    if normal_k>warn%式子（*）
        %如果成立，转入步骤（7）
        xiu(t)=1;

    else
        %如果不成立，转入步骤（6）
        %取消识别结果
        %并将第t个神经元排除在下次识别范围之外
        %先查看这20个中的其它神经元能否满足式子（*）

        q=m-1;
        h=t;%h的取值范围为1：q+1
        restart=1;
        while restart==1

            %排除s_d中第h个神经元
            y_r=zeros(1,q);
            if h==1
                for i=1:q
                    y_r(i)=y_d(i+1);
                end
            elseif h==q+1
                for i=1:q
                    y_r(i)=y_d(i);
                end
            else
                %h在2：q中
                for i=1:h-1
                    y_r(i)=y_d(i);
                end
                for i=h+1:q+1
                    y_r(i-1)=y_d(i);
                end
            end
            %             s_r= (s_r-min(s_r) )/(max (s_r)-min (s_r));
            y_d=y_r;
            % (4)选择输入模式的最佳分类结果
            %并且如果有很多个一样大的，取位置最小的神经元
            count=zeros(1,q);
            for j=1:m

                if y(j)==max(y_r)
                    %                     count=j;
                    count(j)=j;
                else
                    count(j)=m+1;
                end

            end
            %计入该选出的神经元在y_d中的位置h
            for j=1:q
                if y_d(j)==max(y_r)
                    h=j;
                end
            end
            %             t=count;
            t=min(count);
            %F2层短期记忆调整
            stop=0;
            while stop==1

                for i=1:n
                    %*********(1)
                    z(i)=A(k,i)+a*u(i);
                    %*********(2)
                    q(i)=z(i)/(e+norm(z,2));
                    %*********(3)
                    v(i)=f(q(i))+b*f(s(i));
                    %*********(4)
                    u(i)=v(i)/(e+norm(v,2));
                    %*********(5)
                    p(i)=u(i)+d*W(t,i);
                    %*********(6)
                    s(i)=p(i)/(e+norm(p,2));
                    Error(1,i)=z(i)-(A(k,i)+a*u(i));
                    Error(2,i)=q(i)-(z(i)/(e+norm(z,2)));
                    Error(3,i)=v(i)-(f(q(i))+b*f(s(i)));
                    Error(4,i)=u(i)-(v(i)/(e+norm(v,2)));
                    Error(5,i)=p(i)-(u(i)+d*W(t,i));
                    Error(6,i)=s(i)-(p(i)/(e+norm(p,2)));

                end
                if Error<tao
                    stop=0;
                end

            end
            %(7)
            r=(u+c*p)/(norm(u)+c*norm(p));
            %返回竞争获胜者

            normal_k=norm(r);
            %(5)判定是否接受识别结果

            %如果成立，转入步骤（7）
            if normal_k>warn%式子（*）
                xiu(t)=1;

                restart=0;%终止循环
            elseif q==1
                %都不满足，需要再增加一个新的神经元重新计算
                t=m+1;
                t_out_new=zeros(m+1,a_size(1));
                t_out_new(1:m,:)=t_out;
                t_out=t_out_new;

                W_new=zeros(m+1,n);
                W_new(1:m,:)=W;
                W=W_new;
                T_new=zeros(m+1,n);
                T_new(1:m,:)=T;
                T=T_new;
                %初始化

                for j=1:n
                    W(t,j)=1/(n+1);
                    T(t,j)=1;
                end

                xiu_new=zeros(1,m+1);
                xiu_new(1:m)=xiu;
                xiu_new(m+1)=1;
                xiu=xiu_new;
                m=m+1;
                %此时有m+1个输入结点
                restart=0;%终止循环
            else
                %该神经元不满足，转入下一个循环
                restart=1;
                q=q-1;
            end
        end

    end
    %%
    T_c(k)=t;%将每次选出来的神经元位置存入T_c中
    %接受识别结果，权值调整
    %调整W的权值
    for i=1:n
        %         T(t,i)=T(t,i)*A(k,i);
        W(t,i)=2*(T(t,i)*A(k,i))/(1+T(t,:)*A(k,:)');

    end
    %调整第t个神经元相关的权值T

    for i=1:n
        T(t,i)=T(t,i)*A(k,i);

    end
    %输出类别
    t_out(t,k)=1;

end

end