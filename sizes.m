bacteria = imread("bacteria.bmp");
% Convert to binary image
bacteria_bin = bacteria < 100;

% Find the connected components
connected = bwconncomp(bacteria_bin);

% Create an array of sizes for each bacterium
sizes = zeros(connected.NumObjects, 1);
for i = 1:connected.NumObjects
    sizes(i) = size(cell2mat(connected.PixelIdxList(i)), 1);
end

% Display sizes of bacteria
total = sum(sizes);
disp("Total: " + total);
disp(sizes);