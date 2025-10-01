% Newton-Raphson Method for f(x) = 2^x - 5x + 2
clc; clear;

f  = @(x) 2.^x - 5.*x + 2;                 % function
df = @(x) log(2).*2.^x - 5;                % derivative

x = 0.5; tol = 1e-4; maxIter = 50;         % initial guess, tolerance, max iterations

fprintf('Newton-Raphson Method Iterations:\n');
fprintf('Iter\t x_n\t\t f(x_n)\n');

for k = 1:maxIter
    x_new = x - f(x)/df(x);                % update formula
    fprintf('%d\t %.6f\t %.6f\n', k, x_new, f(x_new));
    
    if abs(x_new - x) < tol                % stopping condition
        fprintf('\nRoot ≈ %.4f (to 4 d.p.)\n', x_new);
        root = x_new; break;
    end
    x = x_new;
end

% Plot function and root
xVals = -2:0.01:3;
plot(xVals, f(xVals), 'b-', 'LineWidth', 2); hold on;
yline(0, 'k--'); plot(root, f(root), 'ro','MarkerSize',8,'MarkerFaceColor','r');
xlabel('x'); ylabel('f(x)'); grid on;
title('Newton-Raphson: f(x) = 2^x - 5x + 2');
legend('f(x)','y=0','Root');