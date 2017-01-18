function out = skew_correction(im)

% interpolation method for resize ('bicubic', 'bilinear' or 'nearest');
resize_type = 'bicubic'; 
% size after resizing
size_row = 20;
size_col = 20;
a = input_im ...
    * im_box([],0,1) ... % add rows/columns to make images square 
    * im_resize([],[size_row size_col], resize_type) ... % size of images 
    * im_box([],1,0); % add rows/columns and keep image square
a = prdataset(a, getlabels(sparse_data));
im = prdataset(im);
moments = im_moments(im,'central');
alpha = atan(2*moments(3)/(moments(1)-moments(2)));
tform = maketform('affine',[1 0 0; sin(0.5*pi-alpha) cos(0.5*pi-alpha) 0; 0 0 1]);

im = imtransform(im,tform);
out = im_box(im,1,1);
end