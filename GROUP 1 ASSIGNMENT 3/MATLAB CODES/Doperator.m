% Step 1: Define symbols
syms t y(t)

% Step 2: Define derivatives
D = diff(y, t);        
% First derivative
D2 = diff(y, t, 2);    
% Second derivative

% Step 3: Write the equation
ode = D2 + 3*D + 2*y == 0;

% Step 4: Set initial conditions
cond1 = y(0) == 1;     
cond2 = D(0) == 0;     
conds = [cond1, cond2];

% Step 5: Solve
ySol(t) = dsolve(ode, conds);

% Step 6: Display
fprintf('Analytical Solution:\n')
pretty(ySol)

% Step 7: Plot
fplot(ySol, [0 5])
xlabel('t')
ylabel('y(t)')
title('Solution of y'''' + 3y'' + 2y = 0')
grid on