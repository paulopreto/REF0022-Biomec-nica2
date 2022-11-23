% altura inicial menor que altura final
function projetil4(s0,s1,v0,angulo)

x = 10;
g = 9.8;

teta = 10:5:80;
tetax = teta * pi / 180;

angTan = tan(tetax);
angCos = cos(tetax);
angSin = sin(tetax);
seno = sin(angulo * pi / 180);
cosseno = cos(angulo * pi / 180);

texto = ['seno: ' num2str(seno)];
disp(texto)
texto = ['cosseno: ' num2str(cosseno)];
disp(texto)

% Stotal = (2 * v0^2 / g) * seno*cosseno
% tempo = Stotal / (v0 * cosseno)

h = (v0^2 * seno^2) / (2 * g);
texto = ['altura: ' num2str(h)];
disp(texto)

t1 = sqrt(2 * h / g);
texto = ['tempo ate altura maxima: ' num2str(t1)];
disp(texto)

texto = ['velocidade inicial(y): ' num2str(v0 * seno) ' velocidade inicial(x): ' num2str(v0 * cosseno)];
disp(texto)

if ((s0 + h) < s1)
    hTotal = s0 + h;
else
    hTotal = s0 + h - s1;
end
texto = ['diferenca altura maxima - altura aro: ' num2str(hTotal)];
disp(texto)

t2 = sqrt(2 * hTotal / g);
tt = t1 + t2;
texto = ['tempo da altura maxima ate aro: ' num2str(t2)];
disp(texto)

texto = ['tempo total: ' num2str(tt)];
disp(texto)

Stotal = (v0 * cosseno) * tt;
texto = ['alcance: ' num2str(Stotal)];
disp(texto)

t = 0:0.01:tt;
yy3 = s0 + v0 * seno * t - 0.5 * g * t.^2;
% yy3 = s0 + v0 * angSin(5) * t - 0.5 * g * t.^2;
sx = (v0 * cosseno) * t;

figure(1)
tamanho = round(size(yy3,2) * 0.4);

% subplot(2,1,1)
shift = 0.1;
plot(t,yy3)
hold on
text(t(tamanho),yy3(tamanho) + shift,num2str(angulo))
% plot(t,yy3,'.')

figure(2)
% subplot(2,1,2)
plot(sx,yy3)
hold on
text(sx(tamanho),yy3(tamanho) + shift,num2str(angulo))

xlabel('[m]')
ylabel('[m]')

% plot(sx,yy3,'.')
