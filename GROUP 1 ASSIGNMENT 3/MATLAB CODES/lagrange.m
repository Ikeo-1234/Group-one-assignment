x = input("Enter list of abscissas:");
y = input("Enter list of ordinates:");
n = length(x)-1; %size of the data pairs minus 1
sm = 0; %Summation variable

tic
for i = 1:n+1
    pr = 1;
    for j = 1:n+1
        if j ~= i
            xp = sym("xp");
            pr = pr * (xp-x(j))/(x(i)-x(j));
        end
    end
    pr = pr*y(i); %multiply the current y with pr
    sm = sm+pr; %add current term to polynomial
end
toc

sm;

disp("=== Lagrange Interpolating polynomial ===")
sm = simplify(sm); %simplify the equation

figure("Name","Langrange")
hold on;
plot(x,y,"bo") %plotting the cordinates
fplot(sm,[min(x)-1,max(x)+1],"g") %plotting the function

disp("=== Evaluate sm at point xp ===")
xp_apx = input("Enter the point to be approximated:"); 
y_val = subs(sm,sym('xp'),xp_apx); % substitute 'xp' with xp_val

% Plot the specific point approximated
plot(xp_apx,y_val,"c*", 'MarkerSize', 10, 'LineWidth', 2)

%Annotating the plot
xlabel('x')
ylabel('y')
title('Numerical approximation using Lagrange method')
legend('Cordinates','Function','Approximated point')
grid on;

% Display the result
fprintf('At x = %.4f, y = %.4f\n', xp_apx, double(y_val));

hold off;


%langrange Example
%Enter list of abscissas:[0 10 30 50 70 90]
%Enter list of ordinates:[23.0 46.8 58.6 75.7 78.9 80.2]
%Elapsed time is 1.257555 seconds.
%=== Lagrange Interpolating polynomial ===
%=== Evaluate sm at point xp ===
%Enter the point to be approximated:60
%At x = 60.0000, y = 80.6577