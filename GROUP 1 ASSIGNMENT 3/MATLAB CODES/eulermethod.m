%% Solution of x'' + 2x' + 5x = 3cos(2t) using Euler's Formula

%Parameters
% Differential equation: x'' + 2x' + 5x = 3cos(2t)
% Initial conditions: x(0) = 0, x'(0) = 0

%STEP ONE: Solve homogeneous equation
% Characteristic equation: r^2 + 2r + 5 = 0
r = roots([1 2 5]);

% Homogeneous solution: x_h(t) = e^(-t)(Acos(2t) + Bsin(2t))
alpha = -real(r(1));  
% Damping coefficient
omega_d = imag(r(1));
% Damped natural frequency

%STEP TWO : Find particular solution using the complex method
% Solve complexified equation: z'' + 2z' + 5z = 3e^(i2t)
% Assume z_p(t) = C*e^(i2t)

% Complex amplitude C = 3/(1 + 4i)
C = 3/(1 + 4i);

%STEP THREE: Complete solution using the initial conditions
% x(t) = e^(-t)(Acos(2t) + Bsin(2t)) + (3/17)cos(2t) + (12/17)sin(2t)

% Apply initial conditions:
% x(0) = A + 3/17 = 0 => A = -3/17
% x'(0) = -A + 2B + 24/17 = 0 => B = -27/34

A = -3/17;
B = -27/34;

%STEP FOUR: Define the complete solution function
syms t;
x_h = exp(-t)*(A*cos(2*t) + B*sin(2*t));
x_p = (3/17)*cos(2*t) + (12/17)*sin(2*t);
x_total = x_h + x_p;

%STEP FIVE: Numerical Evaluation at specific times
% Convert to MATLAB function for numerical evaluation
x_func = matlabFunction(x_total);

% Evaluate at t = 2 seconds
t2 = 2;
x2 = x_func(t2);

% Evaluate at multiple time points for plotting
t_span = linspace(0, 10, 1000);
x_values = x_func(t_span);

%STEP SIX: Plot the solution
figure('Name','plot one');

% Main response plot
subplot(2,2,1);
plot(t_span, x_values, 'b-', 'LineWidth', 2);
hold on;
plot(t2, x2, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'red');
grid on;
xlabel('Time (s)');
ylabel('Displacement x(t)');
title('Response of Damped Driven Oscillator');
legend('x(t)', 'x(2)', 'Location', 'best');

% Plot homogeneous and particular solutions separately
subplot(2,2,2);
x_h_values = double(subs(x_h, t, t_span));
x_p_values = double(subs(x_p, t, t_span));
plot(t_span, x_h_values, 'r--', 'LineWidth', 1.5);
hold on;
plot(t_span, x_p_values, 'g--', 'LineWidth', 1.5);
plot(t_span, x_values, 'b-', 'LineWidth', 2);
grid on;
xlabel('Time (s)');
ylabel('Displacement');
title('Solution Components');
legend('Homogeneous', 'Particular', 'Total', 'Location', 'best');

% Phase portrait
subplot(2,2,3);
x_dot = diff(x_total, t);
x_dot_func = matlabFunction(x_dot);
x_dot_values = x_dot_func(t_span);
plot(x_values, x_dot_values, 'm-', 'LineWidth', 2);
hold on;
plot(x2, x_dot_func(t2), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'red');
grid on;
xlabel('Displacement x(t)');
ylabel('Velocity dx/dt');
title('Phase Portrait');

% Frequency analysis
subplot(2,2,4);
% Driving frequency
f_drive = 2/(2*pi);
% Natural frequency (undamped)
omega_n = sqrt(5);
f_natural = omega_n/(2*pi);
% Damped frequency
f_damped = omega_d/(2*pi);

frequencies = [f_natural, f_damped, f_drive];
labels = {'Natural', 'Damped', 'Driving'};
bar(frequencies);
set(gca, 'XTickLabel', labels);
ylabel('Frequency (Hz)');
title('System Frequencies');

% Display final answer
fprintf('FINAL ANSWER:\n');




