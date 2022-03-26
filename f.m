function [y] = f(x)
%函数f（x）
% 参数θ(normal)反映信号处理函数f (· )的非线性程度,决定
% 前处理器抑制噪声对比增强能力,当θ增大,则前处
% 理器的收敛速度极大地减慢。
normal=0.9;
if x>=0&&x<normal
    y=2*normal*x*x/(normal^2+x^2);
else
    y=0;
end

end