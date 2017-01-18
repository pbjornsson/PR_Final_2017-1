%% HERE RAW DATA IS PREPROCESSED 
function processed_data = ugly_to_nice(raw_data);
%%
% determine size of each class:
class_size = size(raw_data, 1) / 10;

% get labels from the data
labels = getlabels(raw_data);
se = strel('disk',1);

% iterate over all data
for ii = 0:9 % number (class)
    for jj = 1:class_size % iterate over all items in each class
        idx = class_size * ii + jj; % index understandable for matlab
        proc_num = raw_data(idx); % load single number for preprocessing
        im_num = data2im(proc_num); % convert PRTools datafile to image
        im_num2 = bwareaopen(im_num,30); % delete small objects (noise)
        im_num3 = imclose(im_num2, se);
        im_num3 = imerode(im_num3, se);
        im_num3 = imdilate(im_num3, se);
        im_num4 = skew_correction(im_num3);
        figure('position',[80 100 1280 800])
        subplot(2,2,1)
        imshow(im_num)
        subplot(2,2,2)
        imshow(im_num2)
        subplot(2,2,3)
        imshow(im_num3)
        subplot(2,2,4)
        imshow(im_num4)
        close all
    end
end

% %%
% % interpolation method for resize ('bicubic', 'bilinear' or 'nearest');
% resize_type = 'bicubic'; 
% % size after resizing
% size_row = 20;
% size_col = 20;
% a = sparse_data ...
%     * im_box([],0,1) ... % add rows/columns to make images square 
%     * im_resize([],[size_row size_col], resize_type) ... % size of images 
%     * im_box([],1,0); % add rows/columns and keep image square
% a = prdataset(a, getlabels(sparse_data));
% % show resized data 
% figure
% show(a);
% %%
% % compute central moments
% M = im_moments(a,'central');
% % copute angle 
% theta = 0.5 * atan(
% show(M);



