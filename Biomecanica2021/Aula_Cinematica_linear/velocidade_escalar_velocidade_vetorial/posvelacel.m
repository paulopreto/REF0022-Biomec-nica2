clc
close all

load preto_sprint01.txt
freq = 60;
dat = preto_sprint01;

% POSICAO E TEMPO
frames = dat(:,2);
posicoes = dat(:,1);
tempos = diff(frames) * 1/freq;
dat1 = [[0;tempos], posicoes]
temptotal = sum([0;tempos])
tempsacumulados = cumsum([0;tempos])
compasso = diff(posicoes)

% VELOCIDADES
dist_m = dat1(end, 2)
dist_km = dist_m / 1000
velmed_ms = dist_m / temptotal
velmed_kmh  = velmed_ms * 3.6

velinst_ms = [0; diff(posicoes)] ./ dat1(:, 1)
velinst_kmh = velinst_ms * 3.6

% ACELERACOES
acelinst_ms2 = [0;diff(velinst_ms)] ./ dat1(:, 1).^2

% VISUALIZANDO EM GRAFICOS
% grafico de tempo por posicao
plot(tempsacumulados, posicoes, 'o-')
xlabel('Tempos [s]')
ylabel('Posicoes [m]')
title('Grafico de tempos por posicao')
grid on

% grafico de tempo por distancia cada passo
figure
plot(tempos, posicoes(2:end), 'o-')
xlabel('Tempos de cada passo [s]')
ylabel('Distancia de cada passo [m]')
title('Grafico de tempo e distancia de passo')
grid on

% grafico de comprimento de passo
figure
bar(compasso)
xlabel('Numero do passo')
ylabel('Distancia de cada passo [m]')
title('Grafico de distancia de passo')
grid on

% Grafico de velocidade escalar por distancia
figure
plot(posicoes, velinst_ms, 'ro:')
xlabel('Distance (m)')
ylabel('Speed (m/s)')
title('Mean speed over each step - Paulo Preto')
grid on

% Grafico de posicao, velocidade e aceleracao
figure

subplot(3,1,1)
plot(tempsacumulados(2:end), compasso, 'ro-')
title('posicao')
ylabel('posicao (m)')

subplot(3,1,2)
plot(tempsacumulados, velinst_ms, 'bo-')
title('velocidade')
ylabel('velocidade vetorial (m/s)')

subplot(3,1,3)
plot(tempsacumulados, acelinst_ms2, 'ko-')
title('aceleracao')
ylabel('aceleracao (m/s^2)')
xlabel('Tempo (s)')
