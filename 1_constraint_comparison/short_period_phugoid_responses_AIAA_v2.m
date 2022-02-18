clear,clc,close all;
warning off;

%%
load('01_short_period_phugoid_unconstrained');

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
load('02_short_period_phugoid_spherical_constrained_0_6');

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
load('03_short_period_phugoid_spherical_constrained_0_8');

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
load('04_short_period_phugoid_spherical_constrained_1_0');

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
load('05_short_period_phugoid_planar_constrained');

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
load('21_short_period_phugoid_fixed');

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
q5_reduced = q5(1:N:length(q5)); q5_reduced(length(q5_reduced)+1:length(q5)) = q5_reduced(end);
alpha5_reduced = alpha5(1:N:length(alpha5)); alpha5_reduced(length(alpha5_reduced)+1:length(alpha5)) = alpha5_reduced(end);
x5_reduced = x5(1:N:length(x5)); x5_reduced(length(x5_reduced)+1:length(x5)) = x5_reduced(end);
y5_reduced = y5(1:N:length(y5)); y5_reduced(length(y5_reduced)+1:length(y5)) = y5_reduced(end);
z5_reduced = z5(1:N:length(z5)); z5_reduced(length(z5_reduced)+1:length(z5)) = z5_reduced(end);

% Data on just last point, need for legend
t5_legend(1:length(q5),1) = t5_reduced(end);
q5_legend(1:length(q5),1) = q5_reduced(end);
alpha5_legend(1:length(alpha5),1) = alpha5_reduced(end);
x5_legend(1:length(x5),1) = x5_reduced(end);
y5_legend(1:length(y5),1) = y5_reduced(end);
z5_legend(1:length(z5),1) = z5_reduced(end);

%%
fill = 100*ones(size(t1,1),1);

%% Plotting using tight_subplot

% %           x                                              	x_min   x_max   x_spacing	y                                                                           y_min   y_max   y_spacing   y_label          	Colour    	Style
% plots= {    '[t1 t2 t3 t4 t5 t5_reduced t5_legend t6]'  	0       10      1           '[q1 q2 q3 q4 q5 q5_reduced q5_legend q6]'                                  -30     30     	10         	'$q$ (deg/s)'      	[0 0 0]   	'-|--|:|-.|-|x|-x' 
%             '[t1 t2 t3 t4 t5 t5_reduced t5_legend t6]'   	0       10      1           '[alpha1 alpha2 alpha3 alpha4 alpha5 alpha5_reduced alpha5_legend alpha6]'	0       6       2           '$\alpha$ (deg)'  	[0 0 0]   	'-|--|:|-.|-|x|-x'
%             '[t1 t2 t3 t4 t5 t5_reduced t5_legend t6]'   	0       10      1           '[z1 z2 z3 z4 z5 z5_reduced z5_legend z6]'                                  -2      2       1           '$z$ (m)'        	[0 0 0]   	'-|--|:|-.|-|x|-x'
%             '[t1]'                                          0       10      1           '[dele1]'                                                                   -4      -1      1           '$\delta_e$ (deg)' 	[0 0 0]  	'-|--|:|-.|-|x|-x'
%             };
%           x                    	x_min   x_max   x_spacing	y                                	y_min   y_max   y_spacing   y_label          	Colour    	Style
plots= {    '[t1 t3 t5 t6]'         0       10      1           '[q1 q3 q5 q6]'                    	-30     30     	10         	'$q$ (deg/s)'      	[0 0 0]   	'-|--|:|-.' 
            '[t1 t3 t5 t6]'         0       10      1           '[alpha1 alpha3 alpha5 alpha6]'     -2     	6       2         	'$\alpha$ (deg)'  	[0 0 0]   	'-|--|:|-.'
            '[t1 t3 t5 t6]'         0       10      1           '[z1 z3 z5 z6]'                    	-2      2       1           '$z$ (m)'        	[0 0 0]   	'-|--|:|-.'
            '[t1]'                	0       10      1           '[dele1]'                         	-4      -1      1           '$\delta_e$ (deg)' 	[0 0 0]  	'-|--|:|-.'
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

%     if i == 1 % Plotting last response for marked line
%         hold;h(5)=line_fewer_markers(t5,q5,50,'-x','Spacing','x','markersize',6);
%     end
%     if i == 2 % Plotting last response for marked line
%         hold;line_fewer_markers(t5,alpha5,50,'-x','Spacing','x','markersize',6);
%     end
%     if i == 3 % Plotting last response for marked line
%         hold;line_fewer_markers(t5,z5,20,'-x','Spacing','x','markersize',6);
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
    
   	if i == 1
       	% Create rectangle on large plot
        axes(ha(i,:));
        rectangle('Position',[2.5 -10 1 24]); % [X Y width height] (data units)
        % Zoomed section
        X = 0.48;
        Y = 0.87;
        W = 0.25;
        H = 0.08;
        axes('position',[X Y W H]) % [X Y width height]
        box on % put box around new pair of axes
        indexOfInterest = (t1 > 2.5) & (t1 < 3.5); % range of t near perturbation
        plot(t1(indexOfInterest),q1(indexOfInterest),...
             t3(indexOfInterest),q3(indexOfInterest),...
             t5(indexOfInterest),q5(indexOfInterest),...
             t6(indexOfInterest),q6(indexOfInterest)) % plot on new axes
       	%line_fewer_markers(t5(indexOfInterest),q5(indexOfInterest),10,'-x','Spacing','x','markersize',6);
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
        axis tight
        set(gca,...
            'FontUnits','points',...
            'FontWeight','normal',...
            'FontSize',13,...
            'FontName','Times')
    end
    
  	if i == 2
      	% Create rectangle on large plot
        axes(ha(i,:));
        rectangle('Position',[2.5 -0.15 1 (2.45--0.15)]); % [X Y width height] (data units)
        % Zoomed section
        X = 0.48;
        Y = 0.765;
        W = 0.25;
        H = 0.08;
        axes('position',[X Y W H]) % [X Y width height]
        box on % put box around new pair of axes
        indexOfInterest = (t1 > 2.5) & (t1 < 3.5); % range of t near perturbation
        plot(t1(indexOfInterest),alpha1(indexOfInterest),...
             t3(indexOfInterest),alpha3(indexOfInterest),...
             t5(indexOfInterest),alpha5(indexOfInterest),...
             t6(indexOfInterest),alpha6(indexOfInterest)) % plot on new axes
       	%line_fewer_markers(t5(indexOfInterest),alpha5(indexOfInterest),10,'-x','Spacing','x','markersize',6);
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
        axis tight
        set(gca,...
            'FontUnits','points',...
            'FontWeight','normal',...
            'FontSize',13,...
            'FontName','Times')
    end
    
    % Finding and setting line style
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
legend(h(1,[1 2 3 4]),{     'Unconstrained',...
                            'Spherical constrained r=0.8m',...
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

indexOfInterest = (t1 <= 30);
indexOfInterest2 = (t1 <= 30);
% indexOfInterest3 = (t5_reduced2 <= 5);

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
xlim([-3.8 0.2]); ylim([-2.0 2.0]); zlim([-2.0 2.0]);
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

% View angle of plot
% view([1 0.4 0.3]); % Isometric view
view([0 1 0]);

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

% % % dim = [.2 .5 .3 .3];
% % % str = 'b)'; % Unconstrained 2-30s
% % % h = annotation('textbox',dim,'String',str);
% % % set(h,'Units','points',...
% % %       'Position',pos,...
% % %       'FitBoxToText','on',...
% % %       'FontName','Times',...
% % %       'BackgroundColor','none',...%[1 1 1],...
% % %       'EdgeColor', 'none',...
% % %       'FontWeight','bold',...
% % %       'FontSize',12);
% % %   
% % % pos2 = [-30 -160 0 0 ];
% % % set(h, 'Position',pos+pos2);

dim = [.2 .5 .3 .3];
str = 'Unconstrained 2-30s';
h = annotation('textbox',dim,'String',str);
set(h,'Units','points',...
      'Position',pos,...
      'FitBoxToText','on',...
      'FontName','Times',...
      'BackgroundColor',[1 1 1]);

     
%% 3D plots (zoomed) (unconstrained)
axes();

scale_factor = 7;   % For aircraft on plot
step = 1000;          % Gap between aircrafts on plot
exagg_factor = 5;

indexOfInterest = (t1 <= 3);
indexOfInterest2 = (t1 <= 3);
% indexOfInterest3 = (t5_reduced2 <= 3);

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
xlim([-0.5 0.3]); ylim([-0.4 0.4]); zlim([-0.7 0.1]);
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

% View angle of plot
% view([1 0.4 0.3]); % Isometric view
view([0 1 0]);

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

% % % dim = [.2 .5 .3 .3];
% % % str = 'c)'; % Unconstrained 2-3s
% % % h = annotation('textbox',dim,'String',str);
% % % set(h,'Units','points',...
% % %       'Position',pos,...
% % %       'FitBoxToText','on',...
% % %       'FontName','Times',...
% % %       'BackgroundColor','none',...%[1 1 1],...
% % %       'EdgeColor', 'none',...
% % %       'FontWeight','bold',...
% % %       'FontSize',12);
% % %   
% % % pos2 = [-30 -160 0 0 ];
% % % set(h, 'Position',pos+pos2);

dim = [.2 .5 .3 .3];
str = 'Unconstrained 2-3s';
h = annotation('textbox',dim,'String',str);
set(h,'Units','points',...
      'Position',pos,...
      'FitBoxToText','on',...
      'FontName','Times',...
      'BackgroundColor',[1 1 1]);
  
% Unconstrained 2-30s
% Unconstrained 2-3s

%% 3D plots (overall) (spherical constriant 0.8m)
axes();

scale_factor = 6;   % For aircraft on plot
step = 5000;         % Gap between aircrafts on plot
exagg_factor = 1;

indexOfInterest = (t1 <= 8.0);
indexOfInterest2 = (t1 <= 8.0);
% indexOfInterest3 = (t5_reduced2 <= 5);

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
xlim([-2.0 0.4]); ylim([-1.2 1.2]); zlim([-1.2 1.2]);
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

% View angle of plot
% view([1 0.4 0.3]); % Isometric view
view([0 1 0]);

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

% % % dim = [.2 .5 .3 .3];
% % % str = 'd)'; %'Spherical (0.8m) 2-8s';
% % % h = annotation('textbox',dim,'String',str);
% % % set(h,'Units','points',...
% % %       'Position',pos,...
% % %       'FitBoxToText','on',...
% % %       'FontName','Times',...
% % %       'BackgroundColor','none',...%[1 1 1],...
% % %       'EdgeColor', 'none',...
% % %       'FontWeight','bold',...
% % %       'FontSize',12);
% % %   
% % % pos2 = [-30 -160 0 0 ];
% % % set(h, 'Position',pos+pos2);

dim = [.2 .5 .3 .3];
str = 'Spherical (0.8m) 2-8s';
h = annotation('textbox',dim,'String',str);
set(h,'Units','points',...
      'Position',pos,...
      'FitBoxToText','on',...
      'FontName','Times',...
      'BackgroundColor',[1 1 1]);
  
% Unconstrained 2-30s
% Unconstrained 2-3s
% Spherical (0.8m) 2-8s
   
%% 3D plots (zoomed) (spherical constriant 0.8m)
axes();

scale_factor = 7;   % For aircraft on plot
step = 1000;         % Gap between aircrafts on plot
exagg_factor = 5;

indexOfInterest = (t1 <= 3);
indexOfInterest2 = (t1 <= 3);
% indexOfInterest3 = (t5_reduced2 <= 3);

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
xlim([-0.5 0.3]); ylim([-0.4 0.4]); zlim([-0.7 0.1]);
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

% View angle of plot
% view([1 0.4 0.3]); % Isometric view
view([0 1 0]);

% Finding and setting line style
hh = findobj(gca);
for i = 1:length(hh)
    line_type = get(hh(i),'Type');
    if sum(line_type(1:4) == 'line') == 4
        set(hh(i),'LineStyle','-','Marker','none')
    end
end

% [x,y,z] = sphere(1000); % Mesh for a unit sphere
% r = 0.8;
% h=surf(x*r-r,y*r,z*r);
% set(h, 'FaceAlpha', 0.2,...
%        'EdgeColor','none',...
%        'FaceColor',[0.1 0.1 0.1],...
%        'FaceLighting','none');
   
% Moving 3D axes
pos = [650/2-150/2 40 150 150];
set(gca, 'Units', 'points',...
         'Position', pos); % [left bottom width height]
     
% Text box

% % % dim = [.2 .5 .3 .3];
% % % str = 'e)'; % 'Spherical (0.8m) 2-3s';
% % % h = annotation('textbox',dim,'String',str);
% % % set(h,'Units','points',...
% % %       'Position',pos,...
% % %       'FitBoxToText','on',...
% % %       'FontName','Times',...
% % %       'BackgroundColor','none',...%[1 1 1],...
% % %       'EdgeColor', 'none',...
% % %       'FontWeight','bold',...
% % %       'FontSize',12);
% % %   
% % % pos2 = [-30 -160 0 0 ];
% % % set(h, 'Position',pos+pos2);

dim = [.2 .5 .3 .3];
str = 'Spherical (0.8m) 2-3s';
h = annotation('textbox',dim,'String',str);
set(h,'Units','points',...
      'Position',pos,...
      'FitBoxToText','on',...
      'FontName','Times',...
      'BackgroundColor',[1 1 1]);
  
% Unconstrained 2-30s
% Unconstrained 2-3s
% Spherical (0.8m) 2-8s
% Spherical (0.8m) 2-3s
     
%% 3D plots (overall) (planar constriant)
axes();

scale_factor = 6;   % For aircraft on plot
step = 5000;         % Gap between aircrafts on plot ( time gap = step*t1(2) )
exagg_factor = 1;

indexOfInterest = (t1 <= 3.5+t1(2));
indexOfInterest2 = (t1 <= 3.0+t1(2));
% indexOfInterest3 = (t5_reduced2 <= 5);

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
xlim([-1.2 1.2]); ylim([-1.2 1.2]); zlim([-1.2 1.2]);
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

% View angle of plot
% view([1 0.4 0.3]); % Isometric view
view([0 1 0]);

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

% % % dim = [.2 .5 .3 .3];
% % % str = 'f)'; %'Planar 2-3.5s';
% % % h = annotation('textbox',dim,'String',str);
% % % set(h,'Units','points',...
% % %       'Position',pos,...
% % %       'FitBoxToText','on',...
% % %       'FontName','Times',...
% % %       'BackgroundColor','none',...%[1 1 1],...
% % %       'EdgeColor', 'none',...
% % %       'FontWeight','bold',...
% % %       'FontSize',12);
% % %   
% % % pos2 = [-30 -160 0 0 ];
% % % set(h, 'Position',pos+pos2);

dim = [.2 .5 .3 .3];
str = 'Planar 2-3.5s';
h = annotation('textbox',dim,'String',str);
set(h,'Units','points',...
      'Position',pos,...
      'FitBoxToText','on',...
      'FontName','Times',...
      'BackgroundColor',[1 1 1]);
  
% Unconstrained 2-30s
% Unconstrained 2-3s
% Spherical (0.8m) 2-8s
% Spherical (0.8m) 2-3s
% Planar 2-3.5s
     
%% 3D plots (zoomed) (planar constriant)
axes();

scale_factor = 7;   % For aircraft on plot
step = 1000;          % Gap between aircrafts on plot
exagg_factor = 5;

indexOfInterest = (t1 <= 3);
indexOfInterest2 = (t1 <= 3);
% indexOfInterest3 = (t5_reduced2 <= 3);

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
xlim([-0.4 0.4]); ylim([-0.4 0.4]); zlim([-0.7 0.1]);
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

% View angle of plot
% view([1 0.4 0.3]); % Isometric view
view([0 1 0]);

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

% % % dim = [.2 .5 .3 .3];
% % % str = 'g)'; %'Planar 2-3s';
% % % h = annotation('textbox',dim,'String',str);
% % % set(h,'Units','points',...
% % %       'Position',pos,...
% % %       'FitBoxToText','on',...
% % %       'FontName','Times',...
% % %       'BackgroundColor','none',...%[1 1 1],...
% % %       'EdgeColor', 'none',...
% % %       'FontWeight','bold',...
% % %       'FontSize',12);
% % %   
% % % pos2 = [-30 -160 0 0 ];
% % % set(h, 'Position',pos+pos2);

dim = [.2 .5 .3 .3];
str = 'Planar 2-3s';
h = annotation('textbox',dim,'String',str);
set(h,'Units','points',...
      'Position',pos,...
      'FitBoxToText','on',...
      'FontName','Times',...
      'BackgroundColor',[1 1 1]);
  
% Unconstrained 2-30s
% Unconstrained 2-3s
% Spherical (0.8m) 2-8s
% Spherical (0.8m) 2-3s
% Planar 2-3.5s
% Planar 2-3s

%% Text box with 'a)' for main plot
% % % dim = [.2 .5 .3 .3];
% % % str = 'a)';
% % % h = annotation('textbox',dim,'String',str);
% % % set(h,'Units','points',...
% % %       'Position',pos+[-430 +230 0 0],...
% % %       'FitBoxToText','on',...
% % %       'FontName','Times',...
% % %       'BackgroundColor','none',...%[1 1 1],...
% % %       'EdgeColor', 'none',...
% % %       'FontWeight','bold',...
% % %       'FontSize',12);

%% Creating .eps and .pdf files
pos = get(gcf, 'Position'); %// gives x left, y bottom, width, height
width = pos(3);
height = pos(4);
set(gcf,'PaperPositionMode','Auto','PaperUnits','points','PaperSize',[width,height])

print -deps ShortPeriodPhugoid1.eps
print('ShortPeriodPhugoid1','-dpdf','-opengl','-r1000')

% %% Trajectory plots x vs. z
% figure;
% 
% scale_factor = 5;   % For aircraft on plot
% step = 500;         % Gap between aircrafts on plot
% 
% indexOfInterest = (t1 <= 50); % Plotting for 50 seconds
% indexOfInterest2 = (t1 <= 10); % Plotted just 10 for clarity on plot
%    	
% set(groot,'defaultAxesColorOrder',[1 1 1],...
%       'defaultAxesLineStyleOrder','-')
% %%%M = trajectory3(x1(indexOfInterest),y1(indexOfInterest),z1(indexOfInterest),-theta1(indexOfInterest)*pi/180,(phi1(indexOfInterest)+180)*pi/180,-psi1(indexOfInterest)*pi/180,scale_factor,step,'gripen'); hold on;
% % M = trajectory3(x2(indexOfInterest),y2(indexOfInterest2),z2(indexOfInterest2),-theta2(indexOfInterest2)*pi/180,(phi2(indexOfInterest2)+180)*pi/180,-psi2(indexOfInterest2)*pi/180,scale_factor,step,'gripen'); hold on;
% % set(groot,'defaultAxesColorOrder',[0 0 0],...
% %       'defaultAxesLineStyleOrder','-|--|:|-.|-|x|-x')
% h2(1) = plot3(x1(indexOfInterest), y1(indexOfInterest), z1(indexOfInterest),'k-'); hold on;
% h2(2) = plot3(x2(indexOfInterest2), y2(indexOfInterest2), z2(indexOfInterest2),'k--'); hold on;
% h2(3) = plot3(x3(indexOfInterest2), y3(indexOfInterest2), z3(indexOfInterest2),'k:'); hold on;
% h2(4) = plot3(x4(indexOfInterest2), y4(indexOfInterest2), z4(indexOfInterest2),'k-.'); hold on;
% h2(5) = plot3(x5(indexOfInterest2), y5(indexOfInterest2), z5(indexOfInterest2),'k-'); hold on;
% h2(6) = plot3(x5_reduced(indexOfInterest2), y5_reduced(indexOfInterest2), z5_reduced(indexOfInterest2),'kx'); hold on;
% h2(7) = plot3(x5_legend(indexOfInterest2), y5_legend(indexOfInterest2), z5_legend(indexOfInterest2),'k-x'); hold on;
% set(gca,'ZDir','reverse'); % Reverses y axis of plot, so that positive z is downwards
% xlim([-3.0 1.0]); ylim([-2.0 2.0]); zlim([-2.0 2.0]);
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
% zlabel( 'z (m)',...
%         'FontUnits','points',...
%         'FontWeight','normal',...
%         'FontSize',13,...
%         'FontName','Times')
%     
% view([0,-1,0]); % Sets the view of the 3D plot
% 
% % Setting size of plot
% x0=100; % Distance from the left edge of the primary display to the inner left edge of the figure window
% y0=100; % Distance from the bottom edge of the primary display to the inner bottom edge of the figure window
% width=400;
% height=400;
% set(gcf,'units','points','position',[x0,y0,width,height]); % Figure window
% 
% plot_width      = 0.8;
% plot_height     = 0.8;
% x_offset        = 0;
% y_offset        = -0.05;
% left_margin     = (1-plot_width)/2+x_offset;
% bottom_margin   = (1-plot_height)/2+y_offset;
% set(gca,'Position',[left_margin bottom_margin plot_width plot_width]);
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
%     'Position',[0.30 0.90 0 0],'Units','normalized')
%     
% %% Creating .eps and .pdf files
% pos = get(gcf, 'Position'); %// gives x left, y bottom, width, height
% width = pos(3);
% height = pos(4);
% set(gcf,'PaperPositionMode','Auto','PaperUnits','points','PaperSize',[width,height])
% 
% print -deps ShortPeriodPhugoid2.eps
% print('ShortPeriodPhugoid2','-dpdf','-loose','-painters')
% % print('ShortPeriodPhugoid2','-dpdf','-loose','-r600')
