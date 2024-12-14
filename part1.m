clear; clf; home;

% Load TIFF images
[image, R] = geotiffread('classified2015.tif');
[image2, R2] = geotiffread('classified2024.tif');
[image3, R3] = geotiffread('myExportImageTask.tif');

% Convert to double for calculations
image = double(image);
image2 = double(image2);
image3 = double(image3);

figure(1);
subplot(1,3,1);
worldmap(image, R);
geoshow(image, R, 'DisplayType', 'texturemap');
title('Vegetation in 2015');

subplot(1,3,2);
worldmap(image2, R2);
geoshow(image2, R2, 'DisplayType', 'texturemap');
title('Vegetation in 2024');

subplot(1,3,3);
worldmap(image3, R3);
geoshow(image3, R3, 'DisplayType', 'texturemap');
title('Difference in Vegetation between 2015 and 2024');


% Define parameters
pixelArea = 30 * 30;  % Pixel area in square meters (for 30m resolution)
vegetationClasses = [1, 2, 3]; % Assuming classes 1, 2, 3 for vegetation density

% Initialize area results
area2015 = zeros(1, length(vegetationClasses));
area2024 = zeros(1, length(vegetationClasses));

for i = 1:length(vegetationClasses)
    classValue = vegetationClasses(i);

    % Calculate area for each class in 2015
    numPixels2015 = sum(image(:) == classValue);  % Added (:)
    area2015(i) = numPixels2015 * pixelArea / 1e6; % Convert to km^2

    % Calculate area for each class in 2024
    numPixels2024 = sum(image2(:) == classValue);  % Added (:)
    area2024(i) = numPixels2024 * pixelArea / 1e6; % Convert to km^2

    % Print results
    fprintf('Vegetation Class %d:\n', classValue);
    fprintf('  Area in 2015: %.2f km^2\n', area2015(i));
    fprintf('  Area in 2024: %.2f km^2\n', area2024(i));
    fprintf('  Difference (2024 - 2015): %.2f km^2\n', area2024(i) - area2015(i));
end
