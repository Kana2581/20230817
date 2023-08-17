water_print=rgb2gray(imread('syg.jpg'));
water_print_imageSize = size(image);
water_print_height = water_print_imageSize(1);
water_print_width = water_print_imageSize(2);
p=rgb2gray(imread("ktlf.jpg"));
p_imageSize = size(image);
p_height = p_imageSize(1);
p_width = p_imageSize(2);
array1 = p(:,:);
array2 = p(:,:);
array3 = p(:,:);
for i=1:64
    for j=1:64
        for k=1:8
            array1(i,(j-1)*8+k)=bitset(p(i,(j-1)*8+k),1,bitget(water_print(i,j),k));
            array2(i,(j-1)*8+k)=bitset(p(i,(j-1)*8+k),4,bitget(water_print(i,j),k));
            array3(i,(j-1)*8+k)=bitset(p(i,(j-1)*8+k),8,bitget(water_print(i,j),k));
        end
    end
end
array4=uint8(zeros(64,64));
for i=1:64
    for j=1:64
        for k=1:8
            array4(i,j)=bitset(array4(i,j),k,bitget(array3(i,(j-1)*8+k),8));
        end
    end
end

subplot(2, 2, 1);
imshow(array1);
title('水印加在最后一位bit位');
subplot(2, 2, 2);
imshow(array2);
title('水印加在最后第4位bit位');
subplot(2, 2, 3);
imshow(array3);
title('水印加在最后第8位bit位');
subplot(2, 2, 4);
imshow(array4);
title('从第三张图片中分离出的水印');

        