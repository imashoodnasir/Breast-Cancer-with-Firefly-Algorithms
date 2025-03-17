% Compare accuracy with pre-trained models

clear; clc;
pretrained_accuracies = [81.5, 89.17, 89.49, 91.5, 97.38, 98.73, 99.53];
model_names = {'ResNet50', 'DenseNet', 'InceptionResNetV2', 'DarkNet-53', 'VGG16', 'InceptionV3', 'Self-InceptNet'};

% Plot comparison
bar(pretrained_accuracies);
set(gca, 'XTickLabel', model_names);
title('Accuracy Comparison');
ylabel('Accuracy (%)');
