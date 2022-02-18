clear,clc,close all;

press_to_continue = 0; % 1: Need to press enter to continue after each estimation

% filename = '01_short_period_phugoid_unconstrained_param_states';
% filename = '02_short_period_phugoid_spherical_constrained_0_6_param_states';
% filename = '03_short_period_phugoid_spherical_constrained_0_8_param_states';
% filename = '04_short_period_phugoid_spherical_constrained_1_0_param_states';
% filename = '05_short_period_phugoid_planar_constrained_param_states';
% filename = '21_short_period_phugoid_fixed_param_states';

param_file_list = dir('*param_states.mat');

% i:
% [29 35 31 33] for short-period parameter tests
% [36 42 38 40] for Dutch roll parameter tests

for i = [29 35 31 33] % [36 42 38 40] % [1 7 3 5] % 1:length(param_file_list)
    
    clc;
    
    save_to_excel = 1; % Flag to save to spreadsheet or not
    
    disp(['i = ' num2str(i)]);
    
    filename = param_file_list(i).name;
    
    disp('Filename:');
    disp(filename);
    disp(' ');
    
    load(filename);
    
    for ii = 1:size(param_states.Data,1)
        loads(ii,:) = estimated_loads(param_states.Data(ii,:)');
    end
    
    time = param_states.Time;
    
    L_estimated = loads(:,1); % (N) (wind axes)
    D_estimated = loads(:,2); % (N) (wind axes)
    Y_estimated = loads(:,3); % (N) (wind axes)
    l_estimated = loads(:,4); % (N.m) (body axes)
    m_estimated = loads(:,5); % (N.m) (body axes)
    n_estimated = loads(:,6); % (N.m) (body axes)
    dail = loads(:,7); % Aileron (rad)
    dele = loads(:,8); % Elevator (rad)
    drud = loads(:,9); % Rudder (rad)
    
    b_a = loads(end,10); % Wing span (m)
    c_a = loads(end,11); % Reference cord, MAC (m)
    S_a = loads(end,12); % Wing area (m^2)
    rho = loads(end,13); % Density (kg/m^3)];
    
    V = loads(:,14); % Aircraft total speed (m/s)
    p = loads(:,15); % (rad/sec) (body axes)
    q = loads(:,16); % (rad/sec) (body axes)
    r = loads(:,17); % (rad/sec) (body axes)
    
    alpha_rad = loads(:,18); % (rad)
    beta_rad = loads(:,19); % (rad)
    deltaT = param_states.Time(2)-param_states.Time(1); % Time step (s)
    alpha_dot = diff(alpha_rad)/deltaT; % (rad/s)
    alpha_dot(end+1) = alpha_dot(end); % So that matrix dimensions are consistent
    
    CL = L_estimated./(0.5.*rho.*V.^2.*S_a);
    CD = D_estimated./(0.5.*rho.*V.^2.*S_a);
    CY = Y_estimated./(0.5.*rho.*V.^2.*S_a);
    Cl = l_estimated./(0.5.*rho.*V.^2.*S_a.*b_a);
    Cm = m_estimated./(0.5.*rho.*V.^2.*S_a.*c_a);
    Cn = n_estimated./(0.5.*rho.*V.^2.*S_a.*b_a);
    
    % Detect input type:
    input_type = 0;
    disp('Input type:');
    if abs(max(abs(dail))-abs(dail(1)))*180/pi>0.01
        input_type = 1; % Aileron input
        disp('Aileron');
        ail = abs(max(abs(dail))-abs(dail(1)))*180/pi;
        ele = abs(max(abs(dele))-abs(dele(1)))*180/pi;
        rud = abs(max(abs(drud))-abs(drud(1)))*180/pi;
        disp(['Ail: ' num2str(ail) ', Elev: ' num2str(ele) ', Rud: ' num2str(rud)]);
    elseif abs(max(abs(dele))-abs(dele(1)))*180/pi>0.01
        input_type = 2; % Elevator input
        disp('Elevator');
        ail = abs(max(abs(dail))-abs(dail(1)))*180/pi;
        ele = abs(max(abs(dele))-abs(dele(1)))*180/pi;
        rud = abs(max(abs(drud))-abs(drud(1)))*180/pi;
        disp(['Ail: ' num2str(ail) ', Elev: ' num2str(ele) ', Rud: ' num2str(rud)]);
    elseif abs(max(abs(drud))-abs(drud(1)))*180/pi>0.01
        input_type = 3; % Rudder input
        disp('Rudder')
        ail = abs(max(abs(dail))-abs(dail(1)))*180/pi;
        ele = abs(max(abs(dele))-abs(dele(1)))*180/pi;
        rud = abs(max(abs(drud))-abs(drud(1)))*180/pi;
        disp(['Ail: ' num2str(ail) ', Elev: ' num2str(ele) ', Rud: ' num2str(rud)]);
    else
        disp('Control surface input not detected!');
        continue;
    end
    disp(' ');
    
    time_period = analysis_time(filename);
    disp('Analysis start and end times:');
    disp(time_period);
    startIdx = find(time==time_period(1));
    endIdx = find(time==time_period(2));
    
    % -> CL = CL_0 + CL_alpha*alpha + CL_alpha_dot*(c_a/(2*V))*alpha_dot + CL_q*(c_a/(2*V))*q + CL_dele*dele
    % -> CD = CD_0 + CD_alpha*alpha
    % -> CY = CY_beta*beta + CY_drud*drud
    % -> Cl = Cl_beta*beta + Cl_p*(b_a/(2*V))*p + Cl_r*(b_a/(2*V))*r + Cl_dail*dail + Cl_drud*drud
    % -> Cm = Cm_alpha*alpha + Cm_alpha_dot*(c_a/(2*V))*alpha_dot + Cm_q*(c_a/(2*V))*q + Cm_dele*dele
    % -> Cn = Cn_beta*beta + Cn_p*(b_a/(2*V))*p + Cn_r*(b_a/(2*V))*r + Cn_dail*dail + Cn_drud*drud
    
    if input_type == 1 % Aileron
        
        % -> CY = CY_beta*beta
        X_CY = [ beta_rad(startIdx:endIdx) ];
        estimated_CY_coeffs = ((X_CY'*X_CY)\X_CY')*CY(startIdx:endIdx);
        disp('Estimated CY coefficients: CY_beta');
        disp(estimated_CY_coeffs);
        % CY_beta         = -0.98;
        % CY_drud         = 0.17;
        data1 = estimated_CY_coeffs;
        
        % -> Cl = Cl_beta*beta + Cl_p*(b_a/(2*V))*p + Cl_r*(b_a/(2*V))*r + Cl_dail*dail
        X_Cl = [ beta_rad(startIdx:endIdx) (b_a./(2.*V(startIdx:endIdx))).*p(startIdx:endIdx) (b_a./(2.*V(startIdx:endIdx))).*r(startIdx:endIdx) dail(startIdx:endIdx) ];
        estimated_Cl_coeffs = ((X_Cl'*X_Cl)\X_Cl')*Cl(startIdx:endIdx);
        disp('Estimated Cl coefficients: Cl_beta Cl_p Cl_r Cl_dail');
        disp(estimated_Cl_coeffs);
        % Cl_beta         = -0.12;
        % Cl_p            = -0.26;
        % Cl_r            = 0.14;
        % Cl_dail         = -0.08;    % Sign changed for convention
        % Cl_drud         = 0.105;    % Sign changed for convention
        data2 = estimated_Cl_coeffs;
        
        % -> Cn = Cn_beta*beta + Cn_p*(b_a/(2*V))*p + Cn_r*(b_a/(2*V))*r + Cn_dail*dail
        X_Cn = [ beta_rad(startIdx:endIdx) (b_a./(2.*V(startIdx:endIdx))).*p(startIdx:endIdx) (b_a./(2.*V(startIdx:endIdx))).*r(startIdx:endIdx) dail(startIdx:endIdx) ];
        estimated_Cn_coeffs = ((X_Cn'*X_Cn)\X_Cn')*Cn(startIdx:endIdx);
        disp('Estimated Cn coefficients: Cn_beta Cn_p Cn_r Cn_dail');
        disp(estimated_Cn_coeffs);
        % Cn_beta         = 0.25;
        % Cn_p            = 0.022;
        % Cn_r            = -0.35;
        % Cn_dail         = -0.06;    % Sign changed for convention
        % Cn_drud         = -0.032;  	% Sign changed for convention
        data3 = estimated_Cn_coeffs;
        
    elseif input_type == 2 % Elevator
        
        % Including CLq:
        % -> CL = CL_0 + CL_alpha*alpha + CL_alpha_dot*(c_a/(2*V))*alpha_dot + CL_q*(c_a/(2*V))*q + CL_dele*dele
        % X_CL = [ ones(length(alpha_rad(startIdx:endIdx)),1) alpha_rad(startIdx:endIdx) c_a./(2.*V(startIdx:endIdx)).*alpha_dot(startIdx:endIdx) (c_a./(2.*V(startIdx:endIdx))).*q(startIdx:endIdx) dele(startIdx:endIdx) ];
        % Excluding CLq:
        % -> CL = CL_0 + CL_alpha*alpha + CL_alpha_dot*(c_a/(2*V))*alpha_dot + CL_dele*dele
        X_CL = [ ones(length(alpha_rad(startIdx:endIdx)),1) alpha_rad(startIdx:endIdx) (c_a./(2.*V(startIdx:endIdx))).*alpha_dot(startIdx:endIdx) dele(startIdx:endIdx) ];
        estimated_CL_coeffs = ((X_CL'*X_CL)\X_CL')*CL(startIdx:endIdx);
        disp('Estimated CL coefficients: CL0 CL_alpha CL_alpha_dot CL_dele');
        disp(estimated_CL_coeffs);
        % CL0             = 0.28;
        % CL_alpha        = 3.45;
        % CL_alpha_dot    = 0.72;
        % CL_q            = 0.0;
        % CL_dele         = 0.36;
        data1 = estimated_CL_coeffs;
        
        % -> CD = CD_0 + CD_alpha*alpha
        X_CD = [ ones(length(alpha_rad(startIdx:endIdx)),1) alpha_rad(startIdx:endIdx) ];
        estimated_CD_coeffs = ((X_CD'*X_CD)\X_CD')*CD(startIdx:endIdx);
        disp('Estimated CD coefficients: CD0 CD_alpha');
        disp(estimated_CD_coeffs);
        % CD0             = 0.03;
        % CD_alpha        = 0.30;
        data2 = estimated_CD_coeffs;
        
        %%%%%%%%%%%%%%%%%%%%%%%
        CL_0 = estimated_CL_coeffs(1);
        CL_alpha = estimated_CL_coeffs(2);
        CL_alpha_dot = estimated_CL_coeffs(3);
        CL_dele = estimated_CL_coeffs(4);
        
        v1 = CL_0*ones(length(time),1);
        v2 = CL_alpha*alpha_rad;
        v3 = CL_alpha_dot.*(c_a./(2.*V)).*alpha_dot;
        v4 = CL_dele*dele;
        
        CL_0            = 0.28;
        CL_alpha        = 3.45;
        CL_alpha_dot    = 0.72;
        CL_dele         = 0.36;
        
        v11 = CL_0*ones(length(time),1);
        v22 = CL_alpha*alpha_rad;
        v33 = CL_alpha_dot.*(c_a./(2.*V)).*alpha_dot;
        v44 = CL_dele*dele;
        
        CL2 = CL_0 + CL_alpha*alpha_rad + CL_alpha_dot.*(c_a./(2.*V)).*alpha_dot + CL_dele*dele;
        figure; plot(time,[CL CL2]); title('Total CL comparison'); hold on; legend('Actual CL', 'Estimated CL');
        figure; title('CL terms'); hold on;
        plot(time,v1,'r-',time,v11,'r--');
        plot(time,v2,'g-',time,v22,'g--');
        plot(time,v3,'b-',time,v33,'b--');
        plot(time,v4,'k-',time,v44,'k--');
        legend( 'CL_0 actual', 'CL_0 estimated',...
                'CL_{alpha}*alpha_{rad} actual', 'CL_{alpha}*alpha_{rad} estimated',...
                'CL_{alpha_{dot}}.*(c_a./(2.*V)).*alpha_{dot} actual', 'CL_{alpha_{dot}}.*(c_a./(2.*V)).*alpha_{dot} estimated',...
                'CL_{dele}*dele actual', 'CL_{dele}*dele estimated');
        figure; title('Elevator input'); plot(time,dele*180/pi);
        %%%%%%%%%%%%%%%%%%%%%%%
        
        if i == 21
            % -> Cm = Cm_alpha*alpha + Cm_(alpha_dot,q)*(c_a/(2*V))*q + Cm_dele*dele
            X_Cm = [ alpha_rad(startIdx:endIdx) (c_a./(2.*V(startIdx:endIdx))).*q(startIdx:endIdx) dele(startIdx:endIdx) ];
            disp('Estimated Cm coefficients: Cm_alpha Cm_(alpha_dot,q) Cm_dele');
        else
            % -> Cm = Cm_alpha*alpha + Cm_alpha_dot*(c_a/(2*V))*alpha_dot + Cm_q*(c_a/(2*V))*q + Cm_dele*dele
            X_Cm = [ alpha_rad(startIdx:endIdx) c_a./(2.*V(startIdx:endIdx)).*alpha_dot(startIdx:endIdx) (c_a./(2.*V(startIdx:endIdx))).*q(startIdx:endIdx) dele(startIdx:endIdx) ];
            disp('Estimated Cm coefficients: Cm_alpha Cm_alpha_dot Cm_q Cm_dele');
        end
        estimated_Cm_coeffs = ((X_Cm'*X_Cm)\X_Cm')*Cm(startIdx:endIdx);
        disp(estimated_Cm_coeffs);
        % Cm_alpha        = -0.38;
        % Cm_alpha_dot    = -1.1;
        % Cm_q            = -3.6;
        % Cm_dele         = -0.50;
        data3 = estimated_Cm_coeffs;
        
    elseif input_type == 3 % Rudder
        
        % -> CY = CY_beta*beta + CY_drud*drud
        X_CY = [ beta_rad(startIdx:endIdx) drud(startIdx:endIdx) ];
        estimated_CY_coeffs = ((X_CY'*X_CY)\X_CY')*CY(startIdx:endIdx);
        disp('Estimated CY coefficients: CY_beta CY_drud');
        disp(estimated_CY_coeffs);
        % CY_beta         = -0.98;
        % CY_drud         = 0.17;
        data1 = estimated_CY_coeffs;
        
        % -> Cl = Cl_beta*beta + Cl_p*(b_a/(2*V))*p + Cl_r*(b_a/(2*V))*r + Cl_drud*drud
        X_Cl = [ beta_rad(startIdx:endIdx) (b_a./(2.*V(startIdx:endIdx))).*p(startIdx:endIdx) (b_a./(2.*V(startIdx:endIdx))).*r(startIdx:endIdx) drud(startIdx:endIdx) ];
        estimated_Cl_coeffs = ((X_Cl'*X_Cl)\X_Cl')*Cl(startIdx:endIdx);
        disp('Estimated Cl coefficients: Cl_beta Cl_p Cl_r Cl_drud');
        disp(estimated_Cl_coeffs);
        % Cl_beta         = -0.12;
        % Cl_p            = -0.26;
        % Cl_r            = 0.14;
        % Cl_dail         = -0.08;    % Sign changed for convention
        % Cl_drud         = 0.105;    % Sign changed for convention
        data2 = estimated_Cl_coeffs;
        
        % -> Cn = Cn_beta*beta + Cn_p*(b_a/(2*V))*p + Cn_r*(b_a/(2*V))*r + Cn_drud*drud
        X_Cn = [ beta_rad(startIdx:endIdx) (b_a./(2.*V(startIdx:endIdx))).*p(startIdx:endIdx) (b_a./(2.*V(startIdx:endIdx))).*r(startIdx:endIdx) drud(startIdx:endIdx) ];
        estimated_Cn_coeffs = ((X_Cn'*X_Cn)\X_Cn')*Cn(startIdx:endIdx);
        disp('Estimated Cn coefficients: Cn_beta Cn_p Cn_r Cn_drud');
        disp(estimated_Cn_coeffs);
        % Cn_beta         = 0.25;
        % Cn_p            = 0.022;
        % Cn_r            = -0.35;
        % Cn_dail         = -0.06;    % Sign changed for convention
        % Cn_drud         = -0.032;  	% Sign changed for convention
        data3 = estimated_Cn_coeffs;
        
    end
    
    % Saving results in excel file
    if save_to_excel == 1
        excel_save(filename,data1,data2,data3,'Estimated_aerodynamic_parameters_EEM_with_Fc.xlsx');
    end
    
    if press_to_continue == 1
        disp('PRESS ENTER TO CONTINUE...');
        pause;
    end
    
    clearvars -except i param_file_list press_to_continue
    
end

clc;
disp('Parameter estimation complete!');
disp(' ');