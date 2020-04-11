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

% X * all_theta'�o��w�����G
% �]��theta��10��,�ҥH���G�|�O5000x10���x�}
% (5000�����,10��(�w���O1,�w���O2,�w���O3...�w���O10)���G)
% �ӳo10�դ��ȳ̰����N�O�̲׹w�����G,�]���n�����O�U�C���̰�,�ҥH�o�g��max(A, [], 2)�o�˪��Φ�
% ���L�u���n���o���ä��O�̰����w����,�ӬO�̰��w���ȬO�b���@��
% �ҥH�ΥH�����������o�g��[maxVal,p]
% �Ĥ@��maxVal�O5000x1���x�},�s���O�U�C���̰���
% �ӲĤG��p�~�O�ڭ̻ݭn��,5000x1�x�},�s���O�̰��w���Ȧb���@�檺��T,���������w�����G����T
[maxVal,p] = max(X * all_theta', [], 2);




% =========================================================================


end
