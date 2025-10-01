f = input('Enter the function: ');
to = input('Enter initial value of independent variable: ');
yo = input('Enter initial value of dependent variable: ');
h = input('Enter step size: ');
tn = input('Enter point at which you want to evaluate solution: ');

n = (tn - to)/h;
t(1) = to;
y(1) = yo(1);
z(1) = yo(2);

tic;
for i = 1:n
    t(i+1) = to + i*h;
    
    % RK2 method
    k1 = h * f(t(i), [y(i); z(i)]);
    k2 = h * f(t(i+1), [y(i)+k1(1); z(i)+k1(2)]);
   
    y(i+1) = y(i) + (k1(1) + k2(1))/2;
    z(i+1) = z(i) + (k1(2) + k2(2))/2;

    fprintf('y(%.2f) = %.4f\n', t(i+1), y(i+1));
end
toc;
% Plotting the solution
figure("Name","Numerical solution")
plot(t,y,'b-o',t,z,'g:*');
hold on;

% Highlighting y(0.1) point
plot(t(end), y(end), 'rs');

% Plot formatting
xlabel('x');
ylabel('y(x)');
title('Solution of y'' = 1 + 2xy - x^2z using Runge Kutta 2 Method');
grid on;
legend('Variables','Solution');

%Rungekutte second order Example
%Enter the function: @(x,yz)[yz(2); 1 + 2*x*yz(1)-x^2*yz(2)]
%Enter initial value of independent variable: 0
%Enter initial value of dependent variable: [1;0]
%Enter step size: 0.1
%Enter point at which you want to evaluate solution: 0.1

%z =

 %    0

%y(0.10) = 1.0050
%Elapsed time is 0.002270 seconds.