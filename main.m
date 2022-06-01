hazy=im2double(imread('hazy7.jpeg'));
%dark channel calculation
w=[20 20]; 
drk_cnl=drk_chnl(hazy,w);
%approximate airlight calculation
[M,I] = max(max(drk_cnl(:)));
[I_row, I_col] = ind2sub(size(drk_cnl),I);
Airlight=ones(1,3);
Airlight(1:3)=hazy(I_row,I_col,:);
A=ones(size(hazy));
A(:,:,1)=Airlight(1);A(:,:,2)=Airlight(2);A(:,:,3)=Airlight(3);
%transmission parameter calculation
wr=0.25;% to still keep haze in distant objects
norm_hazy=hazy./A;
norm_chnl=drk_chnl(norm_hazy,w);
t = 1-wr*norm_chnl;
t0=0.1;
tfinal=repmat(max(t,t0),[1 1 3]);
%restoring image radiance
J=((double(hazy)-A)./tfinal)+A;
imshow(J);figure;imshow(hazy);imwrite(J,'defogged7.jpg')