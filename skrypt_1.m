clear all; 
close all;
clc;

%% określenie wzorców wejściowych (uczących)
% długości ramion manipulatorów
l1 = 1;
l2 = 1;

% współrzędne środka spirali
xsr = 0.7;
ysr = 0;

% stuelementowy wektor kątów kątów spirali
fi = [0:0.5:49.5];

% stuelementowy wektor promieni kolejnych punktów spirali
r = 0.01*fi;

% konwersja współrzędnych biegunowych na kartezjańskie
[x,y] = pol2cart(fi,r);

% wykres trajektorii uczącej
figure(1)
x = x+xsr; % modyfikacja środka spirali
y = y+ysr; % modyfikacja środka spirali
plot(x,y,'r*-');
grid on;
title('Wykres spiralnej trajektorii uczącej');
xlabel('Współrzędna odcięta');
ylabel('Współrzędna rzędna');

%% określenie wzorców wyjściowych
% konwersja współrzędnych położenia manipulatora na kąty jego przeubów
[alfa,beta] = odwrkin(x,y,l1,l2);

% wykres kątów przegubów przegubów manipulatora dla kolejnych punktów
% trajektorii
figure(2)
plot(alfa,'r*-');
hold on;
plot(beta,'b*-');
hold off;
grid on;
title('Wykres kątów przegubów przegubów manipulatora dla kolejnych punktów trajektorii');
xlabel('Kolejne punkty trajektorii');
ylabel('Wartość kątów');
legend('Kąt \alpha','Kąt \beta');

%% animacja działania manipulatora
% robotanim(alfa,beta,l1,l2); % wywołanie funcji

%% tworzenie sieci neuronowej
% macierz wzorców wejściowych
P = [x;y];

% macierz wzorców wyjściowych
T = [alfa;beta];

% zdefiniowanie sieci neuronowej
r1 = 1; % ilość neuronów w pierwszej warstwie
r2 = 2; % ilość neuronów w drugiej warstwie
net = newff(P,T,1000,{'tansig' 'purelin'});

% wyświetlanie początkowych współczynników sieci
% (net.IW{1})
% (net.LW{2})
% (net.b{1})
% (net.b{2})

% ustawienie metody uczenia - gradientowy algorytm największego spadku 
% z adaptacyjną zmianą wartości współczynnika prędkości uczenia oraz 
% tzw. człownem momentum
net.trainFcn = 'trainlm';

% docelowa wartość funkcji błędu
net.trainParam.goal = 0.00000001;

% maksymalna liczba kroków
net.trainParam.epochs = 2000;

% wyłączenie automatycznego przerwania uczenia
net.trainParam.max_fail = net.trainParam.epochs;

% wywołanie procedury uczenia neuronu
net = train(net,P,T);

% zapisywanie danych do pliku
save dane_ucz net l1 l2 P T;

