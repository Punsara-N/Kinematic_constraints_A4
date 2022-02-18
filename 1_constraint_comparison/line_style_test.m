clear,clc,close all

set(groot,  'defaultAxesColorOrder',[0 0 0],...
            'defaultAxesLineStyleOrder','-|--|:|-.'	)

% Example plot
x = [0; 1];
y = [1; 1];
figure; plot(x,y*1,x,y*2,x,y*3,x,y*4,x,y*5,x,y*6);
ylim([-1 8]);

%% Old code
% % Finds all lines
% obj = findobj;
% % Finds the number of lines
% numlines = 0;
% for ii = 1:length(obj)
%     if sum(obj(ii).Type(1:4) == 'line') == 4
%         numlines = numlines + 1;
%     end
% end
% % Increases linewidth of lines after the 4th line
% width = 2;
% if numlines > 4
%     for ii = 4:numlines-1
%         set(obj(end-ii),'LineWidth',width);
%     end
% end

%% New code using: lines = findobj(gca,'Type','line')
lines = findobj(gca,'Type','line'); % Finds all lines in axes
numlines = length(lines);
% Increases linewidth of lines after the 4th line
width = 2;
if numlines > 4
    for ii = 1:numlines-4
        set(lines(ii),'LineWidth',width);
    end
end