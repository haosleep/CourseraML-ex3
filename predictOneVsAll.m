function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 
%  p = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples) 

m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.
%       

% X * all_theta'得到預測結果
% 因為theta有10組,所以結果會是5000x10的矩陣
% (5000筆資料,10組(預測是1,預測是2,預測是3...預測是10)結果)
% 而這10組中值最高的就是最終預測結果,因為要取的是各列中最高,所以得寫為max(A, [], 2)這樣的形式
% 不過真正要取得的並不是最高的預測值,而是最高預測值是在哪一行
% 所以用以接收的部份得寫為[maxVal,p]
% 第一項maxVal是5000x1的矩陣,存的是各列的最高值
% 而第二項p才是我們需要的,5000x1矩陣,存的是最高預測值在哪一行的資訊,直接對應預測結果的資訊
[maxVal,p] = max(X * all_theta', [], 2);




% =========================================================================


end
