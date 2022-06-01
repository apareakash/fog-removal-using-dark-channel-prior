hazy=imread('hazy2.jpg');
min_hazy=min(hazy,[],3);
w=[30 30];
min_hazy = im2double(min_hazy);
fun = @(x) min(x(:));

drk_chnl = nlfilter(min_hazy,w,fun);
imshow(min_hazy), figure, imshow(drk_chnl);
[M,I] = max(max(drk_chnl(:)));
[I_row, I_col] = ind2sub(size(drk_chnl),I);
A=ones(1,3);
A(1:3)=hazy(I_row,I_col,:);