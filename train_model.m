
% Train the Self-InceptNet model

clear; clc; load('optimized_features.mat');

% Define model architecture
layers = [
    featureInputLayer(size(fireflies,2))
    fullyConnectedLayer(256)
    batchNormalizationLayer
    reluLayer
    fullyConnectedLayer(3)
    softmaxLayer
    classificationLayer
];

% Training options
options = trainingOptions('adam', ...
    'MaxEpochs', 40, ...
    'MiniBatchSize', 64, ...
    'Shuffle', 'every-epoch', ...
    'Plots', 'training-progress');

% Train the model
trainedModel = trainNetwork(fireflies, randi([1 3], size(fireflies, 1), 1), layers, options);
save('trained_model.mat', 'trainedModel');
disp('Model training completed.');
