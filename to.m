function path_absolute = to(path_in)
% set up a few default search paths to look for your projects!
% Zheguang Zou, 2018

% define search folders
search_folders ={'./',...
'C:\Users\Zou\Documents\MATLAB',...
'D:\SO_DataProcessing',...
'D:\SO_Modeling',...
'D:\SO_Data',...
'D:\___MATLAB',...
'D:\___MATLAB\DATA',...
'D:\___MATLAB\___Toolbox',...
'D:\___MATLAB',...
'Z-SanDisk-OTG-64GB-USB:\',...
'~/',...
'~/so_project'...
};

for i = 1:length(search_folders)
	folder_default = search_folders{i};
	path_test = sprintf('%s/%s',folder_default,path_in);
	path_test = superdrive(path_test);
	path_test = strrep(path_test,'\','/');
	if exist(path_test,'dir') 
		path_absolute = [path_test,'/'];
		return;
	end
	if exist(path_test,'file') 
		path_absolute = path_test;
		return;
	end
end
fprintf('''%s'' not found.\n',path_in);
path_absolute = false;

%% support super drive!!

function path_out = superdrive(path_in)
path_out = path_in;
if strfind(path_in,':')>3
	[IDcode, rest] = strtok(path_in,':');
	for drive_label = double('C'):double('Z')
		if exist(['' drive_label ':\' IDcode], 'file') 
			path_out = [drive_label, rest];
			return;
		end
	end
end



