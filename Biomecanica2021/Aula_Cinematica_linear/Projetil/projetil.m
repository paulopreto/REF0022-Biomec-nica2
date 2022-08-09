% >> arco=(30*pi)/180
% arco = 0.5236 o arco de circunferencia cujo angulo é 30
% 
% >> cos(arco)
% ans = 0.8678
% >> acos(ans)*180/pi
% ans = 30.0000
% 
% >> sin(arco)
% ans = 0.5000
% >> asin(ans)*180/pi
% ans = 30.0000
% 
% >> tan(arco)
% ans = 0.5774
% >> atan(ans)*180/pi
% ans = 30.0000
% projetil(10, 30)
function [sx,yy]=projetil(v0,angulo)

x = 10;
g = 9.8;
% t = 0:0.1:1;
t = 0.5;

teta = 10:5:80;
tetax = teta * pi / 180;

angTan = tan(tetax);
angCos = cos(tetax);
angSin = sin(tetax);
seno = sin(angulo * pi / 180);
cosseno = cos(angulo * pi / 180);

tt = x / (v0 * angCos(5))
t=0:0.001:tt;

y = x * angTan(5) - 0.5 * g * tt.^2
yy = x * angTan(5) - 0.5 * g * t.^2;

figure(1)
% subplot(2,1,1)

plot(t,yy)
hold on
% plot(t,yy,'.')


y2 = x * angTan(5) - 0.5 * g * (x / (v0 * angCos(5)))^2

y3 = v0 * angSin(5) * tt - 0.5 * g * tt^2
yy3 = v0 * angSin(5) * t - 0.5 * g * t.^2;

sx = (v0 * cosseno) * t;

% figure(1)
plot(t,yy3)
hold on
grid on

figure(2)

% subplot(2,1,2)
% plot(sx(end),yy(end))
plot(sx,yy3)
hold on
% grid on

% tamanho = round(size(yy3,2) * 0.1);
% text(t(tamanho),yy3(tamanho)+3,num2str(v0))
% plot(t,yy3,'.')
