pkg load io
close all

accdata = dlmread('Raw Data.csv', ',', 1, 0);

plot(accdata(:,1),accdata(:,5))
[t, acc] = ginput(2);
t1 = t(1)
t2 = t(2)

tvoo = t2 - t1
altura = 9.81 * (tvoo^2)/8
