%% Machine Learning Online Class - Exercise 3 | Part 2: Neural Networks

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

%% Setup the parameters you will use for this exercise
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)

%% =========== Part 1: Loading and Visualizing Data =============
%  We start the exercise by first loading and visualizing the dataset. 
%  You will be working with a dataset that contains handwritten digits.
%

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

% 這邊則是要以神經網路(NN)的方式來進行手寫辨識的機器學習
% 用的資料也是ex3data1.mat
% part1的部分跟ex3.m的part1基本一樣就不多作註解了

load('ex3data1.mat');
m = size(X, 1);

% Randomly select 100 data points to display
sel = randperm(size(X, 1));
sel = sel(1:100);

displayData(X(sel, :));

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 2: Loading Pameters ================
% In this part of the exercise, we load some pre-initialized 
% neural network parameters.

fprintf('\nLoading Saved Neural Network Parameters ...\n')

% Load the weights into variables Theta1 and Theta2
% 接著再從ex3weights.mat中讀取神經網路所用的Theta1和Theta2
% 雖然一般神經網路中,每層的theta(權重值)應該是經由訓練來取得的
% 不過這次直接先用設定好的來進行
% Theta1是25x401的矩陣
% Theta2是10X26的矩陣
% 此次的神經網路架構是中間一層隱藏層
% 輸入層為400神經元(20x20pixel)
% 隱藏層為25神經元
% 輸出層為10神經元
load('ex3weights.mat');

%% ================= Part 3: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.

% 因為theta已經先給好了,所以直接利用predict.m來取得預測結果(part3作業)
pred = predict(Theta1, Theta2, X);

% 驗證預測結果準確度來判斷predict.m是否正確
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

fprintf('Program paused. Press enter to continue.\n');
pause;

%  To give you an idea of the network's output, you can also run
%  through the examples one at the a time to see what it is predicting.

%  Randomly permute examples
% 最後是將結果實際展示
% 先將所有資料隨機排列
rp = randperm(m);

% 利用迴圈將結果一一展示
for i = 1:m
    % Display 
    % 先運用displayData將目前輪到的資料print出圖片
    fprintf('\nDisplaying Example Image\n');
    displayData(X(rp(i), :));
    % 將資料和theta1,2代入進行預測
    pred = predict(Theta1, Theta2, X(rp(i),:));
    % 最後將預測結果輸出,可將結果和前面print的圖進行比對
    fprintf('\nNeural Network Prediction: %d (digit %d)\n', pred, mod(pred, 10));
    
    % Pause with quit option
    % 利用input來達到程式暫停的功能
    % 如果輸入的是q就跳出迴圈(結束程式)
    % 輸入其他的就繼續for迴圈
    s = input('Paused - press enter to continue, q to exit:','s');
    if s == 'q'
      break
    end
end

