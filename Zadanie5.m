close all
clear

E = [1, 1, 1, 1,-1;
	1,-1,-1,-1,-1;
	1,-1,-1,-1,-1;
	1, 1, 1,-1,-1;
	1,-1,-1,-1,-1;
	1,-1,-1,-1,-1;
	1, 1, 1, 1,-1;];
F = [1, 1, 1, 1,-1;
	1,-1,-1,-1,-1;
	1,-1,-1,-1,-1;
	1, 1, 1,-1,-1;
	1,-1,-1,-1,-1;
	1,-1,-1,-1,-1;
	1,-1,-1,-1,-1;];
G = [1, 1, 1, 1, 1;
	1,-1,-1,-1,-1;
	1,-1,-1,-1,-1;
	1,-1, 1, 1, 1;
	1,-1,-1,-1, 1;
	1,-1,-1,-1, 1;
	1, 1, 1, 1, 1;];
H = [1,-1,-1,-1, 1;
	1,-1,-1,-1, 1;
	1,-1,-1,-1, 1;
	1, 1, 1, 1, 1;
	1,-1,-1,-1, 1;
	1,-1,-1,-1, 1;
	1,-1,-1,-1, 1;];


figure(1);
subplot(2,2,1);
hintonw(E);
subplot(2,2,2);
hintonw(F);
subplot(2,2,3);
hintonw(G);
subplot(2,2,4);
hintonw(H);

T = [reshape(E,[],1), reshape(F,[],1), reshape(G,[],1), reshape(H,[],1)];
net=newhop(T);
disp(net.LW{1})
disp(net.b{1})

Ez = [1, 1, -1, 1,-1;
	1,-1,-1,-1,-1;
	1,1,-1,-1,-1;
	-1, -1, 1,1,-1;
	1,-1,-1,-1,-1;
	1,-1,-1,-1,-1;
	1, 1, 1, 1,-1;];
Fz = [1, -1, -1, 1,-1;
	1,-1,-1,-1,-1;
	1,-1,1,1,-1;
	1, 1, 1,-1,-1;
	1,-1,-1,-1,1;
	1,-1,-1,-1,-1;
	1,-1,-1,-1,-1;];
Gz = [1, 1, -1, 1, 1;
	1,-1,1,-1,-1;
	1,-1,-1,1,-1;
	1,-1, -1, 1, 1;
	1,-1,-1,-1, 1;
	1,-1,-1,-1, 1;
	1, 1, 1, 1, -1;];
Hz = [-1,-1,-1,-1, 1;
	1,-1,1,-1, -1;
	1,-1,-1,-1, 1;
	1, 1, -1, 1, 1;
	1,-1,-1,-1, 1;
	1,-1,-1,-1, 1;
	1,-1,-1,1, 1;];

Tz = [reshape(Ez,[],1), reshape(Fz,[],1), reshape(Gz,[],1), reshape(Hz,[],1)];

LS = 4;
KS = 8;
Y = sim(net, {LS,KS},{},{Tz});

% figure(2);
% for i=1:LS
% subplot(2,2,i); 
% hintonw(reshape(Y{1}(:,i),7,5));
% end
% figure(3);
% for i=1:LS
% subplot(2,2,i);
% hintonw(reshape(Y{2}(:,i),7,5));
% end
% figure(4);
% for i=1:LS
% subplot(2,2,i);
% hintonw(reshape(Y{3}(:,i),7,5));
% end
% figure(5);
% for i=1:LS
% subplot(2,2,i);
% hintonw(reshape(Y{4}(:,i),7,5));
% end
% figure(6);
% for i=1:LS
% subplot(2,2,i);
% hintonw(reshape(Y{5}(:,i),7,5));
% end

Es = zeros(KS, LS);
for i=1:KS
    for j=1:LS
        subplot(2,2,j)
        hintonw(reshape(Y{i}(:,j),7,5))
%Obliczenie wartości funkcji
        Es(i, j) = -1/2 * (Y{i}(:,j))' * net.LW{1} * Y{i}(:,j) - (net.b{1}') * Y{1}(:,j);
    end
 pause
end

%Rysowanie wykresów funkcji energetycznej E(k)
    for k = 1:4
        fh = figure(3);
        fh.WindowState = 'maximized';
        subplot(4,1,k)
        plot(Es(:, k));
        title('Wykres wartości funkcji energetycznej E(k) sieci Hopfielda')
        xlabel('Ilość kroków') 
        ylabel('Wartości funkcji')
    end
