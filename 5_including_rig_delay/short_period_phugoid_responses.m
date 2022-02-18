clear,clc,close all;

% response_files = {  '01_short_period_phugoid_unconstrained'
%                     '05_2_short_period_phugoid_planar_constrained_no_thrust'
%                     '03_1_2_short_period_phugoid_spherical_constrained_0_8_no_Fc_no_thrust'
%                     '03_2_2_short_period_phugoid_spherical_constrained_0_8_with_Fc_no_thrust'
%                     '03_3_short_period_phugoid_spherical_constrained_0_8_no_Fc_no_thrust_no_X_check'
%                  };
             
response_files = {  '21_short_period_phugoid_unconstrained_paramtest'
                    '23_2_short_period_phugoid_planar_constrained_no_thrust_paramtest'
                    '22_1_2_short_period_phugoid_spherical_constrained_0_8_no_Fc_no_thrust_paramtest'
                    '22_2_2_short_period_phugoid_spherical_constrained_0_8_with_Fc_no_thrust_paramtest'
                    '22_3_short_period_phugoid_spherical_constrained_0_8_no_Fc_no_thrust_no_X_check_paramtest'
                 };

%%
load(response_files{1});

% Variables
t1      = aircraft_response.Time;

alpha1	= aircraft_response.Data(:,1);  % deg
beta1  	= aircraft_response.Data(:,2);  % deg
u1     	= aircraft_response.Data(:,3);  % m/s
v1    	= aircraft_response.Data(:,4);  % m/s
w1     	= aircraft_response.Data(:,5);  % m/s
p1    	= aircraft_response.Data(:,6);  % deg/s
q1    	= aircraft_response.Data(:,7);  % deg/s
r1    	= aircraft_response.Data(:,8);  % deg/s
dail1 	= aircraft_response.Data(:,9);  % deg
dele1 	= aircraft_response.Data(:,10); % deg
drud1  	= aircraft_response.Data(:,11); % deg
phi1   	= aircraft_response.Data(:,12); % deg
theta1 	= aircraft_response.Data(:,13); % deg
psi1  	= aircraft_response.Data(:,14); % deg
x1     	= aircraft_response.Data(:,15); % m
y1     	= aircraft_response.Data(:,16); % m
z1     	= aircraft_response.Data(:,17); % m
V1     	= aircraft_response.Data(:,18); % m

%%
load(response_files{2});

% Variables
t2      = aircraft_response.Time;

alpha2	= aircraft_response.Data(:,1);  % deg
beta2  	= aircraft_response.Data(:,2);  % deg
u2     	= aircraft_response.Data(:,3);  % m/s
v2    	= aircraft_response.Data(:,4);  % m/s
w2     	= aircraft_response.Data(:,5);  % m/s
p2    	= aircraft_response.Data(:,6);  % deg/s
q2    	= aircraft_response.Data(:,7);  % deg/s
r2    	= aircraft_response.Data(:,8);  % deg/s
dail2 	= aircraft_response.Data(:,9);  % deg
dele2 	= aircraft_response.Data(:,10); % deg
drud2  	= aircraft_response.Data(:,11); % deg
phi2   	= aircraft_response.Data(:,12); % deg
theta2 	= aircraft_response.Data(:,13); % deg
psi2  	= aircraft_response.Data(:,14); % deg
x2     	= aircraft_response.Data(:,15); % m
y2     	= aircraft_response.Data(:,16); % m
z2     	= aircraft_response.Data(:,17); % m
V2     	= aircraft_response.Data(:,18); % m

%% Without F_c
load(response_files{3});

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

%% With F_c
load(response_files{4});

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

%% CHECK
% load(response_files{5});
% 
% % Variables
% t5      = aircraft_response.Time;
% 
% alpha5	= aircraft_response.Data(:,1);  % deg
% beta5  	= aircraft_response.Data(:,2);  % deg
% u5   	= aircraft_response.Data(:,3);  % m/s
% v5    	= aircraft_response.Data(:,4);  % m/s
% w5    	= aircraft_response.Data(:,5);  % m/s
% p5     	= aircraft_response.Data(:,6);  % deg/s
% q5    	= aircraft_response.Data(:,7);  % deg/s
% r5    	= aircraft_response.Data(:,8);  % deg/s
% dail5 	= aircraft_response.Data(:,9);  % deg
% dele5 	= aircraft_response.Data(:,10); % deg
% drud5 	= aircraft_response.Data(:,11); % deg
% phi5   	= aircraft_response.Data(:,12); % deg
% theta5 	= aircraft_response.Data(:,13); % deg
% psi5   	= aircraft_response.Data(:,14); % deg
% x5     	= aircraft_response.Data(:,15); % m
% y5     	= aircraft_response.Data(:,16); % m
% z5     	= aircraft_response.Data(:,17); % m
% V5     	= aircraft_response.Data(:,18); % m

% % Data with less points (for plotting markers)
% N = 30;
% t5_reduced = t5(1:N:length(t5)); t5_reduced(length(t5_reduced)+1:length(t5)) = t5_reduced(end);
% q5_reduced = q5(1:N:length(q5)); q5_reduced(length(q5_reduced)+1:length(q5)) = q5_reduced(end);
% alpha5_reduced = alpha5(1:N:length(alpha5)); alpha5_reduced(length(alpha5_reduced)+1:length(alpha5)) = alpha5_reduced(end);
% x5_reduced = x5(1:N:length(x5)); x5_reduced(length(x5_reduced)+1:length(x5)) = x5_reduced(end);
% y5_reduced = y5(1:N:length(y5)); y5_reduced(length(y5_reduced)+1:length(y5)) = y5_reduced(end);
% z5_reduced = z5(1:N:length(z5)); z5_reduced(length(z5_reduced)+1:length(z5)) = z5_reduced(end);
% 
% % Data on just last point, need for legend
% t5_legend(1:length(q5),1) = t5_reduced(end);
% q5_legend(1:length(q5),1) = q5_reduced(end);
% alpha5_legend(1:length(alpha5),1) = alpha5_reduced(end);
% x5_legend(1:length(x5),1) = x5_reduced(end);
% y5_legend(1:length(y5),1) = y5_reduced(end);
% z5_legend(1:length(z5),1) = z5_reduced(end);

%%
fill = 100*ones(size(t1,1),1);

%% Plotting using tight_subplot

% %           x                                             x_min   x_max   x_spacing	y                                                                   y_min   y_max   y_spacing   y_label          	Colour    	Style
% plots= {    '[t1 t2 t3 t4 t5 t5_reduced t5_legend]'       0       10      1           '[q1 q2 q3 q4 q5 q5_reduced q5_legend]'                             -30     30     	10         	'$q$ (deg/s)'      	[0 0 0]   	'-|--|:|-.|-|x|-x' 
%             '[t1 t2 t3 t4 t5 t5_reduced t5_legend]'   	0       10      1           '[alpha1 alpha2 alpha3 alpha4 alpha5 alpha5_reduced alpha5_legend]'	0       6       2           '$\alpha$ (deg)'  	[0 0 0]   	'-|--|:|-.|-|x|-x'
%             '[t1 t2 t3 t4 t5 t5_reduced t5_legend]'   	0       10      1           '[z1 z2 z3 z4 z5 z5_reduced z5_legend]'                             -2      2       1           '$z$ (m)'        	[0 0 0]   	'-|--|:|-.|-|x|-x'
%             '[t1]'                                    	0       10      1           '[dele1]'                                                        	-4      -1      1           '$\delta_e$ (deg)' 	[0 0 0]  	'-|--|:|-.|-|x|-x'
%             };

%           x               	x_min   x_max   x_spacing	y                                 	y_min   y_max   y_spacing   y_label          	Colour    	Style
plots= {    '[t1 t2 t3 t4]'  	0       10      1           '[q1 q2 q3 q4]'                   	-30     30     	10         	'$q$ (deg/s)'      	[0 0 0]   	'-|--|:|-.|-|x|-x' 
            '[t1 t2 t3 t4]'   	0       10      1           '[alpha1 alpha2 alpha3 alpha4]'     0       6       2           '$\alpha$ (deg)'  	[0 0 0]   	'-|--|:|-.|-|x|-x'
            '[t1 t2 t3 t4]'   	0       10      1           '[z1 z2 z3 z4]'                    	-2      2       1           '$z$ (m)'        	[0 0 0]   	'-|--|:|-.|-|x|-x'
            '[t1]'             	0       10      1           '[dele1]'                          	-4      -1      1           '$\delta_e$ (deg)' 	[0 0 0]  	'-|--|:|-.|-|x|-x'
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
height=400;
set(gcf,'units','points','position',[x0,y0,width,height]); % Figure window

rows=size(plots,1);columns=1;
ha = tight_subplot(rows,columns,[.05 0],[.1 .05],[.15 .2]); % [gap_h gap_w], [lowermargin uppermargin], [leftmargin rightmargin]

for i=1:size(plots,1)
    set(groot,'defaultAxesColorOrder',cell2mat(plots(i,10)),...
      'defaultAxesLineStyleOrder',char(plots(i,11)))
  
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
        rectangle('Position',[2.5 -10 1 8--10]); % [X Y width height] (data units)
        % Zoomed section
        X = 0.43;
        Y = 0.785;
        W = 0.25;
        H = 0.15;
        axes('position',[X Y W H]) % [X Y width height]
        box on % put box around new pair of axes
        indexOfInterest = (t1 > 2.5) & (t1 < 3.5); % range of t near perturbation
        indexOfInterest2 = (t4 > 2.5) & (t4 < 3.5); % range of t near perturbation
        plot(t1(indexOfInterest),q1(indexOfInterest),...
             t2(indexOfInterest),q2(indexOfInterest),...
             t3(indexOfInterest),q3(indexOfInterest),...
             t4(indexOfInterest2),q4(indexOfInterest2)) % plot on new axes
        axis tight
    end
    
  	if i == 2
      	% Create rectangle on large plot
        axes(ha(i,:));
        rectangle('Position',[2.5 0.5 1 2.2-0.5]); % [X Y width height] (data units)
        % Zoomed section
        X = 0.43;
        Y = 0.56;
        W = 0.25;
        H = 0.15;
        axes('position',[X Y W H]) % [X Y width height]
        box on % put box around new pair of axes
        indexOfInterest = (t1 > 2.5) & (t1 < 3.5); % range of t near perturbation
        indexOfInterest2 = (t4 > 2.5) & (t4 < 3.5); % range of t near perturbation
        plot(t1(indexOfInterest),alpha1(indexOfInterest),...
             t2(indexOfInterest),alpha2(indexOfInterest),...
             t3(indexOfInterest),alpha3(indexOfInterest),...
             t4(indexOfInterest2),alpha4(indexOfInterest2)) % plot on new axes
        axis tight
    end
    
    % Finding and setting line style
    obj = findobj;
    for i = 1:length(obj)
        type = get(obj(i),'Type');
        if type(1:4) == 'line'
            set(obj(i),'linewidth',1.0);
            marker = get(obj(i),'Marker');
            if marker(1) == 'x'
                set(obj(i),'MarkerSize',6,...
                           'MarkerEdgeColor',[0 0 0],...
                           'MarkerFaceColor',[0 0 0],...
                           'linewidth',1.2);
            end
        end
    end
    
end

%% Legend
legend(h(1,[1 2 3 4]),{     'Unconstrained (with thrust)',...
                          	'Planar constrained (no thrust)',...
                            'Spherical constrained, no $F_c$ (no thrust)',...
                            'Spherical constrained, with $F_c$ (no thrust)'},...
    'FontUnits','points',...
    'interpreter','latex',...
    'FontSize',9,...
    'FontName','Times',...
    'Position',[0.84 0.93 0 0],'Units','normalized')

%% Creating .eps and .pdf files
pos = get(gcf, 'Position'); %// gives x left, y bottom, width, height
width = pos(3);
height = pos(4);
set(gcf,'PaperPositionMode','Auto','PaperUnits','points','PaperSize',[width,height])

% print -deps ShortPeriodPhugoid2.eps
% print('ShortPeriodPhugoid2','-dpdf','-opengl','-r1000')
% print('ShortPeriodPhugoid_doublet','-dpdf','-opengl','-r1000')