function [] = cadeextensora()

freq = 1000; % frequencia de aquisicao de 1000 Hz

data2import = input("Qual o arquivo que deseja analisar: ", "s");
data = load(data2import);


[valormax, posmax] = max(data);
posmax = round(posmax);


vet_tempo = ([1:length(data)]'  * 1/freq) - 1/freq;

close all

disp(["O tempo para atingir o maximo foi ", num2str(vet_tempo(posmax)), " segundos"])
disp(["O valor de forca maxima foi de ", num2str(valormax), " Newtons"])

figure()
plot(vet_tempo, data)
hold on 
plot(vet_tempo(posmax), data(posmax), "vr",  "markersize", 8)
xlabel("Time [s]")
ylabel("Force [N]")
pause(10)


end