
import cv2
import numpy as np


image = cv2.imread('D:\Fig0237(a)(characters test pattern)_POST.tif', cv2.IMREAD_GRAYSCALE)
rows, cols = image.shape
f_transform_1 = np.zeros((rows, cols), dtype='uint8')
f_transform = np.fft.fft2(image)
f_transform_shifted = np.fft.fftshift(f_transform)
magnitude_spectrum = np.abs(f_transform_shifted)
magnitude_spectrum_log = np.log(magnitude_spectrum + 1)
cv2.imshow('Magnitude Spectrum', np.uint8(255 * magnitude_spectrum_log / np.max(magnitude_spectrum_log)))
cv2.waitKey(0)
cv2.destroyAllWindows()


f_transform_1 = np.zeros((rows, cols), dtype='int16')
for i in range(rows):
    for j in range(cols):
        if (i+j)%2==1:
            f_transform_1[i][j]=-1*int(image[i][j])
        else:
            f_transform_1[i][j]=int(image[i][j])
f_transform_2 = np.fft.fft2(f_transform_1)
magnitude_spectrum_1 = np.abs(f_transform_2)
magnitude_spectrum_log_1 = np.log(magnitude_spectrum_1 + 1)
cv2.imshow('Magnitude Spectrum', np.uint8(255 * magnitude_spectrum_log_1 / np.max(magnitude_spectrum_log_1)))
cv2.waitKey(0)
cv2.destroyAllWindows()