%% Drone Distance Estimation using Trapezoidal Rule

% Given data: Time and velocity measurements
time = [0, 2, 4, 6, 8]; 
velocity = [5, 8, 12, 10, 6];  
%% METHOD 1: Trapezoidal Rule Calculation
% Using the formula: Distance = (Δt/2) * [v0 + 2v1 + 2v2 + ... + 2vn-1 + vn]

dt = time(2) - time(1); 
n = length(velocity) - 1;  

% Apply trapezoidal rule
distance_trapz = (dt/2) * (velocity(1) + velocity(end) + 2*sum(velocity(2:end-1)));
%% METHOD 2: Using MATLAB's built-in trapz function
distance_builtin = trapz(time, velocity);
%% METHOD 3: Numerical integration with verification
distance_alt = 0;
for i = 1:length(time)-1
    segment_distance = (velocity(i) + velocity(i+1)) * dt / 2;
    distance_alt = distance_alt + segment_distance;
end
%% Visualization
figure('Position', [100, 100, 1200, 800]);

% Plot 1: Velocity vs Time with trapezoids
subplot(2,2,1);
plot(time, velocity, 'bo-', 'LineWidth', 2, 'MarkerSize', 8, 'MarkerFaceColor', 'b');
hold on;

% Shade the trapezoids
for i = 1:length(time)-1
    x = [time(i), time(i+1), time(i+1), time(i)];
    y = [0, 0, velocity(i+1), velocity(i)];
    fill(x, y, 'r', 'FaceAlpha', 0.3, 'EdgeColor', 'r');
end

grid on;
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velocity vs Time with Trapezoidal Areas');
legend('Velocity data', 'Trapezoidal areas', 'Location', 'northeast');

% Plot 2: Cumulative distance
subplot(2,2,2);
cumulative_distance = zeros(1, length(time));
for i = 2:length(time)
cumulative_distance(i) = cumulative_distance(i-1) + ...
                            (velocity(i-1) + velocity(i)) * dt / 2;
end

plot(time, cumulative_distance, 'g-s', 'LineWidth', 2, 'MarkerSize', 6, 'MarkerFaceColor', 'g');
grid on;
xlabel('Time (s)');
ylabel('Cumulative Distance (m)');
title('Cumulative Distance Traveled');

for i = 1:length(time)    
end

% Plot 3: Comparison of methods
subplot(2,2,3);
methods = {'Manual Trapz', 'MATLAB trapz', 'Segment Calc'};
distances = [distance_trapz, distance_builtin, distance_alt];
bar(distances);
set(gca, 'XTickLabel', methods);
ylabel('Distance (m)');
title('Comparison of Calculation Methods');
grid on;

% Add value labels on bars
for i = 1:length(distances)
    text(i, distances(i)+0.1, sprintf('%.3f', distances(i)), ...
         'HorizontalAlignment', 'center', 'FontWeight', 'bold');
end

% Plot 4: Error analysis
subplot(2,2,4);
errors = abs(distances - mean(distances));
bar(errors);
set(gca, 'XTickLabel', methods);
ylabel('Absolute Error (m)');
title('Error Analysis (Deviation from Mean)');
grid on;

for i = 1:length(errors)
    text(i, errors(i)+0.001, sprintf('%.6f', errors(i)), ...
         'HorizontalAlignment', 'center', 'FontWeight', 'bold');
end


   
