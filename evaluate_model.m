
% Evaluate model performance

clear; clc; load('trained_model.mat');

% Dummy labels for evaluation
trueLabels = randi([1 3], 100, 1);
predLabels = classify(trainedModel, rand(size(trueLabels, 1), size(fireflies, 2)));

% Compute metrics
confMat = confusionmat(trueLabels, predLabels);
precision = diag(confMat) ./ sum(confMat, 2);
recall = diag(confMat) ./ sum(confMat, 1)';
f1_score = 2 * (precision .* recall) ./ (precision + recall);

disp(['Precision: ', num2str(mean(precision))]);
disp(['Recall: ', num2str(mean(recall))]);
disp(['F1-Score: ', num2str(mean(f1_score))]);
