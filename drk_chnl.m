function chnl=drk_chnl(img,w)
min_img=min(img,[],3);
fun = @(x) min(x(:));
chnl = nlfilter(min_img,w,fun);
figure,imshow(min_img), figure, imshow(chnl);
end