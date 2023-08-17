
A = [0, 0, 0,0,0; 0, 1, 2,1,0;0,2,4,2,0;0, 1, 2,1,0;0, 0, 0,0,0 ];
disp(fftshift(A))


H=lpfilter('ideal',100,100,10,0);

figure,mesh(double(H(1:1:100,1:1:100)))
axis tight
H=lpfilter('btw',100,100,10,2);

figure,mesh(double(H(1:1:100,1:1:100)))
axis tight
H=lpfilter('gaussian',100,100,10,2);

figure,mesh(double(H(1:1:100,1:1:100)))
axis tight
