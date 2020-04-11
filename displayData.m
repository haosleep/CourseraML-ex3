function [h, display_array] = displayData(X, example_width)
%DISPLAYDATA Display 2D data in a nice grid
%   [h, display_array] = DISPLAYDATA(X, example_width) displays 2D data
%   stored in X in a nice grid. It returns the figure handle h and the 
%   displayed array if requested.

% Set example_width automatically if not passed in
% �����
% �p�Gexample_width���榡���Ovariables,�άOexample_width���Ū��ɭ�(�N�O�S�����w��������p)
% �N�Ƕi�Ӫ�X�}�ڸ����round(�̱��񪺾��),�ΥH�@����i�Ϫ��e

% �����@�~�Ƕi�Ӫ�X�榡�O100*400���x�}(�qŪ���쪺5000*400��X�����䤤��100*400)
% �N��O400����T���@100��
% �qex3.m���Y�i��,400�N���O20x20pixel,�C��pixel���C���T
% �G�n�q400�o�ӭȦ^����Ϫ����e,�p�G�@�}�l�I�sdisplayData.m�S���Ȫ��ܴN�q�Ƕi�Ӫ�X�ӱ���
if ~exist('example_width', 'var') || isempty(example_width) 
	example_width = round(sqrt(size(X, 2)));
end

% Gray Image
% �N�Ϥ��C�����ର�Ƕ�
colormap(gray);

% Compute rows, cols
% �H�Ƕi�Ӫ�X�x�}�榡�ӻ�
% m�����F����`��,n�����F�C����Ʀ��X����T
[m n] = size(X);
% �p���i�Ϫ���
example_height = (n / example_width);

% Compute number of items to display
% m�N���O��Ƽ�,�]���̲ץ���n����print���Ϥ�,�G�o��p��U��U�C�ө�X�i��(�X�����)
% �N��Ƽ�(100)�}�ڸ���V�U����o��C�� = �C�C�w�w��10����ƹ�
% �`��ƼƦA���C�Y�i�o���
display_rows = floor(sqrt(m));
display_cols = ceil(m / display_rows);

% Between images padding
% ��Ƹ��ƶ����j�һݪ��Ŷ��j�p
pad = 1;

% Setup blank display
% ��z�Xprint��iX��T�ݭn���j�p(�[�W�d�Ū�����)
display_array = - ones(pad + display_rows * (example_height + pad), ...
                       pad + display_cols * (example_width + pad));

% Copy each example into a patch on the display array
% �Q�ΰj��Ӷ}�l��C���T
curr_ex = 1;
for j = 1:display_rows
	for i = 1:display_cols
    % ��e��m����curr_ex����Ƥw�g�W�L�FX����ƼƧY���X
		if curr_ex > m, 
			break; 
		end
		% Copy the patch
		
		% Get the max value of the patch
    % ��X������Ƥ����̤j��
		max_val = max(abs(X(curr_ex, :)));
    % reshape(A,x,y)�O�N�V�qA�Ӷ��ǧאּx*y���x�}
    % �Q�γo�Ӥ�k�@���񺡤@�����
    
    % �ܩ���ƦA���Hmax_val����]
    % �O���F�T�O���㵧��ƽd��୭�Y�b-1~1����(���F�U����imagesc)
		display_array(pad + (j - 1) * (example_height + pad) + (1:example_height), ...
		              pad + (i - 1) * (example_width + pad) + (1:example_width)) = ...
						reshape(X(curr_ex, :), example_height, example_width) / max_val;
    % �B�z�n�@����ƫ�N���U�@�����      
		curr_ex = curr_ex + 1;
	end
	if curr_ex > m, 
		break; 
	end
end

% Display Image
% �N�x�}display_array�Ϲ������,�C��d��M�g��-1~1
% �ηN�ڻ��O���F���ɤ��ߪ�����v

% �i�H����colormap(gray); imagesc(���N�x�}, [-1 1]);
% �Mcolormap(gray); imagesc(���N�x�});�����t�Z
h = imagesc(display_array, [-1 1]);

% Do not show axis
% ����x,y�b������ø�s�X��
axis image off

drawnow;

end
