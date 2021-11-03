clc
close all

pkg load io
vol1_antepe = dlmread('Voluntario_01_antepe.csv', ',', 5, 0);
vol1_retropepe = dlmread('Voluntario_01_retrope.csv', ',', 5, 0);
#fz1 = vol1_antepe(:, 5); % selecionar a coluna 5 que eh o fz da plataforma de forca 1 
fz2_vol1_antepe = vol1_antepe(:, 14); % selecionar a coluna 5 que eh o fz da plataforma de forca 2 
fz2_vol1_retrope = vol1_retropepe(:, 14); % selecionar a coluna 5 que eh o fz da plataforma de forca 2

#plot(fz1, 'b')

plot(fz2_vol1_antepe, 'r')
hold on
plot(fz2_vol1_retrope, 'b')


fsuporte_a = find(fz2_vol1_antepe(1:8000, :) > 0);
fsuporte_r = find(fz2_vol1_retrope(1:8000, :) > 0);


fz2_vol1a = fz2_vol1_antepe(fsuporte_a, :);
fz2_vol1r = fz2_vol1_retrope(fsuporte_r, :);
figure 
plot(fz2_vol1a, 'r')
hold on
plot(fz2_vol1r, 'b')
title('FRS [Vermelho = antepe; Azul = retrope]')
