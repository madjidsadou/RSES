clear; clc;

% Read the 2015, 2024, and difference TIFF files
[RF2015, R2015] = geotiffread('classesRF2015.tif');
[RF2024, R2024] = geotiffread('classesRF2024.tif');
% [SVM2015, Ra2015] = geotiffread('classesSVM2015.tif');
% [SVM2024, Ra2024] = geotiffread('classesSVM2024.tif');
% [SVMdiff, Rf2015] = geotiffread('SVMdiff.tif');
% [RFdiff, Rf2024] = geotiffread('RFdiff.tif');

% Convert images to double for calculations
RF2015 = double(RF2015);
RF2024 = double(RF2024);
% SVM2015 = double(SVM2015);
% SVM2024 = double(SVM2024);
% SVMdiff = double(SVMdiff);
% RFdiff = double(RFdiff);

figure(1);
subplot(1,2,1);
worldmap(RF2015, R2015);
geoshow(RF2015, R2015, 'DisplayType', 'texturemap');
title('RF2015');

subplot(1,2,2);
worldmap(RF2024, R2024);
geoshow(RF2024, R2024, 'DisplayType', 'texturemap');
title('RF2024');

% subplot(2,3,4);
% worldmap(SVM2015, Ra2015);
% geoshow(SVM2015, Ra2015, 'DisplayType', 'texturemap');
% title('SVM2015');
% 
% subplot(2,3,5);
% worldmap(SVM2024, Ra2024);
% geoshow(SVM2024, Ra2024, 'DisplayType', 'texturemap');
% title('SVM2024');
% 
% subplot(2,3,6);
% worldmap(SVMdiff, Rf2015);
% geoshow(SVMdiff, Rf2015, 'DisplayType', 'texturemap');
% title('SVMdiff');
% 
% subplot(2,3,3);
% worldmap(RFdiff, Rf2024);
% geoshow(RFdiff, Rf2024, 'DisplayType', 'texturemap');
% title('RFdiff, Rf2024');
% 
% pixelArea = 10 * 10;
% 
% % Calculate the built-up area in each year
% builtArea2015 = sum(RF2015(:) == 2) * pixelArea / 1e6; % in square kilometers
% builtArea2024 = sum(RF2024(:) == 2) * pixelArea / 1e6; % in square kilometers
% diffbuiltArea2024 = sum(RFdiff(:) == 2) * pixelArea / 1e6; % in square kilometers
% 
% % % Calculate the difference in built-up area between 2024 and 2015
% % builtUpIncrease = sum(diffImage(:) == -1) * pixelArea / 1e6; % in square kilometers
% % builtUpDecrease = sum(diffImage(:) == 1) * pixelArea / 1e6; % in square kilometers
% 
% % Display results
% fprintf('Area covered by buildings in 2015: %.2f km^2\n', builtArea2015);
% fprintf('Area covered by buildings in 2024: %.2f km^2\n', builtArea2024);
% fprintf('Difference in Area covered by buildings: %.2f km^2\n', diffbuiltArea2024);
% 
% % fprintf('Increase in Built-up Area (2024 - 2015): %.2f km^2\n', builtUpIncrease);
% % fprintf('Decrease in Built-up Area (2015 - 2024): %.2f km^2\n', builtUpDecrease);
