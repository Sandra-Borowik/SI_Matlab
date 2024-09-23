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
hintonw(E);

figure(2);
hintonw(F);

figure(3);
hintonw(G);

figure(4);
hintonw(H);

P = [reshape(E,35,1), reshape(F,35,1), reshape(G,35,1), reshape(H,35,1)];
T=eye(4);

net = newp(P,T,'hardlim','learnp');

disp('Rozmiary macierzy wag: ')
disp(net.IW)
disp('Zawartość macierzy wag: ')
disp(net.IW{1})
disp('Rozmiary wektora wsp. progowych: ')
disp(net.b)
disp('Zawartość wektora wsp. progowych: ')
disp(net.b{1})

net.trainParam.epochs = 50;
net = train(net,P,T);

[Y] = sim(net, P);

for i=1:4
    figure(i+4);
    subplot(1,2,1);
    hintonw(reshape(P(:,i),7,5));
    subplot(1,2,2);
    hintonw(Y(:,i));
end

Ez = [1,-1,-1, 1,-1;
      1,-1,-1,-1,-1;
      1,-1,-1,-1,-1;
      1, 1, 1,-1,-1;
      1,-1,-1,-1,-1;
      1,-1,-1,-1,-1;
      1, 1, 1, 1,-1;];

Fz = [1,-1,-1, 1,-1;
      1,-1,-1,-1,-1;
      1,-1,-1,-1,-1;
      1, 1, 1,-1,-1;
      1,-1,-1,-1,-1;
      1,-1,-1,-1,-1;
      1,-1,-1,-1,-1;];

Gz = [1, 1,-1, 1, 1;
      1,-1,-1,-1,-1;
      1,-1,-1,-1,-1;
      1,-1,-1, 1, 1;
      1,-1,-1,-1, 1;
      1,-1,-1,-1, 1;
      1, 1, 1, 1, 1;];

Hz = [1,-1, 1,-1, 1;
      1,-1,-1,-1, 1;
      1,-1,-1,-1, 1;
      1, 1,-1, 1, 1;
      1,-1,-1,-1, 1;
      1,-1,-1,-1, 1;
      1,-1,-1,-1, 1;];

Pz = [reshape(Ez,35,1), reshape(Fz,35,1), reshape(Gz,35,1), reshape(Hz,35,1)];

[Yz] = sim(net, Pz);

for i=1:4
    figure(i+8);
    subplot(1,2,1);
    hintonw(reshape(Pz(:,i),7,5));
    subplot(1,2,2);
    hintonw(Yz(:,i));
    pause(3);
end



