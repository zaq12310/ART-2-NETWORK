function [y] = a3_x3(a)
%UNTITLED2 此处提供此函数的摘要
%   此处提供详细说明
if strcmp('telnet',a)==1
    y=[0 0 0 0 0 0];
elseif strcmp('ecr_i',a)==1
    y=[0 0 0 0 0 1];
elseif strcmp('http',a)==1
    y=[0 0 0 0 1 0];
elseif strcmp('private',a)==1
    y=[0 0 0 0 1 1];
elseif strcmp('rje',a)==1
    y=[0 0 0 1 0 0];
elseif strcmp('smtp',a)==1
    y=[0 0 0 1 0 1];
elseif strcmp('time',a)==1
    y=[0 0 0 1 1 0];
elseif strcmp('mtp',a)==1
    y=[0 0 0 1 1 1];
elseif strcmp('link',a)==1
    y=[0 0 1 0 0 0];
elseif strcmp('ftp',a)==1
    y=[0 0 1 0 0 1];
elseif strcmp('remote_job',a)==1
    y=[0 0 1 0 1 0];
elseif strcmp('ftp_data',a)==1
    y=[0 0 1 0 1 1];
elseif strcmp('gopher',a)==1
    y=[0 0 1 1 0 0];
elseif strcmp('ssh',a)==1
    y=[0 0 1 1 0 1];
elseif strcmp('name',a)==1
    y=[0 0 1 1 1 0];
elseif strcmp('finger',a)==1
    y=[0 0 1 1 1 1];
elseif strcmp('whois',a)==1
    y=[0 1 0 0 0 0];
elseif strcmp('domain',a)==1
    y=[0 1 0 0 0 1];
elseif strcmp('daytime',a)==1
    y=[0 1 0 0 1 0];
elseif strcmp('eco_i',a)==1
    y=[0 1 0 0 1 1];
elseif strcmp('systat',a)==1
    y=[0 1 0 1 0 0];
elseif strcmp('hostnames',a)==1
    y=[0 1 0 1 0 1];
elseif strcmp('sunrpc',a)==1
    y=[0 1 0 1 1 0];
elseif strcmp('other',a)==1
    y=[0 1 0 1 1 1];
elseif strcmp('netstat',a)==1
    y=[0 1 1 0 0 0];
elseif strcmp('supdup',a)==1
    y=[0 1 1 0 0 1];
elseif strcmp('csnet_ns',a)==1
    y=[0 1 1 0 1 0];
elseif strcmp('vmnet',a)==1
    y=[0 1 1 0 1 1];
elseif strcmp('printer',a)==1
    y=[0 1 1 1 0 0];
elseif strcmp('uucp_path',a)==1
    y=[0 1 1 1 0 1];
elseif strcmp('netbios_ns',a)==1
    y=[0 1 1 1 1 0];
elseif strcmp('pop_3',a)==1
    y=[0 1 1 1 1 1];
elseif strcmp('sql_net',a)==1
    y=[1 0 0 0 0 0];
elseif strcmp('Z39_50',a)==1
    y=[1 0 0 0 0 1];
elseif strcmp('efs',a)==1
    y=[1 0 0 0 1 0];
elseif strcmp('courier',a)==1
    y=[1 0 0 0 1 1];
elseif strcmp('uucp',a)==1
    y=[1 0 0 1 0 0];
elseif strcmp('echo',a)==1
    y=[1 0 0 1 0 1];
elseif strcmp('http_443',a)==1
    y=[1 0 0 1 1 0];
elseif strcmp('netbios_ssn',a)==1
    y=[1 0 0 1 1 1];



end

end