pkg load image

im = imread(input('Qual a imagem que deseja calcular o angulo?  '));
imshow(im)

[x, y] = ginput(2)
res = [x', y'];

VHorizontal = -1 * [1, 0]
Vsaida = [x(2) - x(1), y(2) - y(1)]
Vsaida_norm = Vsaida / norm(Vsaida)
ProdIntVet = dot(VHorizontal, Vsaida_norm)
AnguloRad = acos(ProdIntVet)
AnguloGraus = acos(ProdIntVet) * 180/pi

%dlmwrite ("dadossalto.txt", res, "delimiter", ",", "-append")
