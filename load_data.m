
% Load and preprocess the BUSI and CBIS-DDSM datasets

clear; clc; close all;

% Define dataset directories
busidir = 'path_to_BUSI_dataset';
cbisdir = 'path_to_CBIS-DDSM_dataset';

% Load BUSI dataset
busifiles = dir(fullfile(busidir, '*.png'));
cbisfiles = dir(fullfile(cbisdir, '*.png'));

% Set image dimensions
img_size = [500 500]; % Resize images

% Load and preprocess images
BUSI_Data = [];
CBIS_Data = [];

for i = 1:length(busifiles)
    img = imread(fullfile(busidir, busifiles(i).name));
    img = imresize(img, img_size); % Resize
    BUSI_Data = cat(4, BUSI_Data, img);
end

for i = 1:length(cbisfiles)
    img = imread(fullfile(cbisdir, cbisfiles(i).name));
    img = imresize(img, img_size);
    CBIS_Data = cat(4, CBIS_Data, img);
end

% Normalize images
BUSI_Data = double(BUSI_Data) / 255;
CBIS_Data = double(CBIS_Data) / 255;

save('processed_data.mat', 'BUSI_Data', 'CBIS_Data');
disp('Dataset loaded and preprocessed successfully.');
