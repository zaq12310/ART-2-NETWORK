function [y] = a4_x4(a)
%UNTITLED3 此处提供此函数的摘要
%   此处提供详细说明
if strcmp('SF',a)==1
    y=[0 0 0 0];
elseif strcmp('S0',a)==1
    y=[0 0 0 1];
elseif strcmp('S3',a)==1
    y=[0 0 1 0];
elseif strcmp('RSTO',a)==1
    y=[0 0 1 1];
elseif strcmp('RSTR',a)==1
    y=[0 1 0 0];
elseif strcmp('REJ',a)==1
    y=[0 1 0 1];
elseif strcmp('RSTOS0',a)==1
    y=[0 1 1 0];
elseif strcmp('OTH',a)==1
    y=[0 1 1 1];
elseif strcmp('S2',a)==1
    y=[1 0 0 0];
end

end