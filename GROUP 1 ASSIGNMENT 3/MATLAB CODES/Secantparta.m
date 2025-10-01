% Define the function
f = @(x) 2*x.^2 - 5*x + 2;  

% Initial guesses
x0 = 0;
x1 = 1;

% Tolerance
tol = 1e-4;
max_iter = 100;

% Store iterations for plotting
iters = [x0, x1];
fx_vals = [f(x0), f(x1)];

% Secant Method iterations
for n = 1:max_iter
    % Compute next approximation
    x2 = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
    
    % Store values for plotting convergence
    iters (end+1) = x2;
    fx_vals (end+1) = f(x2);
    
    % Display current iteration
    fprintf('Iteration %d: x = %.6f, f(x) = %.6f\n', n, x2, f(x2));
    
    % Check stopping criteria
    if abs(x2 - x1) < tol
        fprintf('\nRoot found at x = %.6f with f(x) = %.6f\n', x2, f(x2));
        break;
    end
    
    % Update for next iteration
    x0 = x1;
    x1 = x2;
end

%% Plot the function and root
x = linspace(-2, 3, 500);
y = f(x);

figure;
plot(x, y, 'b-', 'LineWidth', 1.5); hold on;
yline(0, 'k--');
plot(iters, fx_vals, 'ro-', 'LineWidth', 1.5, 'MarkerSize', 6);
xlabel('x');
ylabel('f(x)');
title('Secant Method Convergence');
legend('f(x)', 'y=0', 'Secant Iterations');
grid on;