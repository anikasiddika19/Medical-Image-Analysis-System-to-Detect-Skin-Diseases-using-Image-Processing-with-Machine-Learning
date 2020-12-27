image = im2double(imread('.jpg'));
grayscale = rgb2gray(image);
mediatedImage = medfilt2(grayscale);
%get hairs using bottomhat filter
se = strel('disk',5);
hairs = imbothat(mediatedImage,se);
lab_mask = bwlabel(hairs); 
stats = regionprops(lab_mask, 'MajorAxisLength', 'MinorAxisLength'); 
%identifies long, thin objects 
Aaxis = [stats.MajorAxisLength]; 
Iaxis = [stats.MinorAxisLength]; 
idx = find((Aaxis ./ Iaxis) > 4); % Selects regions that meet logic check 
out_mask = ismember(lab_mask, idx);
disp(out_mask);
%replacedImage = roifill(image, hairs);
figure, imshow(out_mask);