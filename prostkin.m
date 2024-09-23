function [x,y] = prostkin(alfa,beta,l1,l2)
% Funkcja "prostkin" służy do rozwiązywania prostego zadania kinematyki, na
% podstawie podanych kątów ugięcia przegubów ma za zadanie wyznaczyć
% położenie końcówki manipulatora w układzie wpołrzędnych.
% [x,y] = prostkin(alfa,beta,l1,l2)
% x - pierwsza współrzędna położenia
% y - druga współrzędna położenia
% alfa - kąt ugięcia pierwszego przegubu
% beta - kąt ugięcia drugiego przegubu
% l1 - długość pierwszego ramienia
% l2 - długość drugiego ramienia
x = l1*cos(alfa)+l2*cos(alfa+beta);
y = l1*sin(alfa)+l2*sin(alfa+beta);
end