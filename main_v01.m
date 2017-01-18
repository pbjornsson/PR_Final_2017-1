%% Patter Recognition - Final Assignment
% Pall Bjornsson 
% Dominik Jargot 4633504

%% CLEAR WORKSPACE
% This file should be executed very first, this section cleans workspace
% and prepares raw data
clear
close all
clc
prwaitbar off
nist_data = prnist(0:9,1:1000);
prmemory(80000000);

%% LOAD DATA
% This file is loading data, please determine following parameters:

% choose how many objects for each digit is wanted in first scenario, i.e.
% 1) the pattern recognition system is trained once, and then applien in 
% the field (choose num_digit between 200 and 1000)
num_dense_digit = 200;
% choose how many objects for each digit is wanted in second scenario, i.e.
% 2) the pattern recognition system is trained for each batch of cheques to
% be processed (choose num_digit between 1 and 10)
num_sparse_digit = 10;

%%
% load randomly the dataset for 1st scenario
ratio_dense = num_dense_digit/1000;
dense_data = gendat(nist_data, ratio_dense);

% load randomly the dataset for 2nd scenario
ratio_sparse = num_sparse_digit/1000;
sparse_data = gendat(nist_data, ratio_sparse);

% test data
% sparse_data = prnist([0],[1]);

% show original data
% show(sparse_data);
% show(dense_data);
%% PREPROCESSING
sd_pre = ugly_to_nice(sparse_data);
% dd_pre = ugly_to_nice(dense_data);
    
show(sd_pre);