
% Generate and visualize confusion matrices

clear; clc; load('trained_model.mat');

% Generate confusion matrix
trueLabels = randi([1 3], 100, 1);
predLabels = classify(trainedModel, rand(size(trueLabels, 1), size(fireflies, 2)));
confMat = confusionmat(trueLabels, predLabels);

% Display confusion matrix
figure;
confusionchart(confMat);
title('Confusion Matrix');
