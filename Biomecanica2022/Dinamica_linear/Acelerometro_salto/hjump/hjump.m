%% hjump.m
%% Calcula a altura de um salto utilizando dados de acelerometro do celular
%% Aplicativo para Android utilizado aqui foi o: Physics Toolbox Sensor Suite – Apps no Google Play
%% Aparelho Huwaei P30 Lite de 64GB

function [h] = hjump()

accdata = input("Qual o arquivo que deseja analisar: ", "s");
convert_comma2dot (accdata, 'datadot.csv') 


% data = dlmread('datadot.csv', ';', 1, 0);
data = dlmread('datadot.csv'); data = data(2:end, :);

t = data(:, 1); % vetor tempo
accT = data(:, 5);

close all
plot(t, accT, 'LineWidth', 2)
hold on
plot(t, accT, 'r.', 'MarkerSize', 7) 
title('Selecione incio e fim da fase de voo')
ylabel('aceleracao [m/s^2]')
xlabel('tempo [s]')

[acc_temps, acc_valores] = ginput(2);
t_saida = acc_temps(1);
t_chegada = acc_temps(2);

t_voo = t_chegada - t_saida

% Equacao de Bosco et al. para determinar a altura de salto com o tempo de voo
%  Bosco C, Luhtanen P, Komi PV. A simple method for measurement of mechanical
%  power in jumping. Eur J Appl Physiol Occup Physiol. 1983;50(2):273-82.
%  doi: 10.1007/BF00422166. PMID: 6681758.
g = 9.81;
altura = g * t_voo^2 / 8; 

h = altura;
disp('Altura de salto em metros foi: ')
disp(h)

result = [t_voo, h];
dlmwrite('hjumpres.txt', result)

end


%% CONVERT_COMMA2DOT - Copyright (C) 2021 Preto
function [] = convert_comma2dot (input1, input2) 

Data = fileread(input1);
Data = strrep(Data, ',', '.');
FID = fopen(input2, 'w');
fwrite(FID, Data, 'char');
fclose(FID);

end