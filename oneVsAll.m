function [all_theta] = oneVsAll(X, y, num_labels, lambda)
%ONEVSALL trains multiple logistic regression classifiers and returns all
%the classifiers in a matrix all_theta, where the i-th row of all_theta 
%corresponds to the classifier for label i
%   [all_theta] = ONEVSALL(X, y, num_labels, lambda) trains num_labels
%   logistic regression classifiers and returns each of these classifiers
%   in a matrix all_theta, where the i-th row of all_theta corresponds 
%   to the classifier for label i

% Some useful variables
m = size(X, 1);
n = size(X, 2);

% You need to return the following variables correctly 
all_theta = zeros(num_labels, n + 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the following code to train num_labels
%               logistic regression classifiers with regularization
%               parameter lambda. 
%
% Hint: theta(:) will return a column vector.
%
% Hint: You can use y == c to obtain a vector of 1's and 0's that tell you
%       whether the ground truth is true/false for this class.
%
% Note: For this assignment, we recommend using fmincg to optimize the cost
%       function. It is okay to use a for-loop (for c = 1:num_labels) to
%       loop over the different classes.
%
%       fmincg works similarly to fminunc, but is more efficient when we
%       are dealing with large number of parameters.
%
% Example Code for fmincg:
%
%     % Set Initial theta
%     initial_theta = zeros(n + 1, 1);
%     
%     % Set options for fminunc
%     options = optimset('GradObj', 'on', 'MaxIter', 50);
% 
%     % Run fmincg to obtain the optimal theta
%     % This function will return theta and the cost 
%     [theta] = ...
%         fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
%                 initial_theta, options);
%

% 開始利用fmincg函式來處理邏輯回歸(覺得這部分的編程應該是第三週的課程內容而不是第四週的)
% 手寫辨識也算是分類問題,不過這次不是ex2的兩類,而是0~9的十類
% 十類的分類解決方式,其實是把 1次分10類 轉變成 10次的一次分兩類 的方式
% 舉例說第一次就是辨識結果是1和結果不是1的兩類
% 第二次是辨識結果是2和結果不是2的兩類
% 總計十次執行完後,比較辨識結果0~9裡面,結果是其中之一的預測值最高的那一項即為預測結果

% 因此,接著就要準備num_labels組,也就是10組的theta
% 利用for迴圈和(y == c),把原本結果y含有的1~10的值變為只有1跟0
% 再將結果存進all_theta的矩陣裡
% 最後可以取得10x401的矩陣

% 至於fmincg和ex2中使用的fminunc是類似的功能
% 網路上查到的說法,fmincg較適合用於參數多的情況(像這次每次學習需要取得分別401個不同的theta值)
initial_theta = zeros(n + 1, 1);
options = optimset('GradObj', 'on', 'MaxIter', 50);
for c = 1:num_labels 
  [theta] = ...
      fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
      initial_theta, options);
  all_theta(c,:) = theta;
end







% =========================================================================


end
