function out = globalContrastFactor(im)
%im = 'C:\Users\User\Desktop\JK\img\oo.jpg';
%im = uint8(im);
superpixels = [1 2 4 8 16 25 50 100 200];

% Convert colour to grayscale
if size(im, 3) ~= 1
    im = rgb2gray(im);
end

% Convert to double precision and normalize
im = im2double(im);

% Stores resized image
im_resize = im;

out = 0; % Output GCF measure

% For each superpixel scale...
for ii = 1 : 9
    
    % Resize the image as per the paper
    if ii ~= 1
        im_resize = imresize(im, 1.0 / superpixels(ii), 'bilinear');
    end
    
    % Compute perceptual luminance
    l_resize = 100 * ((im_resize * 2.2).^(0.5));

    % Determine an array of scales where when we sum up the local
    % differences, we divide by a certain value.  4 is when we have
    % all valid neighbours, 3 is when we're at a border and 2 is when
    % we are at any of the four corners.
    scale = 4 * ones(size(l_resize));
    scale(:, [1 end]) = 3;
    scale([1 end], :) = 3;    
    scale([1 end], [1 end]) = 2;
    
    % Pad the image with a one pixel border
    l_pad = zeros(size(l_resize) + 2);
    l_pad(2:end-1,2:end-1) = l_resize;
    
    % Calculate the local differences
    left = abs(l_resize - l_pad(2:end-1,1:end-2));
    up = abs(l_resize - l_pad(1:end-2,2:end-1));
    right = abs(l_resize - l_pad(2:end-1, 3:end));
    down = abs(l_resize - l_pad(3:end, 2:end-1));
    
    % Zero out those locations that do not have valid neighbours
    left(:, 1) = 0;
    up(1, :) = 0;
    right(:, end) = 0;
    down(end, :) = 0;
    
    % Calculate the local contrast for this superpixel scale    
    lc_scale = (left + right + up + down) ./ scale; 
    
    % Calculate the weight at this superpixel scale
    wi = (-0.406385 * (ii / 9) + 0.334573) * (ii / 9) + 0.0877526;
    
    % Now calculate the GCF at this     
    out = out + wi * mean(lc_scale(:));
end