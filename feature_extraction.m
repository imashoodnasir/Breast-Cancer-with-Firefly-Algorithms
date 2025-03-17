
% Feature extraction using InceptionV3

clear; clc; load('processed_data.mat');

net = inceptionv3;
inputSize = net.Layers(1).InputSize;
layer = 'avg_pool'; % Feature extraction layer

% Resize images for compatibility
BUSI_Data_resized = imresize(BUSI_Data, [inputSize(1) inputSize(2)]);
CBIS_Data_resized = imresize(CBIS_Data, [inputSize(1) inputSize(2)]);

% Extract features
BUSI_Features = activations(net, BUSI_Data_resized, layer, 'OutputAs', 'rows');
CBIS_Features = activations(net, CBIS_Data_resized, layer, 'OutputAs', 'rows');

save('features.mat', 'BUSI_Features', 'CBIS_Features');
disp('Feature extraction completed.');
