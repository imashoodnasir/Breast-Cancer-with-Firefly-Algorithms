
% Modified Firefly Algorithm (MVFA-I, MVFA-II, MVFA-III)

clear; clc; load('features.mat');

% Firefly Algorithm Parameters
num_fireflies = 150;
alpha = 0.0001; % Light absorption coefficient
T = 1000; % Maximum iterations
w_max = 0.9; w_min = 0.4; % Inertia weight range

% Initialize fireflies randomly
fireflies = rand(num_fireflies, size(BUSI_Features, 2));
fitness = zeros(num_fireflies, 1);

% Fitness function: Mean Square Error (example)
fitness_func = @(x) mean((x - mean(x)).^2);

% MVFA Optimization
for iter = 1:T
    w = w_max - ((w_max - w_min) / T) * iter; % MVFA-I
    
    for i = 1:num_fireflies
        % Compute fitness
        fitness(i) = fitness_func(fireflies(i, :));
        
        % Update positions using MVFA-II (Log-Sigmoid)
        M_hat = 1 / (1 + exp(-rand * iter / T));
        fireflies(i, :) = fireflies(i, :) + alpha * exp(-iter^2) * M_hat * (mean(fireflies) - fireflies(i, :));
    end
end

save('optimized_features.mat', 'fireflies');
disp('MVFA optimization completed.');
