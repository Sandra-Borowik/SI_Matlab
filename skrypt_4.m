clear all;
close all;
clc;
%% długości ramion manipulatorów
l1 = 1; %długość pierwszego ramienia
l2 = 1; %długość drugiego ramienia

%% proste zadanie kinematyki
alfap= [0:0.05:pi]; % wektor kątów alfa
betap = [0:0.05:pi]; % wektor kątów beta
[alfamp,betamp] = meshgrid(alfap,betap); %tworzenie siatki argumentów wejściowycyh funkcji
[xp,yp] = prostkin(alfamp,betamp,l1,l2); % rozwiązanie prostego zadania kinematyki

figure(1)
plot3(alfamp,betamp,xp,'bo')
grid on;
title('Zależność współrzędnej x od kątów alfa i beta');
xlabel('Kąt alfa');
ylabel('Kąt beta');
zlabel('Wsółrzędna x');

figure(2)
plot3(alfamp,betamp,yp,'bo')
grid on;
title('Zależność współrzędnej y od kątów alfa i beta');
xlabel('Kąt alfa');
ylabel('Kąt beta');
zlabel('Wsółrzędna y');

%% odwrotne zadanie kinematyki
xo = [-1:0.05:1]; % wektor kątów alfa
yo = [-1:0.05:1]; % wektor kątów beta
[xmo,ymo] = meshgrid(xo,yo); %tworzenie siatki argumentów wejściowycyh funkcji
[alfao,betao] = odwrkin(xo,yo,l1,l2); % rozwiązanie prostego zadania kinematyki

figure(3)
plot3(xmo,ymo,alfao,'bo')
grid on;
title('Zależnośc kąta alfa od współrzędnych x i y');
xlabel('Wsółrzędna x');
ylabel('Wsółrzędna y');
zlabel('Kąt alfa');

figure(4)
plot3(xmo,ymo,betao,'bo')
grid on;
title('Zależność kąta beta od współrzędnych x i y');
xlabel('Wsółrzędna x');
ylabel('Wsółrzędna y');
zlabel('Kąt beta');