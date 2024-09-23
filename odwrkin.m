function [alfa,beta] = odwrkin(x,y,l1,l2)
% Funkcja "odwrkin" służy do rozwiązywania odwrtotnego zadania kinematyki, na
% podstawie podanych współrzędnych położenie końcówki chwytaka na płaszczyźnie
% oblicza odpowiadające im kąty ugięcia przegubów
% [alfa,beta] = odwrkin(x,y,l1,l2)
% x - pierwsza współrzędna położenia
% y - druga współrzędna położenia
% alfa - kąt ugięcia pierwszego przegubu
% beta - kąt ugięcia drugiego przegubu
% l1 - długość pierwszego ramienia
% l2 - długość drugiego ramienia
c2l = (x.^2)+(y.^2)-(l1.^2)-(l2.^2);
c2m = 2*l1*l2;
c2 = c2l/c2m;
s2 = sqrt(1-(c2.^2));
k1 = l1+l2*c2;
k2 = l2*s2;
alfa = atan2(y,x)-atan2(k2,k1);
beta = atan2(s2,c2);
end