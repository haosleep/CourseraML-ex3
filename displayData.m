function [h, display_array] = displayData(X, example_width)
%DISPLAYDATA Display 2D data in a nice grid
%   [h, display_array] = DISPLAYDATA(X, example_width) displays 2D data
%   stored in X in a nice grid. It returns the figure handle h and the 
%   displayed array if requested.

% Set example_width automatically if not passed in
% 取邊長
% 如果example_width的格式不是variables,或是example_width為空的時候(就是沒先給定邊長的情況)
% 將傳進來的X開根號後取round(最接近的整數),用以作為單張圖的寬

% 此次作業傳進來的X格式是100*400的矩陣(從讀取到的5000*400的X中取其中的100*400)
% 意思是400項資訊的共100個
% 從ex3.m中即可知,400代表的是20x20pixel,每個pixel的顏色資訊
% 故要從400這個值回推原圖的長寬,如果一開始呼叫displayData.m沒給值的話就從傳進來的X來推算
if ~exist('example_width', 'var') || isempty(example_width) 
	example_width = round(sqrt(size(X, 2)));
end

% Gray Image
% 將圖片顏色色表轉為灰階
colormap(gray);

% Compute rows, cols
% 以傳進來的X矩陣格式來說
% m對應了資料總數,n對應了每筆資料有幾項資訊
[m n] = size(X);
% 計算單張圖的高
example_height = (n / example_width);

% Compute number of items to display
% m代表的是資料數,因為最終打算要全部print成圖片,故這邊計算各行各列該放幾張圖(幾筆資料)
% 將資料數(100)開根號後向下取整得到列數 = 每列預定放10筆資料圖
% 總資料數再除列即可得行數
display_rows = floor(sqrt(m));
display_cols = ceil(m / display_rows);

% Between images padding
% 資料跟資料間分隔所需的空間大小
pad = 1;

% Setup blank display
% 整理出print整張X資訊需要的大小(加上留空的部分)
display_array = - ones(pad + display_rows * (example_height + pad), ...
                       pad + display_cols * (example_width + pad));

% Copy each example into a patch on the display array
% 利用迴圈來開始放每格資訊
curr_ex = 1;
for j = 1:display_rows
	for i = 1:display_cols
    % 當前放置的第curr_ex項資料已經超過了X的資料數即跳出
		if curr_ex > m, 
			break; 
		end
		% Copy the patch
		
		% Get the max value of the patch
    % 取X此項資料中的最大值
		max_val = max(abs(X(curr_ex, :)));
    % reshape(A,x,y)是將向量A照順序改為x*y的矩陣
    % 利用這個方法一次放滿一筆資料
    
    % 至於把資料再除以max_val的原因
    % 是為了確保讓整筆資料範圍能限縮在-1~1之間(為了下面的imagesc)
		display_array(pad + (j - 1) * (example_height + pad) + (1:example_height), ...
		              pad + (i - 1) * (example_width + pad) + (1:example_width)) = ...
						reshape(X(curr_ex, :), example_height, example_width) / max_val;
    % 處理好一筆資料後就換下一筆資料      
		curr_ex = curr_ex + 1;
	end
	if curr_ex > m, 
		break; 
	end
end

% Display Image
% 將矩陣display_array圖像化顯示,顏色範圍映射於-1~1
% 用意據說是為了提升中心的分辨率

% 可以嘗試colormap(gray); imagesc(任意矩陣, [-1 1]);
% 和colormap(gray); imagesc(任意矩陣);比較其差距
h = imagesc(display_array, [-1 1]);

% Do not show axis
% 不把x,y軸的部分繪製出來
axis image off

drawnow;

end
