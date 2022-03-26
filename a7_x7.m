function [y] = a7_x7(a)
%UNTITLED4 此处提供此函数的摘要
%   此处提供详细说明
if strcmp('normal',a)==1
    y=[0 0 0];
elseif strcmp('ipsweep',a)==1
    y=[0 0 1];
elseif strcmp('buffer_overflow',a)==1
    y=[0 1 0];
elseif strcmp('guess_passwd',a)==1
    y=[0 1 1];
elseif strcmp('portsweep',a)==1
    y=[1 0 0];
elseif strcmp('smurf',a)==1
    y=[1 0 1];
end
end