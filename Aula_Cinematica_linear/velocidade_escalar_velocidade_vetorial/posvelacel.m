load preto_sprint01.txt
freq = 60;
dat = preto_sprint01;

% POSICAO E TEMPO
frames = dat(:,2);
posicoes = dat(:,1);
tempos = diff(frames) * 1/freq;
dat1 = [[0;tempos], posicoes]
temptotal = sum([0;tempos])

% VELOCIDADES
dist_m = dat1(end, 2)
dist_km = dist_m / 1000
velmed_ms = dist_m / temptotal
velmed_kmh  = velmed_ms * 3.6

velinst_ms = [0; diff(posicoes)] ./ dat1(:, 1)
velinst_kmh = velinst_ms * 3.6

% ACELERACOES
acelinst_ms2 = [0;diff(velinst_ms)] ./  dat1(:, 1).^2