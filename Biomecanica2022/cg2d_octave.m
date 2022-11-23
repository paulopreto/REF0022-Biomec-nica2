% CALCULO DO CG EM IMAGEM (BIDIMENSIONAL)
% Rotina criada por Paulo R. P. Santiago (Preto).
% Primeira versao 08/04/07, ultima atualizacao ?????
%
% Disciplina: Biomecanica e Fund. de Biomecanica para EF - UFSCar
%
% [CG_total,CG_seg,] = cg2d(X)
%
% X = coordenadas bidimensionais (2D) dos pontos
% Os pontos devem ser definidos na ordem: 
% 
% 
%    
% 
% 1-Cabeca distal, 2-cabeca proximal, 3-ombro esquerdo, 4-ombro direito,
% 5-cotovelo esquerdo, 6-cotovelo direito 7-punho esquerdo, 8-punho direito,
% 9-parte distal da mao esquerda, 10-parte distal da mao direita, 
% 11-art. quadril esquerdo(trocanter femur), 
% 12-art. quadril direito(trocanter femur), 13-joelho esquerdo, 
% 14-joelho direito, 15-tornozelo esquerdo, 16-tornozelo direito, 
% 17-extremidade distal do pe esquerdo, 18-extremidade distal do pe direito
%
% #########################################################################
% Tabela de massas relativas e localizacao dos centros de gravidade de cada
% segmento (Plagenhoef et al., 1983)
% #########################################################################
% Segmento             massas relativas            localizacao dos centros de gravidade de cada segmento
%                                                       
% Cabeca+P.                0.0823                   0.55 vertexx - 7cervical
% Tronco                   0.46,01                   0.4175 c. glenohumeral - g. trocanter
% Braco                    0.03075                   0.447 c. glenohumeral - c. art.cotovelo
% Antebraco                0.0172                   0.432 c. art.cotovelo - c. art.pulso
% Mao                      0.00575                   0.468 c.art.pulso - c. art. 2 falange
% Coxa                     0.11125                  0.4305 g.trocanter - cond. femural
% Perna                    0.05050                   0.4265 cond. femural - maleolo
% Pe                       0.0138                   0.5 maleolo - metatarsico-fal





% imagein = argv();
% img = imagein{1};
% cellstr(img)

% printf("Imagem carregada = \n" imagem);
% cg2d_octave(img);
% printf("Fim\n");


function [cg_total,cg_seg,dat] = cg2d_octave(imagem)
close all
pkg load io
pkg load image

img = imread(imagem);
image(img);
hold on
% image(dat);
daspect([1 1 1])

[datx, daty] = ginput(18);
dat = [datx, daty];

    
[nlin,ncol] = size(dat);

% cabeca
cab_d = dat(1,:);
cab_p = dat(2,:);

cg_cab = cab_p + 0.55 * (cab_d - cab_p);

hold on
segcab = [cab_p;cab_d];

plot(segcab(:,1),segcab(:,2),'linewidth',3,'color','y')
plot(cab_p(1),cab_p(2),'.','MarkerSize',16);
plot(cab_d(1),cab_d(2),'.','MarkerSize',16);
plot(cg_cab(1),cg_cab(2),'r.','MarkerSize',16);

% Tronco


tron_p = (dat(3,:) + dat(4,:))/2;
tron_d = (dat(11,:) + dat(12,:))/2;

cg_tron = tron_p + 0.4175 * (tron_d - tron_p);

segtron = [tron_p;tron_d];
plot(segtron(:,1),segtron(:,2),'linewidth',3,'color','y')
plot(tron_p(1),tron_p(2),'.','MarkerSize',16);
plot(tron_d(1),tron_d(2),'.','MarkerSize',16);
plot(cg_tron(1),cg_tron(2),'r.','MarkerSize',16);

% braco 
brae_p = dat(3,:);
brad_p = dat(4,:);
brae_d = dat(5,:);
brad_d = dat(6,:);

cg_brae = brae_p + 0.447 * (brae_d - brae_p);
cg_brad = brad_p + 0.447 * (brad_d - brad_p);


segbrae = [brae_p;brae_d];
plot(segbrae(:,1),segbrae(:,2),'linewidth',3,'color','y')
segbrad = [brad_p;brad_d];
plot(segbrad(:,1),segbrad(:,2),'linewidth',3,'color','y')
plot(brae_p(1),brae_p(2),'.','MarkerSize',16);
plot(brad_p(1),brad_p(2),'.','MarkerSize',16);
plot(brae_d(1),brae_d(2),'.','MarkerSize',16);
plot(brad_d(1),brad_d(2),'.','MarkerSize',16);
plot(cg_brae(1),cg_brae(2),'r.','MarkerSize',16);
plot(cg_brad(1),cg_brad(2),'r.','MarkerSize',16);


% antebraco
abrae_p = dat(5,:);
abrad_p = dat(6,:);
abrae_d = dat(7,:);
abrad_d = dat(8,:);

cg_abrae = abrae_p + 0.432 * (abrae_d - abrae_p);
cg_abrad = abrad_p + 0.432 * (abrad_d - abrad_p);

segabrae = [abrae_p;abrae_d];
plot(segabrae(:,1),segabrae(:,2),'linewidth',3,'color','y')
segabrad = [abrad_p;abrad_d];
plot(segabrad(:,1),segabrad(:,2),'linewidth',3,'color','y')
plot(abrae_p(1),abrae_p(2),'.','MarkerSize',16);
plot(abrad_p(1),abrad_p(2),'.','MarkerSize',16);
plot(abrae_d(1),abrae_d(2),'.','MarkerSize',16);
plot(abrad_d(1),abrad_d(2),'.','MarkerSize',16);
plot(cg_abrae(1),cg_abrae(2),'r.','MarkerSize',16);
plot(cg_abrad(1),cg_abrad(2),'r.','MarkerSize',16);

% mao
maoe_p = dat(7,:);
maod_p = dat(8,:);
maoe_d = dat(9,:);
maod_d = dat(10,:);

cg_maoe = maoe_p + 0.468 * (maoe_d - maoe_p);
cg_maod = maod_p + 0.468 * (maod_d - maod_p);


segmaoe = [maoe_p;maoe_d];
plot(segmaoe(:,1),segmaoe(:,2),'linewidth',3,'color','y')
segmaod = [maod_p;maod_d];
plot(segmaod(:,1),segmaod(:,2),'linewidth',3,'color','y')
plot(maoe_p(1),maoe_p(2),'.','MarkerSize',16);
plot(maod_p(1),maod_p(2),'.','MarkerSize',16);
plot(maoe_d(1),maoe_d(2),'.','MarkerSize',16);
plot(maod_d(1),maod_d(2),'.','MarkerSize',16);
plot(cg_maoe(1),cg_maoe(2),'r.','MarkerSize',16);
plot(cg_maod(1),cg_maod(2),'r.','MarkerSize',16);

% coxa
coxae_p = dat(11,:);
coxad_p = dat(12,:);
coxae_d = dat(13,:);
coxad_d = dat(14,:);

cg_coxae = coxae_p + 0.4305 * (coxae_d - coxae_p);
cg_coxad = coxad_p + 0.4305 * (coxad_d - coxad_p);

segcoxae = [coxae_p;coxae_d];
plot(segcoxae(:,1),segcoxae(:,2),'linewidth',3,'color','y')
segcoxad = [coxad_p;coxad_d];
plot(segcoxad(:,1),segcoxad(:,2),'linewidth',3,'color','y')
plot(coxae_p(1),coxae_p(2),'.','MarkerSize',16);
plot(coxad_p(1),coxad_p(2),'.','MarkerSize',16);
plot(coxae_d(1),coxae_d(2),'.','MarkerSize',16);
plot(coxad_d(1),coxad_d(2),'.','MarkerSize',16);
plot(cg_coxae(1),cg_coxae(2),'r.','MarkerSize',16);
plot(cg_coxad(1),cg_coxad(2),'r.','MarkerSize',16);


% perna
pernae_p = dat(13,:);
pernad_p = dat(14,:);
pernae_d = dat(15,:);
pernad_d = dat(16,:);

cg_pernae = pernae_p + 0.4265 * (pernae_d - pernae_p);
cg_pernad = pernad_p + 0.4265 * (pernad_d - pernad_p);

segpernae = [pernae_p;pernae_d];
plot(segpernae(:,1),segpernae(:,2),'linewidth',3,'color','y')
segpernad = [pernad_p;pernad_d];
plot(segpernad(:,1),segpernad(:,2),'linewidth',3,'color','y')
plot(pernae_p(1),pernae_p(2),'.','MarkerSize',16);
plot(pernad_p(1),pernad_p(2),'.','MarkerSize',16);
plot(pernae_d(1),pernae_d(2),'.','MarkerSize',16);
plot(pernad_d(1),pernad_d(2),'.','MarkerSize',16);
plot(cg_pernae(1),cg_pernae(2),'r.','MarkerSize',16);
plot(cg_pernad(1),cg_pernad(2),'r.','MarkerSize',16);

% pe
pee_p = dat(15,:);
ped_p = dat(16,:);
pee_d = dat(17,:);
ped_d = dat(18,:);

cg_pee = pee_p + 0.500 * (pee_d - pee_p);
cg_ped = ped_p + 0.500 * (ped_d - ped_p);

segpee = [pee_p;pee_d];
plot(segpee(:,1),segpee(:,2),'linewidth',3,'color','y')
segped = [ped_p;ped_d];
plot(segped(:,1),segped(:,2),'linewidth',3,'color','y')
plot(pee_p(1),pee_p(2),'.','MarkerSize',16);
plot(ped_p(1),ped_p(2),'.','MarkerSize',16);
plot(pee_d(1),pee_d(2),'.','MarkerSize',16);
plot(ped_d(1),ped_d(2),'.','MarkerSize',16);
plot(cg_pee(1),cg_pee(2),'r.','MarkerSize',16);
plot(cg_ped(1),cg_ped(2),'r.','MarkerSize',16);



cg_total = ((0.0823 * cg_cab) + (0.4601 * cg_tron) + (0.03075 * cg_brae) + (0.03075  * cg_brad) + ...
           (0.0172 * cg_abrae) + (0.0172 * cg_abrad) + (0.00575 * cg_maoe) + (0.00575 * cg_maod) + ...
           (0.11125 * cg_coxae) + (0.11125 * cg_coxad) + (0.0505 * cg_pernae) + (0.0505 * cg_pernad) + ...
           (0.0138 * cg_pee) + (0.0138 * cg_ped)) / 1;
       
cg_seg = [cg_cab , cg_tron , cg_brae  , cg_brad , cg_abrae , cg_abrad , cg_maoe ,...
          cg_maod , cg_coxae , cg_coxad , cg_pernae , cg_pernad , cg_pee , cg_ped]';       
       
plot(cg_total(1),cg_total(2),'r.','MarkerSize',28)

end
