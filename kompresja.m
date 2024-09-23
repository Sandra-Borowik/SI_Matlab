close all
clear

info = imfinfo('baboon.tif');
obrazek = imread('baboon.tif');
figure(1)
colormap cool
imagesc(obrazek,[0,255]);

nx=4;
ny=4;

Ny = (info.Width/nx);
Nx = (info.Height/ny);

A = mat2cell(obrazek,repmat(ny,1,Ny),repmat(nx,1,Nx));

A{1,1}

P=zeros(nx*ny,Nx*Ny);

po = 1;

for i=1:Ny
    for j=1:Nx
       
        P(:,po)=reshape(A{i,j},[],1);
        %%(i-1)*Nx+j zamiast :,po
        po=po+1; 
    end
end


eta=0.1;
N=2;

net=newc(P,N,eta);

disp('Rozmiary macierzy wag: ')
disp(net.IW)
disp('Zawartość macierzy wag: ')
disp(net.IW{1}) 

nf=((Nx*Ny)/8);
r=randperm(Nx*Ny);
Fi=r(1:nf);

Pu=P(:,Fi);

net.trainParam.epochs=1;
net=train(net,Pu);
disp(net.IW)
disp(net.IW{1})


W=net.IW{1};

a=sim(net,P);
af=full(a);
ac=vec2ind(af);

W=uint8(W);
ac=uint8(ac);

save obraz_komp.mat W ac Nx Ny nx ny