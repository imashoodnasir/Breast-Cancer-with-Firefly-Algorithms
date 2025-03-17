
% Plot training accuracy and fitness values

clear; clc;
load('optimized_features.mat');

% Plot fitness values
figure;
plot(fireflies);
title('Fitness Values Across Iterations');
xlabel('Iterations');
ylabel('Fitness Value');
