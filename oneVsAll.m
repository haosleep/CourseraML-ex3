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

% �}�l�Q��fmincg�禡�ӳB�z�޿�^�k(ı�o�o�������s�{���ӬO�ĤT�g���ҵ{���e�Ӥ��O�ĥ|�g��)
% ��g���Ѥ]��O�������D,���L�o�����Oex2������,�ӬO0~9���Q��
% �Q���������ѨM�覡,���O�� 1����10�� ���ܦ� 10�����@�������� ���覡
% �|�һ��Ĥ@���N�O���ѵ��G�O1�M���G���O1������
% �ĤG���O���ѵ��G�O2�M���G���O2������
% �`�p�Q�����槹��,������ѵ��G0~9�̭�,���G�O�䤤���@���w���ȳ̰������@���Y���w�����G

% �]��,���۴N�n�ǳ�num_labels��,�]�N�O10�ժ�theta
% �Q��for�j��M(y == c),��쥻���Gy�t����1~10�����ܬ��u��1��0
% �A�N���G�s�iall_theta���x�}��
% �̫�i�H���o10x401���x�}

% �ܩ�fmincg�Mex2���ϥΪ�fminunc�O�������\��
% �����W�d�쪺���k,fmincg���A�X�Ω�ѼƦh�����p(���o���C���ǲ߻ݭn���o���O401�Ӥ��P��theta��)
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
