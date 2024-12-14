clear; clc;

% Read the 2015, 2024, and difference TIFF files
[image2015, R2015] = geotiffread('builtUpAreas2015.tif');
[image2024, R2024] = geotiffread('builtUpAreas2024.tif');
[diffImage, Rdiff] = geotiffread('builddiff.tif');

% Convert images to double for calculations
image2015 = double(image2015);
image2024 = double(image2024);
diffImage = double(diffImage);

figure(1);
subplot(1,3,1);
worldmap(image2015, R2015);
geoshow(image2015, R2015, 'DisplayType', 'texturemap');
title('Built area in 2015');

subplot(1,3,2);
worldmap(image2024, R2024);
geoshow(image2024, R2024, 'DisplayType', 'texturemap');
title('Built area in 2024');

subplot(1,3,3);
worldmap(diffImage, Rdiff);
geoshow(diffImage, Rdiff, 'DisplayType', 'texturemap');
title('Difference in Built area between 2015 and 2024');

% Define pixel area in square meters (assuming 30m x 30m pixels)
pixelArea = 30 * 30;

% Calculate the built-up area in each year
builtArea2015 = sum(image2015(:) == 1) * pixelArea / 1e6; % in square kilometers
builtArea2024 = sum(image2024(:) == 1) * pixelArea / 1e6; % in square kilometers

% Calculate the difference in built-up area between 2024 and 2015
builtUpIncrease = sum(diffImage(:) == -1) * pixelArea / 1e6; % in square kilometers
builtUpDecrease = sum(diffImage(:) == 1) * pixelArea / 1e6; % in square kilometers

% Display results
fprintf('Built-up Area in 2015: %.2f km^2\n', builtArea2015);
fprintf('Built-up Area in 2024: %.2f km^2\n', builtArea2024);
fprintf('Increase in Built-up Area (2024 - 2015): %.2f km^2\n', builtUpIncrease);
fprintf('Decrease in Built-up Area (2015 - 2024): %.2f km^2\n', builtUpDecrease);
