clear,clc,close all;
warning off;
    
%%
load('16_dutch_roll_unconstrained');

% Variables
t1      = aircraft_response.Time;

alpha1	= aircraft_response.Data(:,1);  % deg
beta1  	= aircraft_response.Data(:,2);  % deg
u1    	= aircraft_response.Data(:,3);  % m/s
v1    	= aircraft_response.Data(:,4);  % m/s
w1    	= aircraft_response.Data(:,5);  % m/s
p1     	= aircraft_response.Data(:,6);  % deg/s
q1     	= aircraft_response.Data(:,7);  % deg/s
r1    	= aircraft_response.Data(:,8);  % deg/s
dail1  	= aircraft_response.Data(:,9);  % deg
dele1  	= aircraft_response.Data(:,10); % deg
drud1  	= aircraft_response.Data(:,11); % deg
phi1   	= aircraft_response.Data(:,12); % deg
theta1 	= aircraft_response.Data(:,13); % deg
psi1   	= aircraft_response.Data(:,14); % deg
x1     	= aircraft_response.Data(:,15); % m
y1     	= aircraft_response.Data(:,16); % m
z1     	= aircraft_response.Data(:,17); % m
V1     	= aircraft_response.Data(:,18); % m

%%
load('17_dutch_roll_spherical_constrained_0_6');

% Variables
t2      = aircraft_response.Time;

alpha2	= aircraft_response.Data(:,1);  % deg
beta2  	= aircraft_response.Data(:,2);  % deg
u2   	= aircraft_response.Data(:,3);  % m/s
v2    	= aircraft_response.Data(:,4);  % m/s
w2    	= aircraft_response.Data(:,5);  % m/s
p2     	= aircraft_response.Data(:,6);  % deg/s
q2    	= aircraft_response.Data(:,7);  % deg/s
r2    	= aircraft_response.Data(:,8);  % deg/s
dail2 	= aircraft_response.Data(:,9);  % deg
dele2 	= aircraft_response.Data(:,10); % deg
drud2 	= aircraft_response.Data(:,11); % deg
phi2   	= aircraft_response.Data(:,12); % deg
theta2 	= aircraft_response.Data(:,13); % deg
psi2   	= aircraft_response.Data(:,14); % deg
x2     	= aircraft_response.Data(:,15); % m
y2     	= aircraft_response.Data(:,16); % m
z2     	= aircraft_response.Data(:,17); % m
V2     	= aircraft_response.Data(:,18); % m

%%
load('18_dutch_roll_spherical_constrained_0_8');

% Variables
t3      = aircraft_response.Time;

alpha3	= aircraft_response.Data(:,1);  % deg
beta3  	= aircraft_response.Data(:,2);  % deg
u3   	= aircraft_response.Data(:,3);  % m/s
v3    	= aircraft_response.Data(:,4);  % m/s
w3    	= aircraft_response.Data(:,5);  % m/s
p3     	= aircraft_response.Data(:,6);  % deg/s
q3    	= aircraft_response.Data(:,7);  % deg/s
r3    	= aircraft_response.Data(:,8);  % deg/s
dail3 	= aircraft_response.Data(:,9);  % deg
dele3 	= aircraft_response.Data(:,10); % deg
drud3 	= aircraft_response.Data(:,11); % deg
phi3   	= aircraft_response.Data(:,12); % deg
theta3 	= aircraft_response.Data(:,13); % deg
psi3   	= aircraft_response.Data(:,14); % deg
x3     	= aircraft_response.Data(:,15); % m
y3     	= aircraft_response.Data(:,16); % m
z3     	= aircraft_response.Data(:,17); % m
V3     	= aircraft_response.Data(:,18); % m

%%
load('19_dutch_roll_spherical_constrained_1_0');

% Variables
t4      = aircraft_response.Time;

alpha4	= aircraft_response.Data(:,1);  % deg
beta4  	= aircraft_response.Data(:,2);  % deg
u4   	= aircraft_response.Data(:,3);  % m/s
v4    	= aircraft_response.Data(:,4);  % m/s
w4    	= aircraft_response.Data(:,5);  % m/s
p4     	= aircraft_response.Data(:,6);  % deg/s
q4    	= aircraft_response.Data(:,7);  % deg/s
r4    	= aircraft_response.Data(:,8);  % deg/s
dail4 	= aircraft_response.Data(:,9);  % deg
dele4 	= aircraft_response.Data(:,10); % deg
drud4 	= aircraft_response.Data(:,11); % deg
phi4   	= aircraft_response.Data(:,12); % deg
theta4 	= aircraft_response.Data(:,13); % deg
psi4   	= aircraft_response.Data(:,14); % deg
x4     	= aircraft_response.Data(:,15); % m
y4     	= aircraft_response.Data(:,16); % m
z4     	= aircraft_response.Data(:,17); % m
V4     	= aircraft_response.Data(:,18); % m

%%
load('20_dutch_roll_planar_constrained');

% Variables
t5      = aircraft_response.Time;

alpha5	= aircraft_response.Data(:,1);  % deg
beta5  	= aircraft_response.Data(:,2);  % deg
u5     	= aircraft_response.Data(:,3);  % m/s
v5    	= aircraft_response.Data(:,4);  % m/s
w5     	= aircraft_response.Data(:,5);  % m/s
p5    	= aircraft_response.Data(:,6);  % deg/s
q5    	= aircraft_response.Data(:,7);  % deg/s
r5    	= aircraft_response.Data(:,8);  % deg/s
dail5 	= aircraft_response.Data(:,9);  % deg
dele5 	= aircraft_response.Data(:,10); % deg
drud5  	= aircraft_response.Data(:,11); % deg
phi5   	= aircraft_response.Data(:,12); % deg
theta5 	= aircraft_response.Data(:,13); % deg
psi5  	= aircraft_response.Data(:,14); % deg
x5     	= aircraft_response.Data(:,15); % m
y5     	= aircraft_response.Data(:,16); % m
z5     	= aircraft_response.Data(:,17); % m
V5     	= aircraft_response.Data(:,18); % m

%%
load('24_dutch_roll_fixed');

% Variables
t6      = aircraft_response.Time;

alpha6	= aircraft_response.Data(:,1);  % deg
beta6  	= aircraft_response.Data(:,2);  % deg
u6     	= aircraft_response.Data(:,3);  % m/s
v6    	= aircraft_response.Data(:,4);  % m/s
w6     	= aircraft_response.Data(:,5);  % m/s
p6    	= aircraft_response.Data(:,6);  % deg/s
q6    	= aircraft_response.Data(:,7);  % deg/s
r6    	= aircraft_response.Data(:,8);  % deg/s
dail6 	= aircraft_response.Data(:,9);  % deg
dele6 	= aircraft_response.Data(:,10); % deg
drud6  	= aircraft_response.Data(:,11); % deg
phi6   	= aircraft_response.Data(:,12); % deg
theta6 	= aircraft_response.Data(:,13); % deg
psi6  	= aircraft_response.Data(:,14); % deg
x6     	= aircraft_response.Data(:,15); % m
y6     	= aircraft_response.Data(:,16); % m
z6     	= aircraft_response.Data(:,17); % m
V6     	= aircraft_response.Data(:,18); % m

% Data with less points (for plotting markers)
N = 300;
t5_reduced = t5(1:N:length(t5)); t5_reduced(length(t5_reduced)+1:length(t5)) = t5_reduced(end);
r5_reduced = r5(1:N:length(r5)); r5_reduced(length(r5_reduced)+1:length(r5)) = r5_reduced(end);
p5_reduced = p5(1:N:length(p5)); p5_reduced(length(p5_reduced)+1:length(p5)) = p5_reduced(end);
beta5_reduced = beta5(1:N:length(beta5)); beta5_reduced(length(beta5_reduced)+1:length(beta5)) = beta5_reduced(end);
x5_reduced = x5(1:N:length(x5)); x5_reduced(length(x5_reduced)+1:length(x5)) = x5_reduced(end);
y5_reduced = y5(1:N:length(y5)); y5_reduced(length(y5_reduced)+1:length(y5)) = y5_reduced(end);
z5_reduced = z5(1:N:length(z5)); z5_reduced(length(z5_reduced)+1:length(z5)) = z5_reduced(end);

% Data with less points (for plotting markers), trajectory plots
N = 500;
t5_reduced2 = t5(1:N:length(t5)); t5_reduced2(length(t5_reduced2)+1:length(t5)) = t5_reduced2(end);
x5_reduced2 = x5(1:N:length(x5)); x5_reduced2(length(x5_reduced2)+1:length(x5)) = x5_reduced2(end);
y5_reduced2 = y5(1:N:length(y5)); y5_reduced2(length(y5_reduced2)+1:length(y5)) = y5_reduced2(end);
z5_reduced2 = z5(1:N:length(z5)); z5_reduced2(length(z5_reduced2)+1:length(z5)) = z5_reduced2(end);

% Data on just last point, need for legend
t5_legend(1:length(t5),1) = t5_reduced(end);
r5_legend(1:length(r5),1) = r5_reduced(end);
p5_legend(1:length(p5),1) = p5_reduced(end);
beta5_legend(1:length(beta5),1) = beta5_reduced(end);
x5_legend(1:length(x5),1) = x5_reduced(end);
y5_legend(1:length(y5),1) = y5_reduced(end);
z5_legend(1:length(z5),1) = z5_reduced(end);

%%
fill = 100*ones(size(t1,1),1);

%% Plotting using tight_subplot

% %           x                                           x_min   x_max   x_spacing	y                                                               y_min   y_max   y_spacing   y_label          	Colour    	Style
% plots= {    '[t1 t2 t3 t4 t5 t5_reduced t5_legend]'  	0       10      1           '[r1 r2 r3 r4 r5 r5_reduced r5_legend]'                         -6      6     	3         	'$r$ (deg/s)'      	[0 0 0]   	'-|--|:|-.|-|x|-x' 
%             '[t1 t2 t3 t4 t5 t5_reduced t5_legend]'   	0       10      1           '[p1 p2 p3 p4 p5 p5_reduced p5_legend]'                         -30     30      15         	'$p$ (deg/s)'       [0 0 0]   	'-|--|:|-.|-|x|-x'
%             '[t1 t2 t3 t4 t5 t5_reduced t5_legend]'  	0       10      1           '[beta1 beta2 beta3 beta4 beta5 beta5_reduced beta5_legend]'  	-1      1       0.5       	'$\beta$ (deg)'    	[0 0 0]   	'-|--|:|-.|-|x|-x'
%             't4'                                      	0       10      1           '[drud1]'                                                       -2      2       1           '$\delta_r$ (deg)' 	[0 0 0]  	'-|--|:|-.|-|x|-x'
%             };
%           x                         	x_min   x_max   x_spacing	y                                               y_min   y_max   y_spacing   y_label          	Colour    	Style
plots= {    '[t1 t2 t3 t4 t5 t6]'       0       8       1           '[r1 r2 r3 r4 r5 r6]'                           -6      6     	3         	'$r$ (deg/s)'      	[0 0 0]   	'-|--|:|-.' 
            '[t1 t2 t3 t4 t5 t6]'   	0       8       1           '[p1 p2 p3 p4 p5 p6]'                           -30     30      15         	'$p$ (deg/s)'       [0 0 0]   	'-|--|:|-.'
            '[t1 t2 t3 t4 t5 t6]'   	0       8       1           '[alpha1 alpha2 alpha3 alpha4 alpha5 alpha6]'  	1       2       0.5       	'$\alpha$ (deg)'   	[0 0 0]   	'-|--|:|-.'
            '[t1 t2 t3 t4 t5 t6]'   	0       8       1           '[beta1 beta2 beta3 beta4 beta5 beta6]'         -1      1       0.5       	'$\beta$ (deg)'    	[0 0 0]   	'-|--|:|-.'
            't4'                      	0       8       1           '[drud1]'                                       -2      2       1           '$\delta_r$ (deg)' 	[0 0 0]  	'-|--|:|-.'
            };
% RGB = [1 0 0;0 1 0;0 0 1;1 0 1]
% Black = [0 0 0]
        
% width=800;height=1000;
% x0=1;y0=2;
% figure('Units','points','Position',[x0 y0 width height],'PaperPositionMode','auto');

% Setting size of plot
x0=0; % Distance from the left edge of the primary display to the inner left edge of the figure window
y0=40; % Distance from the bottom edge of the primary display to the inner bottom edge of the figure window
width=650;
height=1000;
set(gcf,'units','points','position',[x0,y0,width,height]); % Figure window

rows=size(plots,1);columns=1;
ha = tight_subplot(rows,columns,[.02 0],[.55 .05],[.17 .1]); % [gap_h gap_w], [lowermargin uppermargin], [leftmargin rightmargin]

for i=1:size(plots,1)
    set(groot,'defaultAxesColorOrder',cell2mat(plots(i,10)),...
      'defaultAxesLineStyleOrder',char(plots(i,11)))
    set(groot,'defaultLineLineWidth',1); % Increasing the default line width
  
    % Counter 'i' is for each subplot
    axes(ha(i));h(i,:)=plot(eval(char(plots(i,1))),eval(char(plots(i,5))));grid;
    xlim(cell2mat(plots(i,2:3)))
    ylim(cell2mat(plots(i,6:7)))
    set(gca,...
        'YTick',cell2mat(plots(i,6)):cell2mat(plots(i,8)):cell2mat(plots(i,7)),...
        'XTick',cell2mat(plots(i,2)):cell2mat(plots(i,4)):cell2mat(plots(i,3)),...
        'Units','normalized',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',11,...
        'FontName','Times')
    
    % Increasing line width of lines after line 4
    lines = findobj(gca,'Type','line'); % Finds all lines in axes
    numlines = length(lines);
    % Increases linewidth of lines after the 4th line
    width = 1.75;
    if numlines > 4
        for ii = 1:numlines-4
            set(lines(ii),'LineWidth',width);
        end
    end
    
%     if i==5 || i==7 % Decimal points
%         set(gca,'YTickLabel',num2str(get(gca,'YTick')','%.3f'))
%     else
%         set(gca,'YTickLabel',num2str(get(gca,'YTick')','%.1f'))
%     end

%     if i == 1 % Plotting line with marker
%         hold;h(5)=line_fewer_markers(t5,r5,50,'-x','Spacing','x','markersize',6);
%     end
%     if i == 2 % Plotting line with marker
%         hold;line_fewer_markers(t5,p5,50,'-x','Spacing','x','markersize',6);
%     end
%     if i == 3 % Plotting line with marker
%         hold;line_fewer_markers(t5,beta5,50,'-x','Spacing','x','markersize',6);
%     end
    
    ylabel(plots(i,9),...
        'FontUnits','points',...
        'interpreter','latex',...
        'FontSize',13,...
        'FontName','Times',...
        'Units', 'Normalized', 'Position', [-0.1, 0.5, 0]) % First number sets ylabel distance from axis
    
    if i== size(plots,1)
        set(gca,...
            'XTick',cell2mat(plots(i,2)):cell2mat(plots(i,4)):cell2mat(plots(i,3))) % X ticks
        xlabel('Time (s)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')
    else
        set(gca,'XTickLabel','')
    end
    
%    	if i == 1
%        	% Create rectangle on large plot
%         axes(ha(i,:));
%         rectangle('Position',[2.5 -10 1 15]); % [X Y width height] (data units)
%         % Zoomed section
%         X = 0.65;
%         Y = 0.82;
%         W = 0.25;
%         H = 0.15;
%         axes('position',[X Y W H]) % [X Y width height]
%         box on % put box around new pair of axes
%         indexOfInterest = (t1 > 2.5) & (t1 < 3.5); % range of t near perturbation
%         plot(t1(indexOfInterest),q1(indexOfInterest),...
%              t2(indexOfInterest),q2(indexOfInterest),...
%              t3(indexOfInterest),q3(indexOfInterest),...
%              t4(indexOfInterest),q4(indexOfInterest)) % plot on new axes
%        	line_fewer_markers(t5(indexOfInterest),q5(indexOfInterest),10,'-x','Spacing','x','markersize',6);
%         axis tight
%     end
%     
%   	if i == 2
%       	% Create rectangle on large plot
%         axes(ha(i,:));
%         rectangle('Position',[2.5 0.5 1 1.5]); % [X Y width height] (data units)
%         % Zoomed section
%         X = 0.65;
%         Y = 0.58;
%         W = 0.25;
%         H = 0.15;
%         axes('position',[X Y W H]) % [X Y width height]
%         box on % put box around new pair of axes
%         indexOfInterest = (t1 > 2.5) & (t1 < 3.5); % range of t near perturbation
%         plot(t1(indexOfInterest),alpha1(indexOfInterest),...
%              t2(indexOfInterest),alpha2(indexOfInterest),...
%              t3(indexOfInterest),alpha3(indexOfInterest),...
%              t4(indexOfInterest),alpha4(indexOfInterest)) % plot on new axes
%        	line_fewer_markers(t5(indexOfInterest),alpha5(indexOfInterest),10,'-x','Spacing','x','markersize',6);
%         axis tight
%     end

%     % Increasing the marker size of line with 'x' marks
%     obj = findobj;
%     for i = 1:length(obj)
%         type = get(obj(i),'Type');
%         if type(1:4) == 'line'
%             set(obj(i),'linewidth',1.0);
%             marker = get(obj(i),'Marker');
%             if marker(1) == 'x'
%                 set(obj(i),'MarkerSize',6,...
%                            'MarkerEdgeColor',[0 0 0],...
%                            'MarkerFaceColor',[0 0 0],...
%                            'linewidth',1.2);
%             end
%         end
%     end
    
end

%% Legend
legend(h(1,[1 2 3 4 5 6]),{	'Unconstrained',...
                            'Spherical constrained r=0.6m',...
                            'Spherical constrained r=0.8m',...
                            'Spherical constrained r=1.0m',...
                            'Planar constrained',...
                            'Translational position fixed'},...
    'FontUnits','points',...
    'interpreter','latex',...
    'FontSize',9,...
    'FontName','Times',...
    'Position',[0.85 0.95 0 0],'Units','normalized')

set(groot,'defaultLineLineWidth','remove'); % Removes user defined default line width
%% 3D plots (overall) (unconstrained)
axes();

scale_factor = 6;   % For aircraft on plot
step = 5000;         % Gap between aircrafts on plot
exagg_factor = 1;

indexOfInterest = (t1 <= 5.0);
indexOfInterest2 = (t1 <= 5.0);
indexOfInterest3 = (t5_reduced2 <= 5.0);

% Planar constraint
M = trajectory3(x1(indexOfInterest),...
                y1(indexOfInterest),...
                z1(indexOfInterest),...
                -theta1(indexOfInterest)*pi/180*exagg_factor,...
                (phi1(indexOfInterest)+180)*pi/180*exagg_factor,...
                psi1(indexOfInterest)*pi/180*exagg_factor,...
                scale_factor,...
                step,...
                'simple'); 
hold on;
xlim([-1.0 0.6]); ylim([-1.0 1.0]); zlim([-0.8 0.8]);
set(gca,...
        'Units','normalized',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',11,...
        'FontName','Times')
xlabel( 'x (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')
ylabel( 'y (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')
zlabel( 'z (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')

set(gca,'ZDir','reverse'); % Reverses z axis of plot, so that positive z is downwards
set(gca,'YDir','reverse'); % Reverses y axis of plot, so that positive y is right

view([1 0.4 0.3]);

% Finding and setting line style
hh = findobj(gca);
for i = 1:length(hh)
    line_type = get(hh(i),'Type');
    if sum(line_type(1:4) == 'line') == 4
        set(hh(i),'LineStyle','-','Marker','none')
    end
end
   
% Moving 3D axes
pos = [650/2-150/2-200 225 150 150];
set(gca, 'Units', 'points',...
         'Position', pos); % [left bottom width height]
     
% Text box
dim = [.2 .5 .3 .3];
str = 'Unconstrained 2-5s';
h = annotation('textbox',dim,'String',str);
set(h,'Units','points',...
      'Position',pos,...
      'FitBoxToText','on',...
      'FontName','Times',...
      'BackgroundColor',[1 1 1]);
     
%% 3D plots (zoomed) (unconstrained)
axes();

scale_factor = 7;   % For aircraft on plot
step = 4000;          % Gap between aircrafts on plot
exagg_factor = 5;

indexOfInterest = (t1 <= 3.6);
indexOfInterest2 = (t1 <= 3.6);
indexOfInterest3 = (t5_reduced2 <= 3.6);

% Spherical constraint 0.8m radius
M = trajectory3(x1(indexOfInterest),...
                y1(indexOfInterest),...
                z1(indexOfInterest),...
                -theta1(indexOfInterest)*pi/180*exagg_factor,...
                (phi1(indexOfInterest)+180)*pi/180*exagg_factor,...
                psi1(indexOfInterest)*pi/180*exagg_factor,...
                scale_factor,...
                step,...
                'simple'); 
hold on;
xlim([-0.3 0.3]); ylim([-0.5 0.1]); zlim([-0.3 0.3]);
set(gca,...
        'Units','normalized',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',11,...
        'FontName','Times')
xlabel( 'x (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')
ylabel( 'y (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')
zlabel( 'z (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')

set(gca,'ZDir','reverse'); % Reverses z axis of plot, so that positive z is downwards
set(gca,'YDir','reverse'); % Reverses y axis of plot, so that positive y is right

view([1 0.4 0.3]);

% Finding and setting line style
hh = findobj(gca);
for i = 1:length(hh)
    line_type = get(hh(i),'Type');
    if sum(line_type(1:4) == 'line') == 4
        set(hh(i),'LineStyle','-','Marker','none')
    end
end
   
% Moving 3D axes
pos = [650/2-150/2-200 40 150 150];
set(gca, 'Units', 'points',...
         'Position', pos); % [left bottom width height]
     
% Text box
dim = [.2 .5 .3 .3];
str = 'Unconstrained 2-3.6s';
h = annotation('textbox',dim,'String',str);
set(h,'Units','points',...
      'Position',pos,...
      'FitBoxToText','on',...
      'FontName','Times',...
      'BackgroundColor',[1 1 1]);

%% 3D plots (overall) (spherical constriant 0.8m)
axes();

scale_factor = 6;   % For aircraft on plot
step = 5000;         % Gap between aircrafts on plot
exagg_factor = 1;

indexOfInterest = (t1 <= 5);
indexOfInterest2 = (t1 <= 5);
indexOfInterest3 = (t5_reduced2 <= 5);

% Spherical constraint 0.8m radius
M = trajectory3(x3(indexOfInterest),...
                y3(indexOfInterest),...
                z3(indexOfInterest),...
                -theta3(indexOfInterest)*pi/180*exagg_factor,...
                (phi3(indexOfInterest)+180)*pi/180*exagg_factor,...
                psi3(indexOfInterest)*pi/180*exagg_factor,...
                scale_factor,...
                step,...
                'simple'); 
hold on;
xlim([-1.0 0.6]); ylim([-1.0 1.0]); zlim([-0.8 0.8]);
set(gca,...
        'Units','normalized',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',11,...
        'FontName','Times')
xlabel( 'x (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')
ylabel( 'y (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')
zlabel( 'z (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')

set(gca,'ZDir','reverse'); % Reverses z axis of plot, so that positive z is downwards
set(gca,'YDir','reverse'); % Reverses y axis of plot, so that positive y is right

view([1 0.4 0.3]);

% Finding and setting line style
hh = findobj(gca);
for i = 1:length(hh)
    line_type = get(hh(i),'Type');
    if sum(line_type(1:4) == 'line') == 4
        set(hh(i),'LineStyle','-','Marker','none')
    end
end

[x,y,z] = sphere(1000); % Mesh for a unit sphere
r = 0.8;
h=surf(x*r-r,y*r,z*r);
set(h, 'FaceAlpha', 0.2,...
       'EdgeColor','none',...
       'FaceColor',[0.1 0.1 0.1],...
       'FaceLighting','none');
   
% Moving 3D axes
pos = [650/2-150/2 225 150 150];
set(gca, 'Units', 'points',...
         'Position', pos); % [left bottom width height]
     
% Text box
dim = [.2 .5 .3 .3];
str = 'Spherical (0.8m) 2-5s';
h = annotation('textbox',dim,'String',str);
set(h,'Units','points',...
      'Position',pos,...
      'FitBoxToText','on',...
      'FontName','Times',...
      'BackgroundColor',[1 1 1]);
   
%% 3D plots (zoomed) (spherical constriant 0.8m)
axes();

scale_factor = 7;   % For aircraft on plot
step = 4000;         % Gap between aircrafts on plot
exagg_factor = 5;

indexOfInterest = (t1 <= 3.6);
indexOfInterest2 = (t1 <= 3.6);
indexOfInterest3 = (t5_reduced2 <= 3.6);

% Spherical constraint 0.8m radius
M = trajectory3(x3(indexOfInterest),...
                y3(indexOfInterest),...
                z3(indexOfInterest),...
                -theta3(indexOfInterest)*pi/180*exagg_factor,...
                (phi3(indexOfInterest)+180)*pi/180*exagg_factor,...
                psi3(indexOfInterest)*pi/180*exagg_factor,...
                scale_factor,...
                step,...
                'simple'); 
hold on;
xlim([-0.3 0.3]); ylim([-0.5 0.1]); zlim([-0.3 0.3]);
set(gca,...
        'Units','normalized',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',11,...
        'FontName','Times')
xlabel( 'x (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')
ylabel( 'y (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')
zlabel( 'z (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')

set(gca,'ZDir','reverse'); % Reverses z axis of plot, so that positive z is downwards
set(gca,'YDir','reverse'); % Reverses y axis of plot, so that positive y is right

view([1 0.4 0.3]);

% Finding and setting line style
hh = findobj(gca);
for i = 1:length(hh)
    line_type = get(hh(i),'Type');
    if sum(line_type(1:4) == 'line') == 4
        set(hh(i),'LineStyle','-','Marker','none')
    end
end

[x,y,z] = sphere(1000); % Mesh for a unit sphere
r = 0.8;
h=surf(x*r-r,y*r,z*r);
set(h, 'FaceAlpha', 0.2,...
       'EdgeColor','none',...
       'FaceColor',[0.1 0.1 0.1],...
       'FaceLighting','none');
   
% Moving 3D axes
pos = [650/2-150/2 40 150 150];
set(gca, 'Units', 'points',...
         'Position', pos); % [left bottom width height]
     
% Text box
dim = [.2 .5 .3 .3];
str = 'Spherical (0.8m) 2-3.6s';
h = annotation('textbox',dim,'String',str);
set(h,'Units','points',...
      'Position',pos,...
      'FitBoxToText','on',...
      'FontName','Times',...
      'BackgroundColor',[1 1 1]);
     
%% 3D plots (overall) (planar constriant)
axes();

scale_factor = 6;   % For aircraft on plot
step = 5000;         % Gap between aircrafts on plot
exagg_factor = 1;

indexOfInterest = (t1 <= 5);
indexOfInterest2 = (t1 <= 5);
indexOfInterest3 = (t5_reduced2 <= 5);

% Planar constraint
M = trajectory3(x5(indexOfInterest),...
                y5(indexOfInterest),...
                z5(indexOfInterest),...
                -theta5(indexOfInterest)*pi/180*exagg_factor,...
                (phi5(indexOfInterest)+180)*pi/180*exagg_factor,...
                psi5(indexOfInterest)*pi/180*exagg_factor,...
                scale_factor,...
                step,...
                'simple'); 
hold on;
xlim([-1.0 0.6]); ylim([-1.0 1.0]); zlim([-0.8 0.8]);
set(gca,...
        'Units','normalized',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',11,...
        'FontName','Times')
xlabel( 'x (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')
ylabel( 'y (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')
zlabel( 'z (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')

set(gca,'ZDir','reverse'); % Reverses z axis of plot, so that positive z is downwards
set(gca,'YDir','reverse'); % Reverses y axis of plot, so that positive y is right

view([1 0.4 0.3]);

% Finding and setting line style
hh = findobj(gca);
for i = 1:length(hh)
    line_type = get(hh(i),'Type');
    if sum(line_type(1:4) == 'line') == 4
        set(hh(i),'LineStyle','-','Marker','none')
    end
end

% Plane
x = [0  0
     0  0];
y = [1  -1
     1  -1];
z = [-1  -1
     1  1];
h=surf(x,y,z);
set(h, 'FaceAlpha', 0.2,...
       'EdgeColor','none',...
       'FaceColor',[0.1 0.1 0.1],...
       'FaceLighting','none');
   
% Moving 3D axes
pos = [650/2-150/2+200 225 150 150];
set(gca, 'Units', 'points',...
         'Position', pos); % [left bottom width height]
     
% Text box
dim = [.2 .5 .3 .3];
str = 'Planar 2-5s';
h = annotation('textbox',dim,'String',str);
set(h,'Units','points',...
      'Position',pos,...
      'FitBoxToText','on',...
      'FontName','Times',...
      'BackgroundColor',[1 1 1]);
     
%% 3D plots (zoomed) (planar constriant)
axes();

scale_factor = 7;   % For aircraft on plot
step = 4000;          % Gap between aircrafts on plot
exagg_factor = 5;

indexOfInterest = (t1 <= 3.6);
indexOfInterest2 = (t1 <= 3.6);
indexOfInterest3 = (t5_reduced2 <= 3.6);

% Spherical constraint 0.8m radius
M = trajectory3(x5(indexOfInterest),...
                y5(indexOfInterest),...
                z5(indexOfInterest),...
                -theta5(indexOfInterest)*pi/180*exagg_factor,...
                (phi5(indexOfInterest)+180)*pi/180*exagg_factor,...
                psi5(indexOfInterest)*pi/180*exagg_factor,...
                scale_factor,...
                step,...
                'simple'); 
hold on;
xlim([-0.3 0.3]); ylim([-0.5 0.1]); zlim([-0.3 0.3]);
set(gca,...
        'Units','normalized',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',11,...
        'FontName','Times')
xlabel( 'x (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')
ylabel( 'y (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')
zlabel( 'z (m)',...
        'FontUnits','points',...
        'FontWeight','normal',...
        'FontSize',13,...
        'FontName','Times')

set(gca,'ZDir','reverse'); % Reverses z axis of plot, so that positive z is downwards
set(gca,'YDir','reverse'); % Reverses y axis of plot, so that positive y is right

view([1 0.4 0.3]);

% Finding and setting line style
hh = findobj(gca);
for i = 1:length(hh)
    line_type = get(hh(i),'Type');
    if sum(line_type(1:4) == 'line') == 4
        set(hh(i),'LineStyle','-','Marker','none')
    end
end

% Plane
x = [0  0
     0  0];
y = [1  -1
     1  -1];
z = [-1  -1
     1  1];
h=surf(x,y,z);
set(h, 'FaceAlpha', 0.2,...
       'EdgeColor','none',...
       'FaceColor',[0.1 0.1 0.1],...
       'FaceLighting','none');
   
% Moving 3D axes
pos = [650/2-150/2+200 40 150 150];
set(gca, 'Units', 'points',...
         'Position', pos); % [left bottom width height]
     
% Text box
dim = [.2 .5 .3 .3];
str = 'Planar 2-3.6s';
h = annotation('textbox',dim,'String',str);
set(h,'Units','points',...
      'Position',pos,...
      'FitBoxToText','on',...
      'FontName','Times',...
      'BackgroundColor',[1 1 1]);

%% Creating .eps and .pdf files
pos = get(gcf, 'Position'); %// gives x left, y bottom, width, height
width = pos(3);
height = pos(4);
set(gcf,'PaperPositionMode','Auto','PaperUnits','points','PaperSize',[width,height])

print -deps DutchRoll1_THESIS.eps
% print('DutchRoll1','-dpdf','-loose','-painters')
print('DutchRoll1_THESIS','-dpdf','-r1000')

% %% Trajectory plots
% figure;
% 
% % Setting size of plot
% x0=100; % Distance from the left edge of the primary display to the inner left edge of the figure window
% y0=100; % Distance from the bottom edge of the primary display to the inner bottom edge of the figure window
% width=800;
% height=400;
% set(gcf,'units','points','position',[x0,y0,width,height]); % Figure window
% 
% %% Trajectory: y vs. z
% axes();
% scale_factor = 5;   % For aircraft on plot
% step = 200;         % Gap between aircrafts on plot
% 
% indexOfInterest = (t1 <= 10);
% indexOfInterest2 = (t1 <= 10);
% indexOfInterest3 = (t5_reduced2 <= 10);
%    	
% set(groot,'defaultAxesColorOrder',[1 1 1],...
%       'defaultAxesLineStyleOrder','-')
% % % % M = trajectory3(x1(indexOfInterest),y1(indexOfInterest),z1(indexOfInterest),-theta1(indexOfInterest)*pi/180,(phi1(indexOfInterest)+180)*pi/180,-psi1(indexOfInterest)*pi/180,scale_factor,step,'simple'); hold on;
% % M = trajectory3(x2(indexOfInterest),y2(indexOfInterest2),z2(indexOfInterest2),-theta2(indexOfInterest2)*pi/180,(phi2(indexOfInterest2)+180)*pi/180,-psi2(indexOfInterest2)*pi/180,scale_factor,step,'simple'); hold on;
% % set(groot,'defaultAxesColorOrder',[0 0 0],...
% %       'defaultAxesLineStyleOrder','-|--|:|-.|-|x|-x')
% h2(1) = plot3(x1(indexOfInterest), y1(indexOfInterest), z1(indexOfInterest),'k-'); hold on;
% h2(2) = plot3(x2(indexOfInterest2), y2(indexOfInterest2), z2(indexOfInterest2),'k--'); hold on;
% h2(3) = plot3(x3(indexOfInterest2), y3(indexOfInterest2), z3(indexOfInterest2),'k:'); hold on;
% h2(4) = plot3(x4(indexOfInterest2), y4(indexOfInterest2), z4(indexOfInterest2),'k-.'); hold on;
% h2(5) = plot3(x5(indexOfInterest2), y5(indexOfInterest2), z5(indexOfInterest2),'k-'); hold on;
% h2(6) = plot3(x5_reduced2(indexOfInterest3), y5_reduced2(indexOfInterest3), z5_reduced2(indexOfInterest3),'kx'); hold on;
% h2(7) = plot3(x5_legend(indexOfInterest2), y5_legend(indexOfInterest2), z5_legend(indexOfInterest2),'k-x'); hold on;
% grid;
% set(gca,'ZDir','reverse'); % Reverses z axis of plot, so that positive z is downwards
% set(gca,'YDir','reverse'); % Reverses y axis of plot, so that positive y is right
% xlim([-3.0 1.0]); ylim([-1.0 1.0]); zlim([-1.0 1.0]);
% grid;
% % xlabel('y (m)'); ylabel('z (m)');
% set(gca,...
%         'Units','normalized',...
%         'FontUnits','points',...
%         'FontWeight','normal',...
%         'FontSize',11,...
%         'FontName','Times')
% xlabel( 'x (m)',...
%         'FontUnits','points',...
%         'FontWeight','normal',...
%         'FontSize',13,...
%         'FontName','Times')
% ylabel( 'y (m)',...
%         'FontUnits','points',...
%         'FontWeight','normal',...
%         'FontSize',13,...
%         'FontName','Times')
% zlabel( 'z (m)',...
%         'FontUnits','points',...
%         'FontWeight','normal',...
%         'FontSize',13,...
%         'FontName','Times')
%     
% view([-1,0,0]); % Sets the view of the 3D plot
% 
% % Plot axes properties
% plot_width      = 0.4;
% plot_height     = 0.8;
% x_offset        = -0.25;
% y_offset        = 0.03;
% left_margin     = (1-plot_width)/2+x_offset;
% bottom_margin   = (1-plot_height)/2+y_offset;
% set(gca,'Position',[left_margin bottom_margin plot_width plot_height]);
% 
% %% Trajectory: x vs. z
% axes(); % Creates new axes
% 
% scale_factor = 5;   % For aircraft on plot
% step = 200;         % Gap between aircrafts on plot
% 
% indexOfInterest = (t1 <= 10);
% indexOfInterest2 = (t1 <= 10);
% indexOfInterest3 = (t5_reduced2 <= 10);
%    	
% set(groot,'defaultAxesColorOrder',[1 1 1],...
%       'defaultAxesLineStyleOrder','-')
% % % % M = trajectory3(x1(indexOfInterest),y1(indexOfInterest),z1(indexOfInterest),-theta1(indexOfInterest)*pi/180,(phi1(indexOfInterest)+180)*pi/180,-psi1(indexOfInterest)*pi/180,scale_factor,step,'simple'); hold on;
% % M = trajectory3(x2(indexOfInterest),y2(indexOfInterest2),z2(indexOfInterest2),-theta2(indexOfInterest2)*pi/180,(phi2(indexOfInterest2)+180)*pi/180,-psi2(indexOfInterest2)*pi/180,scale_factor,step,'simple'); hold on;
% % set(groot,'defaultAxesColorOrder',[0 0 0],...
% %       'defaultAxesLineStyleOrder','-|--|:|-.|-|x|-x')
% h2(1) = plot3(x1(indexOfInterest), y1(indexOfInterest), z1(indexOfInterest),'k-'); hold on;
% h2(2) = plot3(x2(indexOfInterest2), y2(indexOfInterest2), z2(indexOfInterest2),'k--'); hold on;
% h2(3) = plot3(x3(indexOfInterest2), y3(indexOfInterest2), z3(indexOfInterest2),'k:'); hold on;
% h2(4) = plot3(x4(indexOfInterest2), y4(indexOfInterest2), z4(indexOfInterest2),'k-.'); hold on;
% h2(5) = plot3(x5(indexOfInterest2), y5(indexOfInterest2), z5(indexOfInterest2),'k-'); hold on;
% h2(6) = plot3(x5_reduced2(indexOfInterest3), y5_reduced2(indexOfInterest3), z5_reduced2(indexOfInterest3),'kx'); hold on;
% h2(7) = plot3(x5_legend(indexOfInterest2), y5_legend(indexOfInterest2), z5_legend(indexOfInterest2),'k-x'); hold on;
% grid;
% set(gca,'ZDir','reverse'); % Reverses z axis of plot, so that positive z is downwards
% set(gca,'YDir','reverse'); % Reverses y axis of plot, so that positive y is right
% xlim([-1.6 0.4]); ylim([-1.0 1.0]); zlim([-1.0 1.0]);
% grid;
% % xlabel('y (m)'); ylabel('z (m)');
% set(gca,...
%         'Units','normalized',...
%         'FontUnits','points',...
%         'FontWeight','normal',...
%         'FontSize',11,...
%         'FontName','Times')
% xlabel( 'x (m)',...
%         'FontUnits','points',...
%         'FontWeight','normal',...
%         'FontSize',13,...
%         'FontName','Times')
% ylabel( 'y (m)',...
%         'FontUnits','points',...
%         'FontWeight','normal',...
%         'FontSize',13,...
%         'FontName','Times')
% zlabel( 'z (m)',...
%         'FontUnits','points',...
%         'FontWeight','normal',...
%         'FontSize',13,...
%         'FontName','Times')
%     
% view([0,-1,0]); % Sets the view of the 3D plot
% 
% % Plot axes properties
% plot_width      = 0.4;
% plot_height     = 0.8;
% x_offset        = 0.25;
% y_offset        = 0.03;
% left_margin     = (1-plot_width)/2+x_offset;
% bottom_margin   = (1-plot_height)/2+y_offset;
% set(gca,'Position',[left_margin bottom_margin plot_width plot_height]);
%     
% legend(h2([1 2 3 4 7]),{	'Unconstrained',...
%                             'Spherical constrained r=0.6m',...
%                             'Spherical constrained r=0.8m',...
%                             'Spherical constrained r=1.0m',...
%                             'Planar constrained'},...
%     'FontUnits','points',...
%     'interpreter','latex',...
%     'FontSize',9,...
%     'FontName','Times',...
%     'Position',[0.15 0.90 0 0],'Units','normalized')
%     
% %% Creating .eps and .pdf files
% pos = get(gcf, 'Position'); %// gives x left, y bottom, width, height
% width = pos(3);
% height = pos(4);
% set(gcf,'PaperPositionMode','Auto','PaperUnits','points','PaperSize',[width,height])
% 
% print -deps DutchRoll2.eps
% print('DutchRoll2','-dpdf','-loose','-painters')
% % save2pdf('DutchRoll2')