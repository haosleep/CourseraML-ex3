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

% �o��h�O�n�H���g����(NN)���覡�Ӷi���g���Ѫ������ǲ�
% �Ϊ���Ƥ]�Oex3data1.mat
% part1��������ex3.m��part1�򥻤@�˴N���h�@���ѤF

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
% ���ۦA�qex3weights.mat��Ū�����g�����ҥΪ�Theta1�MTheta2
% ���M�@�믫�g������,�C�h��theta(�v����)���ӬO�g�ѰV�m�Ө��o��
% ���L�o���������γ]�w�n���Ӷi��
% Theta1�O25x401���x�}
% Theta2�O10X26���x�}
% ���������g�����[�c�O�����@�h���üh
% ��J�h��400���g��(20x20pixel)
% ���üh��25���g��
% ��X�h��10���g��
load('ex3weights.mat');

%% ================= Part 3: Implement Predict =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the training set. This lets
%  you compute the training set accuracy.

% �]��theta�w�g�����n�F,�ҥH�����Q��predict.m�Ө��o�w�����G(part3�@�~)
pred = predict(Theta1, Theta2, X);

% ���ҹw�����G�ǽT�רӧP�_predict.m�O�_���T
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

fprintf('Program paused. Press enter to continue.\n');
pause;

%  To give you an idea of the network's output, you can also run
%  through the examples one at the a time to see what it is predicting.

%  Randomly permute examples
% �̫�O�N���G��ڮi��
% ���N�Ҧ�����H���ƦC
rp = randperm(m);

% �Q�ΰj��N���G�@�@�i��
for i = 1:m
    % Display 
    % ���B��displayData�N�ثe���쪺���print�X�Ϥ�
    fprintf('\nDisplaying Example Image\n');
    displayData(X(rp(i), :));
    % �N��ƩMtheta1,2�N�J�i��w��
    pred = predict(Theta1, Theta2, X(rp(i),:));
    % �̫�N�w�����G��X,�i�N���G�M�e��print���϶i����
    fprintf('\nNeural Network Prediction: %d (digit %d)\n', pred, mod(pred, 10));
    
    % Pause with quit option
    % �Q��input�ӹF��{���Ȱ����\��
    % �p�G��J���Oq�N���X�j��(�����{��)
    % ��J��L���N�~��for�j��
    s = input('Paused - press enter to continue, q to exit:','s');
    if s == 'q'
      break
    end
end

