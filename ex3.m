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

% �o���@�~�n�ϥ��޿�^�k���覡�ӳB�z��g����(0~9)
% ��Ū���V�m���
% ex3data1.mat�w�]�t�F5000���V�m���
% mat�榡�򤧫e��Ū����txt,csv���榡���P,�O�����s�bOctave/Matlab�̪��x�}���
% ����load��ƴN�|Ū�i�ɮפ��ҧt�����x�}
% �]���Φۤv�t�~��x�}�R�W

% ex3data1.mat����5000���V�m���,�C�@����Ƴ��O20x20pixel���Ƕ���
% �N20x20pixel�i�}��400
% �s���V�m��ƪ�X�x�}�榡��5000x400
% �ӹ����V�m��ƪ����Gy�h�O5000x1
% �䤤y�̭���10���������O��g�Ʀr0
load('ex3data1.mat'); % training data stored in arrays X, y
m = size(X, 1);

% Randomly select 100 data points to display
% randperm(m)�O�N1~m���Ʀr�H���ƦC���@��1*m���x�}
% ���ۦA���e100��
% ����displayData.m��ƱN�o100�����������print�X
% �ΥH�����ɮצ����`Ū��
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

% �o��n�������V�q���޿�^�k���禡lrCostFunction.m (part2a�\��)
% ���ε��w��theta,X,y,lambda�Ӷi��\�����
theta_t = [-2; -1; 1; 2];
X_t = [ones(5,1) reshape(1:15,5,3)/10];
y_t = ([1;0;1;0;1] >= 0.5);
lambda_t = 3;
[J grad] = lrCostFunction(theta_t, X_t, y_t, lambda_t);

% ���ҦV�q���޿�^�k���禡���G�O�_���T
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

% ���ۦboneVsAll.m������V�q���޿�^�k�������ǲ�(part2b�@�~)
lambda = 0.1;
[all_theta] = oneVsAll(X, y, num_labels, lambda);

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================ Part 3: Predict for One-Vs-All ================

% �̫����Ҿ����ǲߪ��ǽT��(part3�@�~)
pred = predictOneVsAll(all_theta, X);

% ���ҷǽT��
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);

