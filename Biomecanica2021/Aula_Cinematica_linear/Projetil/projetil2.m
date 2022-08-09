function projetil2(s0,v0,angulo)

x = 10;
g = 9.8143;

teta = 10:5:80;
tetax = teta * pi / 180;

angTan = tan(tetax);
angCos = cos(tetax);
angSin = sin(tetax);
seno = sin(angulo * pi / 180);

% if angulo == 90
%     cosseno = 0;
% end
% if angulo ~= 90;
    cosseno = cos(angulo * pi / 180);
% end

Stotal = (2 * v0^2 / g) * seno*cosseno
tempo = Stotal / (v0 * cosseno)
h = (v0^2 * seno^2) / (2 * g)

t = 0:0.01:tempo;
yy3 = s0 + v0 * seno * t - 0.5 * g * t.^2;
% yy3 = s0 + v0 * angSin(5) * t - 0.5 * g * t.^2;
sx = (v0 * cosseno) * t;

figure(1)
tamanho = round(size(yy3,2) * 0.4);

% subplot(2,1,1)
plot(t,yy3)
hold on
text(t(tamanho),yy3(tamanho)+3,num2str(angulo))
% plot(t,yy3,'.')

figure(2)
% subplot(2,1,2)
plot(sx,yy3)
hold on
text(sx(tamanho),yy3(tamanho)+3,num2str(angulo))

xlabel('[m]')
ylabel('[m]')
% plot(sx,yy3,'.')
