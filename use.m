function p = use(folder)
% simply a combination of addpath() and to() functions
p = to(folder);
if p~=false, addpath(p); end

