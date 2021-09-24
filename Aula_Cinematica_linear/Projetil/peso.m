function peso

figure
projetil3(2,15,15)
projetil3(2,15,30)
projetil3(2,15,35)
projetil3(2,15,40)
projetil3(2,15,41)
projetil3(2,15,45)
projetil3(2,15,60)
projetil3(2,15,75)

set(gcf,'color',[1 1 1])
box off
% figure
% projetil3(1,10,30)
% projetil3(1.5,10,30)
% projetil3(0.5,10,30)

% subplot(2,1,2)
% grid on
% ylim([-0.5 4])
% set(gcf,'color',[1 1 1])

linha = [0 2; 25 2];
plot(linha(:,1),linha(:,2),':')