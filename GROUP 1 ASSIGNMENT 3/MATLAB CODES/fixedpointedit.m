%input data
g = input('Enter your function: ');
xO = input('Enter initial guess: ');
e = input('Enter tolerance: ');
n = input('Enter no of iterations: ');
% Store all iterations
all_iterations = [];
all_values = [xO]; 
% Start with initial guess
for i = 1:n
    x1 = g(xO);    
% Store each iteration
all_iterations = [all_iterations, i];
all_values = [all_values, x1];
    xO = x1;
end
% Plot all points
figure;
plot(0:n, all_values, 'bo-', 'LineWidth', 2, 'MarkerFaceColor', 'blue', 'MarkerSize', 6);
xlabel('Iteration Number');
ylabel('x value');
title('Fixed-Point Iteration Convergence');
grid on;