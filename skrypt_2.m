close all;
clear all;
clc;

%% ładowanie danych uczących
load dane_ucz.mat;

%% symulowanie działania sieci neuronowej
Y = sim(net,P);

%% tworzenia macierzy błędów
E = T - Y;

%% wyznaczanie wartości sumarycznego błędu średniokwadratowego
[a,b] = size(E);
SSE = sumsqr(E)/(a*b); %liczone wzorem
ssE = sse(E); %liczone funckją

%% wzorcowe wartości kątów przegubów
alfa = T(1,:);
beta = T(2,:);

%% wygenerowane przez sieć wartości kątów przegubów
alfas = Y(1,:);
betas = Y(2,:);

%% wykres porównawczy wzorcowych i generowanych przez sieć kątów alfa i beta
figure(1)
plot(alfa, 'ro-'); %wzorcowe wartości kąta alfa
hold on; 
plot(beta, 'bo-'); %wzorcowe wartości kąta beta
hold on;
plot(alfas, 'r+-'); %generowane wartości kąta alfa
hold on; 
plot(betas, 'b+-'); %generowane wartości kąta beta
hold off;
grid on;
title('Wykres porównawczy wzorcowych i generowanych przez sieć kątów alfa i beta');
xlabel('Położenie chwytaka');
ylabel('Wartość kątów');
legend('Wzorcowe wartości kąta alfa','Wzorcowe wartości kąta beta','Generowane wartości kąta alfa','Generowane wartości kąta beta');

%% wykres błędów aproksymacji neuronowej
Ealfa = E(1,:);
Ebeta = E(2,:);
figure(2)
plot(Ealfa, 'ro-'); %błąd kąta alfa
hold on; 
plot(Ebeta, 'bo-'); %błąd kąta beta
hold off;
grid on;
title('Wykres błędów aproksymacji neuronowej');
xlabel('Położenie chwytaka');
ylabel('Wartość błędów');
legend('Błąd kąta alfa','Błąd kąta beta');
%% wykres porównawczy trajektorii
l1 = 1; %długość pierwszego ramienia
l2 = 1; %długość drugiego ramienia
x = P(1,:);
y = P(2,:);
[xs,ys] = prostkin(alfas,betas,l1,l2) %obliczanie współrzędnych wygenerowanej trajektorii
figure(3)
plot(x,y,'ro-'); %trajektoria wzorcowa (spiralna)
hold on;
plot(xs,ys,'b+-'); %trajektoria wygenerowana przez sieć nauronową
hold off;
grid on;
title('Wykres porównawczy trajektorii');
xlabel('Współrzędna odcięta');
ylabel('Współrzędna rzędna');
legend('Trajektoria ucząca','Trajektoria wygenerowana przez sieć neuronową');

%% animacja działania manipulatora dla wygenerowanej trajektorii
robotanim(alfas,betas,l1,l2); % wywołanie funcji
