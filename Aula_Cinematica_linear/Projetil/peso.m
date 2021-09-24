function peso

close all
figure
%projetil3(2.2,13.3,15)
%projetil3(2.2,13.3,30)
%projetil3(2.2,13.3,35)
disp('')
disp('#####################')
projetil3(2.2,13.3,40)
disp('')
disp('#####################')
projetil3(2.2,13.3,41)
disp('')
disp('#####################')
projetil3(2.2,13.3,43)
disp('')
disp('#####################')
projetil3(2.2,13.3,45)
disp('')
disp('#####################')
%projetil3(2.2,13.3,60)
%projetil3(2.2,13.3,75)

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