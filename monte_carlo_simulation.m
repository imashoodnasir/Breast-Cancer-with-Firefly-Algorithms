% 07_monte_carlo_simulation.m
% Perform Monte Carlo simulations

clear; clc;
num_simulations = 100;
accuracy_results = zeros(num_simulations, 1);

for i = 1:num_simulations
    accuracy_results(i) = rand() * 100; % Simulated accuracy
end

disp(['Mean Accuracy: ', num2str(mean(accuracy_results))]);
