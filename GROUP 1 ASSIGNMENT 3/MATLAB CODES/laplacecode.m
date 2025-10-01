clc; clear; close all;

%% Parameters
R = 10;                 % Resistance (Ohm)
L = 0.5;                % Inductance (H)
C = 100e-6;             % Capacitance (F)
V0 = 5;                 % Step input voltage (V)
Tfinal = 0.05;          % Simulation duration (s)
time = linspace(0, Tfinal, 1000);  % time vector for evaluation

%% Symbolic Laplace Solution
syms s t

% Step input in Laplace domain
V_s = V0/s;

% Transfer function for capacitor voltage
Vc_s = V_s / (L*C*s^2 + R*C*s + 1);

% Inverse Laplace transform
vc_t = ilaplace(Vc_s, s, t);

% Convert to numeric values
vc_numeric = double(subs(vc_t, t, time));

%% Plot
figure;
plot(time, vc_numeric, 'k', 'LineWidth', 2);
xlabel('Time (s)'); ylabel('Capacitor Voltage v_C(t) [V]');
title('Capacitor Voltage using Laplace Transform');
grid on;

%% Parameters
R = 10;                 % Resistance (Ohm)
L = 0.5;                % Inductance (H)
C = 100e-6;             % Capacitance (F)
V0 = 5;                 % Step input voltage (V)
Tfinal = 0.05;          % Simulation duration (s)
time = linspace(0, Tfinal, 1000);  % time vector for evaluation

%% Symbolic Laplace Solution
syms s t

% Step input in Laplace domain
V_s = V0/s;

% Transfer function for capacitor voltage
Vc_s = V_s / (L*C*s^2 + R*C*s + 1);

% Inverse Laplace transform
vc_t = ilaplace(Vc_s, s, t);

% Convert to numeric values
vc_numeric = double(subs(vc_t, t, time));

%% Plot
figure;
plot(time, vc_numeric, 'k', 'LineWidth', 2);
xlabel('Time (s)'); ylabel('Capacitor Voltage v_C(t) [V]');
title('Capacitor Voltage using Laplace Transform');
grid on;

% Create figure for flowchart
figure('Color','w');
axis off
hold on

% Block size
block_w = 0.3; 
block_h = 0.08;

% Define block positions (x,y,width,height)
pos1 = [0.35, 0.85, block_w, block_h]; % Start
pos2 = [0.35, 0.70, block_w, block_h]; % Define Parameters
pos3 = [0.35, 0.55, block_w, block_h]; % Laplace Transform Input
pos4 = [0.35, 0.40, block_w, block_h]; % Transfer Function
pos5 = [0.35, 0.25, block_w, block_h]; % Inverse Laplace
pos6 = [0.35, 0.10, block_w, block_h]; % Plot Output

% Draw rectangles (process blocks)
annotation('rectangle',pos1,'FaceColor',[0.8 0.9 1])
annotation('rectangle',pos2,'FaceColor',[0.9 1 0.8])
annotation('rectangle',pos3,'FaceColor',[1 0.9 0.7])
annotation('rectangle',pos4,'FaceColor',[1 1 0.7])
annotation('rectangle',pos5,'FaceColor',[0.9 0.8 1])
annotation('rectangle',pos6,'FaceColor',[1 0.8 0.8])

% Add text inside blocks
annotation('textbox',pos1,'String','Start','HorizontalAlignment','center','EdgeColor','none');
annotation('textbox',pos2,'String','Define R, L, C, V0, time','HorizontalAlignment','center','EdgeColor','none');
annotation('textbox',pos3,'String','Laplace of Step Input: V(s)=V0/s','HorizontalAlignment','center','EdgeColor','none');
annotation('textbox',pos4,'String','Form Transfer Function Vc(s)','HorizontalAlignment','center','EdgeColor','none');
annotation('textbox',pos5,'String','Apply Inverse Laplace → vc(t)','HorizontalAlignment','center','EdgeColor','none');
annotation('textbox',pos6,'String','Plot Capacitor Voltage','HorizontalAlignment','center','EdgeColor','none');

% Draw arrows between blocks
annotation('arrow',[0.48 0.48],[0.85 0.78])
annotation('arrow',[0.48 0.48],[0.70 0.63])
annotation('arrow',[0.48 0.48],[0.55 0.48])
annotation('arrow',[0.48 0.48],[0.40 0.33])
annotation('arrow',[0.48 0.48],[0.25 0.18])

title('Flowchart of Laplace Transform Solution','FontSize',12);


             


             

