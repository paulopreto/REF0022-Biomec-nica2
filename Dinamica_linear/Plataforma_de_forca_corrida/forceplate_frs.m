clc
close all

pkg load io
vol1_antepe = dlmread('Voluntario_03_antepe.csv', ',', 5, 0);
vol1_retropepe = dlmread('Voluntario_03_retrope.csv', ',', 5, 0);
#fz1 = vol1_antepe(:, 5); % selecionar a coluna 5 que eh o fz da plataforma de forca 1 
fz2_vol1_antepe = vol1_antepe(:, 14); % selecionar a coluna 14 que eh o fz da plataforma de forca 2 
fz2_vol1_retrope = vol1_retropepe(:, 14); % selecionar a coluna 14 que eh o fz da plataforma de forca 2

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
title('Vertical (Fz): FRS [Vermelho = antepe; Azul = retrope]')
ylabel('Vertical Force [N]')
xlabel('Frames') % passar para tempo em segundos


fy2_vol1_antepe = vol1_antepe(1:8000, 13); % selecionar a coluna 13 que eh o fy da plataforma de forca 2 
fy2_vol1_retrope = vol1_retropepe(1:8000, 13); % selecionar a coluna 13 que eh o fy da plataforma de forca 2
fy2_vol1a = fy2_vol1_antepe(fsuporte_a, :);
fy2_vol1r = fy2_vol1_retrope(fsuporte_r, :);

figure 
plot(-1*fy2_vol1a, 'r')
hold on
plot(-1*fy2_vol1r, 'b')
title('Anteroposterior (Fy): FRS [Vermelho = antepe; Azul = retrope]')
ylabel('AP Force [N]')
xlabel('Frames') % passar para tempo em segundos
