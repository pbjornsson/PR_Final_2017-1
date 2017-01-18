%% Example of computing dissimilarity
a = gendath(1000); % feature based representation
b = gendat(a,5);
w = proxm(b); % define some dissimilarity measure
c = a*w; % apply to the data
scatterd(c*pcam(c,2)); % compute and plot a PCA


%% 13.1
% Generate a set of 50 objects per class by gendatb.
close all
clc
% a.) Compute a dissimilarity matrix for using the city-block distance. Visualize the
%     result by multi-dimensional scaling
%a = gendath(100);
%b = gendatb(50);

% Dissimilarity representation
min_trainingdata1 = 100; % Number of objects per class
N = min_trainingdata1; % Number of objects to be selected
sparse_data = prnist([0:9],1:floor(1000/min_trainingdata1):1000);
B = im_resize(sparse_data, [64 64],'preserve');
A = prdataset(B);
[training_set, test_set] = gendat(A,N); % Feature based representation
W = proxm(training_set,'distance',1); % Define some dissimilarity measure
disrep = test_set * W;
%C = A*W; % Apply to the data
D = 2; % Number of dimensions after pca reduction (desired output dimensionality)
scatterd(disrep*pcam(disrep,D),D); 
%scatterd(+C*pcam(+C,D));
[E, C] = testkd(disrep, 5); % Calculate the estimated error E
%SquaredDis = psdistm(training_set,test_set,[1 2]);
%[DN, J] =selcdat(SquaredDis,5);