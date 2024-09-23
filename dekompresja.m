close all
clear

load 'obraz_komp.mat'

W=double(W);
ac=double(ac);

Ad=cell(Nx,Ny);

po=1;
for i=1:Ny
    for j=1:Nx
        Ad{i,j}=reshape(W(ac(po),:),ny,nx);
        po=po+1;
    end
end

obraz_dek=cell2mat(Ad);
figure(2)
colormap cool;

subplot(1,2,1)
obraz=imread('baboon.tif')
imagesc(obraz,[0,255]);

subplot(1,2,2)
imagesc(obraz_dek,[0,255]);