%% Machine Learning Online Class - Exercise 3 | Part 1: One-vs-all

%  Instructions
%  ------------
%
%  This file contains code that helps you get started on the
%  linear exercise. You will need to complete the following functions
%  in this exericse:
%
%     lrCostFunction.m (logistic regression cost function)
%     oneVsAll.m
%     predictOneVsAll.m
%     predict.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than those mentioned above.
%

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this part of the exercise
input_layer_size  = 400;  % 20x20 Input Images of Digits
num_labels = 10;          % 10 labels, from 1 to 10
                          % (note that we have mapped "0" to label 10)

%% =========== Part 1: Loading and Visualizing Data =============
%  We start the exercise by first loading and visualizing the dataset.
%  You will be working with a dataset that contains handwritten digits.
%

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

% 這次作業要使用邏輯回歸的方式來處理手寫辨識(0~9)
% 先讀取訓練資料
% ex3data1.mat已包含了5000筆訓練資料
% mat格式跟之前所讀取的txt,csv等格式不同,是直接存在Octave/Matlab裡的矩陣資料
% 直接load資料就會讀進檔案中所含有的矩陣
% 也不用自己另外對矩陣命名

% ex3data1.mat中有5000筆訓練資料,每一筆資料都是20x20pixel的灰階圖
% 將20x20pixel展開成400
% 存有訓練資料的X矩陣格式為5000x400
% 而對應訓練資料的結果y則是5000x1
% 其中y裡面的10其實對應的是手寫數字0
load('ex3data1.mat'); % training data stored in arrays X, y
m = size(X, 1);

% Randomly select 100 data points to display
% randperm(m)是將1~m的數字隨機排列成一個1*m的矩陣
% 接著再取前100項
% 執行displayData.m函數將這100項對應的資料print出
% 用以驗證檔案有正常讀取
rand_indices = randperm(m);
sel = X(rand_indices(1:100), :);

displayData(sel);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============ Part 2a: Vectorize Logistic Regression ============
%  In this part of the exercise, you will reuse your logistic regression
%  code from the last exercise. You task here is to make sure that your
%  regularized logistic regression implementation is vectorized. After
%  that, you will implement one-vs-all classification for the handwritten
%  digit dataset.
%

% Test case for lrCostFunction
fprintf('\nTesting lrCostFunction() with regularization');

% 這邊要先完成向量化邏輯回歸的函式lrCostFunction.m (part2a功課)
% 先用給定的theta,X,y,lambda來進行功能測試
theta_t = [-2; -1; 1; 2];
X_t = [ones(5,1) reshape(1:15,5,3)/10];
y_t = ([1;0;1;0;1] >= 0.5);
lambda_t = 3;
[J grad] = lrCostFunction(theta_t, X_t, y_t, lambda_t);

% 驗證向量化邏輯回歸的函式結果是否正確
fprintf('\nCost: %f\n', J);
fprintf('Expected cost: 2.534819\n');
fprintf('Gradients:\n');
fprintf(' %f \n', grad);
fprintf('Expected gradients:\n');
fprintf(' 0.146561\n -0.548558\n 0.724722\n 1.398003\n');

fprintf('Program paused. Press enter to continue.\n');
pause;
%% ============ Part 2b: One-vs-All Training ============
fprintf('\nTraining One-vs-All Logistic Regression...\n')

% 接著在oneVsAll.m中執行向量化邏輯回歸的機器學習(part2b作業)
lambda = 0.1;
[all_theta] = oneVsAll(X, y, num_labels, lambda);

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================ Part 3: Predict for One-Vs-All ================

% 最後驗證機器學習的準確度(part3作業)
pred = predictOneVsAll(all_theta, X);

% 驗證準確度
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

