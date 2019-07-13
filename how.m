function how(str)
% lookup useful codes

current = 0;
start = 0;
fid = fopen('how.m');

while 1
    tline = fgetl(fid);
    if ~ischar(tline), break; end
	if contains(tline, 'function codes______________________________'), start = 1; end
    if start == 1 && contains(tline, '%%') && contains(lower(tline),lower(str))
        current = 1;
        disp(tline);
    else
        if current
            if contains(tline,'%%')
                current = 0;
				disp(' ');
            else
                disp(tline);
            end
        end
    end
end
fclose(fid);

%% following are the actual codes
function codes____________________________________________________________________________()
return;

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
set(gca,'Xdir','reverse');
set(gca,'Ydir','reverse');

%% ticks, ticklabel
% in MATLAB 2018
xticks([-3*pi -2*pi -pi 0 pi 2*pi 3*pi])
xticklabels({'-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi'})
yticks([-3*pi -2*pi -pi 0 pi 2*pi 3*pi])
yticklabels({'-3\pi','-2\pi','-\pi','0','\pi','2\pi','3\pi'})
% in old versions
set(gca,'xticklabel',0:50:500)

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
