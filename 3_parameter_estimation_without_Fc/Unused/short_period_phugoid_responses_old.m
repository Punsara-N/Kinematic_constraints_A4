clear,clc,close all;

% plot_time = 20;
% 
% %%
% load('1_short_period&phugoid_unconstrained');
% 
% % Variables
% t = aircraft_response.Time;
% 
% alpha	= aircraft_response.Data(:,1);  % deg
% beta    = aircraft_response.Data(:,2);  % deg
% u       = aircraft_response.Data(:,3);  % m/s
% v       = aircraft_response.Data(:,4);  % m/s
% w       = aircraft_response.Data(:,5);  % m/s
% p       = aircraft_response.Data(:,6);  % deg/s
% q       = aircraft_response.Data(:,7);  % deg/s
% r       = aircraft_response.Data(:,8);  % deg/s
% dail    = aircraft_response.Data(:,9);  % deg
% dele    = aircraft_response.Data(:,10); % deg
% drud    = aircraft_response.Data(:,11); % deg
% phi   	= aircraft_response.Data(:,12); % deg
% theta   = aircraft_response.Data(:,13); % deg
% psi     = aircraft_response.Data(:,14); % deg
% z       = aircraft_response.Data(:,15); % m
% V       = aircraft_response.Data(:,16); % m
% 
% figure;
% subplot(4,1,1); plot(t,q); grid on; ylabel('q (deg/s)'); xlim([0 plot_time]); hold on;
% subplot(4,1,2); plot(t,alpha); grid on; ylabel('\alpha (deg)'); xlim([0 plot_time]); hold on;
% subplot(4,1,3); plot(t,z); grid on; ylabel('z (m)'); xlim([0 plot_time]); ylim([-2 2]); hold on;
% subplot(4,1,4); plot(t,dele); grid on; xlabel('Time (s)'); ylabel('\delta_e (deg)'); xlim([0 plot_time]); hold on;
% 
% %%
% load('2_short_period&phugoid_spherical_constrained_0_6');
% 
% % Variables
% t = aircraft_response.Time;
% 
% alpha	= aircraft_response.Data(:,1);  % deg
% beta    = aircraft_response.Data(:,2);  % deg
% u       = aircraft_response.Data(:,3);  % m/s
% v       = aircraft_response.Data(:,4);  % m/s
% w       = aircraft_response.Data(:,5);  % m/s
% p       = aircraft_response.Data(:,6);  % deg/s
% q       = aircraft_response.Data(:,7);  % deg/s
% r       = aircraft_response.Data(:,8);  % deg/s
% dail    = aircraft_response.Data(:,9);  % deg
% dele    = aircraft_response.Data(:,10); % deg
% drud    = aircraft_response.Data(:,11); % deg
% phi   	= aircraft_response.Data(:,12); % deg
% theta   = aircraft_response.Data(:,13); % deg
% psi     = aircraft_response.Data(:,14); % deg
% z       = aircraft_response.Data(:,15); % m
% V       = aircraft_response.Data(:,16); % m
% 
% subplot(4,1,1); plot(t,q); grid on; ylabel('q (deg/s)'); xlim([0 plot_time]); hold on;
% subplot(4,1,2); plot(t,alpha); grid on; ylabel('\alpha (deg)'); xlim([0 plot_time]); hold on;
% subplot(4,1,3); plot(t,z); grid on; ylabel('z (m)'); xlim([0 plot_time]); ylim([-2 2]); hold on;
% subplot(4,1,4); plot(t,dele); grid on; xlabel('Time (s)'); ylabel('\delta_e (deg)'); xlim([0 plot_time]); hold on;
% 
% %%
% load('3_short_period&phugoid_spherical_constrained_0_8');
% 
% % Variables
% t = aircraft_response.Time;
% 
% alpha	= aircraft_response.Data(:,1);  % deg
% beta    = aircraft_response.Data(:,2);  % deg
% u       = aircraft_response.Data(:,3);  % m/s
% v       = aircraft_response.Data(:,4);  % m/s
% w       = aircraft_response.Data(:,5);  % m/s
% p       = aircraft_response.Data(:,6);  % deg/s
% q       = aircraft_response.Data(:,7);  % deg/s
% r       = aircraft_response.Data(:,8);  % deg/s
% dail    = aircraft_response.Data(:,9);  % deg
% dele    = aircraft_response.Data(:,10); % deg
% drud    = aircraft_response.Data(:,11); % deg
% phi   	= aircraft_response.Data(:,12); % deg
% theta   = aircraft_response.Data(:,13); % deg
% psi     = aircraft_response.Data(:,14); % deg
% z       = aircraft_response.Data(:,15); % m
% V       = aircraft_response.Data(:,16); % m
% 
% subplot(4,1,1); plot(t,q); grid on; ylabel('q (deg/s)'); xlim([0 plot_time]); hold on;
% subplot(4,1,2); plot(t,alpha); grid on; ylabel('\alpha (deg)'); xlim([0 plot_time]); hold on;
% subplot(4,1,3); plot(t,z); grid on; ylabel('z (m)'); xlim([0 plot_time]); ylim([-2 2]); hold on;
% subplot(4,1,4); plot(t,dele); grid on; xlabel('Time (s)'); ylabel('\delta_e (deg)'); xlim([0 plot_time]); hold on;
% 
% %%
% load('4_short_period&phugoid_spherical_constrained_1_0');
% 
% % Variables
% t = aircraft_response.Time;
% 
% alpha	= aircraft_response.Data(:,1);  % deg
% beta    = aircraft_response.Data(:,2);  % deg
% u       = aircraft_response.Data(:,3);  % m/s
% v       = aircraft_response.Data(:,4);  % m/s
% w       = aircraft_response.Data(:,5);  % m/s
% p       = aircraft_response.Data(:,6);  % deg/s
% q       = aircraft_response.Data(:,7);  % deg/s
% r       = aircraft_response.Data(:,8);  % deg/s
% dail    = aircraft_response.Data(:,9);  % deg
% dele    = aircraft_response.Data(:,10); % deg
% drud    = aircraft_response.Data(:,11); % deg
% phi   	= aircraft_response.Data(:,12); % deg
% theta   = aircraft_response.Data(:,13); % deg
% psi     = aircraft_response.Data(:,14); % deg
% z       = aircraft_response.Data(:,15); % m
% V       = aircraft_response.Data(:,16); % m
% 
% subplot(4,1,1); plot(t,q); grid on; ylabel('q (deg/s)'); xlim([0 plot_time]); hold on;
% subplot(4,1,2); plot(t,alpha); grid on; ylabel('\alpha (deg)'); xlim([0 plot_time]); hold on;
% subplot(4,1,3); plot(t,z); grid on; ylabel('z (m)'); xlim([0 plot_time]); ylim([-2 2]); hold on;
% subplot(4,1,4); plot(t,dele); grid on; xlabel('Time (s)'); ylabel('\delta_e (deg)'); xlim([0 plot_time]); hold on;
% 
% %%
% load('5_short_period&phugoid_planar_constrained');
% 
% % Variables
% t = aircraft_response.Time;
% 
% alpha	= aircraft_response.Data(:,1);  % deg
% beta    = aircraft_response.Data(:,2);  % deg
% u       = aircraft_response.Data(:,3);  % m/s
% v       = aircraft_response.Data(:,4);  % m/s
% w       = aircraft_response.Data(:,5);  % m/s
% p       = aircraft_response.Data(:,6);  % deg/s
% q       = aircraft_response.Data(:,7);  % deg/s
% r       = aircraft_response.Data(:,8);  % deg/s
% dail    = aircraft_response.Data(:,9);  % deg
% dele    = aircraft_response.Data(:,10); % deg
% drud    = aircraft_response.Data(:,11); % deg
% phi   	= aircraft_response.Data(:,12); % deg
% theta   = aircraft_response.Data(:,13); % deg
% psi     = aircraft_response.Data(:,14); % deg
% z       = aircraft_response.Data(:,15); % m
% V       = aircraft_response.Data(:,16); % m
% 
% subplot(4,1,1); plot(t,q); grid on; ylabel('q (deg/s)'); xlim([0 plot_time]); hold on;
% subplot(4,1,2); plot(t,alpha); grid on; ylabel('\alpha (deg)'); xlim([0 plot_time]); hold on;
% subplot(4,1,3); plot(t,z); grid on; ylabel('z (m)'); xlim([0 plot_time]); ylim([-2 2]); hold on;
% subplot(4,1,4); plot(t,dele); grid on; xlabel('Time (s)'); ylabel('\delta_e (deg)'); xlim([0 plot_time]); hold on;
% 
% subplot(4,1,1);
% legend( 'Unconstrained',...
%         'Spherical constrained r=0.6m',...
%         'Spherical constrained r=0.8m',...
%         'Spherical constrained r=1.0m',...
%         'Planar constrained')
    
%%
load('1_short_period_phugoid_unconstrained');

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
z1     	= aircraft_response.Data(:,15); % m
V1     	= aircraft_response.Data(:,16); % m

%%
load('2_short_period_phugoid_spherical_constrained_0_6');

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
z2    	= aircraft_response.Data(:,15); % m
V2     	= aircraft_response.Data(:,16); % m

%%
load('3_short_period_phugoid_spherical_constrained_0_8');

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
z3    	= aircraft_response.Data(:,15); % m
V3     	= aircraft_response.Data(:,16); % m

%%
load('4_short_period_phugoid_spherical_constrained_1_0');

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
z4    	= aircraft_response.Data(:,15); % m
V4     	= aircraft_response.Data(:,16); % m

%%
load('5_short_period_phugoid_planar_constrained');

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
z5     	= aircraft_response.Data(:,15); % m
V5    	= aircraft_response.Data(:,16); % m

%%
fill = 100*ones(size(t1,1),1);

%% Plotting using tight_subplot

%           x       x_min   x_max   x_spacing	y                                       y_min   y_max   y_spacing   y_label          	Colour    	Style
plots= {    't1'  	0       10      1           '[q1 q2 q3 q4 q5]'                      -30     30     	10         	'$q$ (deg/s)'      	[0 0 0]   	'-|--|:|-.' 
            't2'   	0       10      1           '[alpha1 alpha2 alpha3 alpha4 alpha5]' 	0       6       2           '$\alpha$ (deg)'  	[0 0 0]   	'-|--|:|-.'
            't3'  	0       10      1           '[z1 z2 z3 z4 z5]'                      -2      2       1           '$z$ (m)'        	[0 0 0]   	'-|--|:|-.'
            't4'   	0       10      1           '[dele1]'                               -4      -1      1           '$\delta_e$ (deg)' 	[0 0 0]  	'-|--|:|-.'
            };
% RGB = [1 0 0;0 1 0;0 0 1;1 0 1]
% Black = [0 0 0]
        
width=8;height=8;
rows=size(plots,1);columns=1;
x0=1;y0=2;
figure('Units','inches','Position',[x0 y0 width height],'PaperPositionMode','auto');
ha = tight_subplot(rows,columns,[.05 0],[.1 .15],[.17 .1]); % [gap_h gap_w], [lowermargin uppermargin], [leftmargin rightmargin]

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

    if i == 1 % Plotting free-flight case
        hold;h(5)=line_fewer_markers(t5,q5,50,'-x','Spacing','x','markersize',6);
    end
    if i == 2 % Plotting free-flight case
        hold;line_fewer_markers(t5,alpha5,50,'-x','Spacing','x','markersize',6);
    end
    if i == 3 % Plotting free-flight case
        hold;line_fewer_markers(t5,z5,20,'-x','Spacing','x','markersize',6);
    end
    
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
        rectangle('Position',[2.5 -10 1 15]); % [X Y width height] (data units)
        % Zoomed section
        X = 0.65;
        Y = 0.82;
        W = 0.25;
        H = 0.15;
        axes('position',[X Y W H]) % [X Y width height]
        box on % put box around new pair of axes
        indexOfInterest = (t1 > 2.5) & (t1 < 3.5); % range of t near perturbation
        plot(t1(indexOfInterest),q1(indexOfInterest),...
             t2(indexOfInterest),q2(indexOfInterest),...
             t3(indexOfInterest),q3(indexOfInterest),...
             t4(indexOfInterest),q4(indexOfInterest)) % plot on new axes
       	line_fewer_markers(t5(indexOfInterest),q5(indexOfInterest),10,'-x','Spacing','x','markersize',6);
        axis tight
    end
    
  	if i == 2
      	% Create rectangle on large plot
        axes(ha(i,:));
        rectangle('Position',[2.5 0.5 1 1.5]); % [X Y width height] (data units)
        % Zoomed section
        X = 0.65;
        Y = 0.58;
        W = 0.25;
        H = 0.15;
        axes('position',[X Y W H]) % [X Y width height]
        box on % put box around new pair of axes
        indexOfInterest = (t1 > 2.5) & (t1 < 3.5); % range of t near perturbation
        plot(t1(indexOfInterest),alpha1(indexOfInterest),...
             t2(indexOfInterest),alpha2(indexOfInterest),...
             t3(indexOfInterest),alpha3(indexOfInterest),...
             t4(indexOfInterest),alpha4(indexOfInterest)) % plot on new axes
       	line_fewer_markers(t5(indexOfInterest),alpha5(indexOfInterest),10,'-x','Spacing','x','markersize',6);
        axis tight
    end
    
end

%% Legend
legend(h(1,[1 2 3 4 5]),{	'Unconstrained',...
                            'Spherical constrained r=0.6m',...
                            'Spherical constrained r=0.8m',...
                            'Spherical constrained r=1.0m',...
                            'Planar constrained'},...
    'FontUnits','points',...
    'interpreter','latex',...
    'FontSize',9,...
    'FontName','Times',...
    'Position',[0.3 0.92 0 0],'Units','normalized')

print -deps2 ShortPeriodPhugoid.eps
