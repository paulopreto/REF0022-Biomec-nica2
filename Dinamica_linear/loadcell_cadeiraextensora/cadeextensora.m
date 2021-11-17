function [] = cadeextensora()

freq = 1000; % frequencia de aquisicao de 1000 Hz

data2import = input("Qual o arquivo que deseja analisar: ", "s");
data = load(data2import);


[valormax, posmax] = max(data);
posmax = round(posmax)


vet_tempo = ([1:length(data)]'  * 1/freq) - 1/freq;

close all
plot(vet_tempo, data)
hold on 
plot(vet_tempo(posmax), data(posmax), "vr",  "markersize", 8)

disp(["O tempo para atingir o máximo foi ", num2str(vet_tempo(posmax)), " segundos"])
disp(["O valor de força máxima foi de ", num2str(valormax), " Newtons"])


end