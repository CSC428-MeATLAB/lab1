im = imread("bacteria.bmp");
im = im < 100;
im = bwlabel(im);
s = regionprops(im,'centroid');
centroids = cat(1,s.Centroid);    
im = label2rgb(im);
items = size(centroids, 1);
for i=1:items
    im = insertText(im,[centroids(i,1) centroids(i,2)], i, 'BoxOpacity', 0, 'AnchorPoint','Center');
end
imshow(im);
