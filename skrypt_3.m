close all;
clear all;
clc;

%% ładowanie danych uczących
load dane_ucz.mat;

%% definiowanie wektórów reprezentujących współrzędne trajektorii uczącej
xab = [0.2:0.05:1.2];
yab = [0.5:-0.05:-0.5];
xbc = linspace(1.2,1.2,21);
ybc = [-0.5:0.05:0.5];
xcd = [1.2:-0.05:0.2];
ycd = [0.5:-0.05:-0.5];
xda = linspace(0.2,0.2,21);
yda = [-0.5:0.05:0.5];

%% definiowanie wektórów współrzędnych łamanej
xt = [xab xbc xcd xda];
yt = [yab ybc ycd yda];

%% wykres trajektorii testowej
figure(1)
plot(xt,yt,'r*-');
grid on;
title('Wykres łamanej trajektorii testowej');
xlabel('Współrzędna odcięta');
ylabel('Współrzędna rzędna');

%% symulowanie działania sieci neuronowej
PT = [xt;yt]; % macierz wzorców wejściowych
YT = sim(net,PT);
% wygenerowane przez sieć wartości kątów przegubów
alfast = YT(1,:);
betast = YT(2,:);

%% wykres porównawczy wzorcowych i generowanych przez sieć kątów alfa i beta
l1 = 1; %długość pierwszego ramienia
l2 = 1; %długość drugiego ramienia
[alfat,betat] = odwrkin(xt,yt,l1,l2); %obliczanie kątów ramion dla trajektorii wzorcowej
figure(2)
plot(alfat, 'ro-'); %wzorcowe wartości kąta alfa
hold on; 
plot(betat, 'bo-'); %wzorcowe wartości kąta beta
hold on;
plot(alfast, 'r+-'); %generowane wartości kąta alfa
hold on; 
plot(betast, 'b+-'); %generowane wartości kąta beta
hold off;
grid on;
title('Wykres porównawczy wzorcowych i generowanych przez sieć kątów alfa i beta');
xlabel('Położenie chwytaka');
ylabel('Wartość kątów');
legend('Wzorcowe wartości kąta alfa','Wzorcowe wartości kąta beta','Generowane wartości kąta alfa','Generowane wartości kąta beta');

%% wykres porównawczy trajektorii
[xts,yts] = prostkin(alfast,betast,l1,l2) %obliczanie współrzędnych wygenerowanej trajektorii
figure(3)
plot(xt,yt,'ro-'); %trajektoria wzorcowa (łamana)
hold on;
plot(xts,yts,'b+-'); %trajektoria wygenerowana przez sieć nauronową
hold off;
grid on;
title('Wykres porównawczy trajektorii');
xlabel('Współrzędna odcięta');
ylabel('Współrzędna rzędna');
legend('Trajektoria ucząca','Trajektoria wygenerowana przez sieć neuronową');

%% animacja działania manipulatora dla trajketori wzorcowej
robotanim(alfat,betat,l1,l2); % wywołanie funcji

%% animacja działania manipulatora dla trajketori generowanej przez sieć
robotanim(alfast,betast,l1,l2); % wywołanie funcji