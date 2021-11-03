clc
close all

pkg load io
data = dlmread('Voluntario_01_antepe.csv', ',', 5, 0);
size(data)
#csvread