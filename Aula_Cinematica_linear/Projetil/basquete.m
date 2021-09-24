function basquete

figure
projetil4(2,3.05,7.5,15)
projetil4(2,3.05,7.5,30)
projetil4(2,3.05,7.5,45)
projetil4(2,3.05,7.5,63)
projetil4(2,3.05,7.5,60)
projetil4(2,3.05,7.5,75)

set(gcf,'color',[1 1 1])
box off

figure(2)
tabela = [4.2 2.95;4.2 3.55];
plot(tabela(:,1), tabela(:,2),'LineWidth',2)

aro = [3.8 3.05; 4.2 3.05];
plot(aro(:,1), aro(:,2),'LineWidth',2)

poste = [4.2 3.2; 6 2.8; 6 0];
plot(poste(:,1), poste(:,2),'LineWidth',4)
