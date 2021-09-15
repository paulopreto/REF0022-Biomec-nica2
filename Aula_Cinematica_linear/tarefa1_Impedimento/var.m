% VAR EEFERP
pkg load image

varimage = imread('var1.png');
imshow(varimage)

[pixelx, pixely] = ginput(4);

jogador1 = pixelx(1:2)
jogador2 = pixelx(3:4)

