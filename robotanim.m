function robotanim(alfa,beta,l1,l2)
% Animacja działania manipulatora planarnego o dwóch ramionach
% Postać wywołania: robotanim(alfa,beta,l1,l2)
% gdzie:
% alfa, beta - kąty przegubów (wektory),
% l1, l2 - długości ramion (skalary).
% K.Bartecki, 2020
  
  figure;  
  title('Animacja działania manipulatora dla danych kątów przegubów \alpha i \beta');
  axis([-(l1+l2+0.1) l1+l2+0.1 -(l1+l2+0.1) l1+l2+0.1]);
  xlabel('x')
  ylabel('y')
  grid on
  hold on;
    
  xp1=0; yp1=0;				% środek manipulatora (położenie 1 przegubu)
  xp2=xp1; yp2=yp1+l1;      % położenie 2 przegubu
  xc=xp2; yc=yp2+l2;        % położenie chwytaka
  
  x=[xp1 xp2 NaN xp2 xc];
  y=[yp1 yp2 NaN yp2 yc];
    
  hndl=plot(x,y,'LineWidth',5,'Marker','.','MarkerSize',30);
  ht = text(0.1,0,'Naciśnij dowolny klawisz')
  pause
  delete(ht)
   
  for i=1:length(alfa)
     
     xp2=xp1+l1*cos(alfa(i)); 
     yp2=yp1+l1*sin(alfa(i));
     xc=xp2+l2*cos(alfa(i)+beta(i)); 
     yc=yp2+l2*sin(alfa(i)+beta(i));
     
     x=[xp1 xp2 NaN xp2 xc];
     y=[yp1 yp2 NaN yp2 yc];
     set(hndl,'XData',x,'YData',y);
     drawnow;
     plot(xc,yc,'Marker','.','MarkerSize',5)
     pause(0.05)
      
 end 