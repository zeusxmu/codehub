function how(str)
% A quick lookup for how to code.
% Zheguang Zou, 2019

current = 0;
start = 0;
fid = fopen('how.m');
while 1
	tline = fgetl(fid);
	if ~ischar(tline), break; end
	if contains(tline, '______________________________'), start = 1; end
	if start == 1 && contains(tline, '%%') && contains(lower(tline),lower(str))
		current = 1; 
		disp(tline);
	else
		if current == 1
			if contains(tline,'%%') 
			current = 0;
			fprintf('\n----\n');
			else
			disp(tline);
			end
		end
	end
end
fclose(fid);

return;

% please feel free to add whatever you like below this line
% __________________________________________________________

%% axis location top right
ax = gca;
ax.XAxisLocation = 'top';
ax.YAxisLocation = 'right';

%% label
xlabel('','FontWeight','Bold');
ylabel('','FontWeight','Bold');

%% pcolor-shading
pcolor(data); 
shading('interp'); 
box on; 
set(gca,'Layer','top');
set(gca,'Ydir','reverse');

%% flip/reverse axis
set(gca, 'Xdir', 'reverse');
set(gca, 'Ydir', 'reverse');

%% ticks, xticks, yticks
xticks([]);
yticks([]);

%% ticklabels, xticklabels, yticklabels
% in 2018
xticklabels({});
yticklabels({});
% in old versions
set(gca, 'xticklabel', []);
set(gca, 'yticklabel', []);

%% fontsize
set(findall(gcf,'-property','FontSize'),'FontSize',fsz);

%% figure
figure('position', [150,-100, 700, 700]);

%% fft
data = rand(1000,1);
NFFT = 1024;
y = fft(data,NFFT);
f = (0:NFFT-1)*df;
plot(f, data);
xlim([0, max(f)/2]);
xlabel('Frequency (Hz)'), ylabel('amplitude');

%% function option
% nargin
if nargin < 1, value = 0; end
% varargin
function myplot(x,varargin)
plot(x,varargin{:})
