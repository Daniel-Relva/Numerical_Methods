  x=zeros(2,1);
  
  H=0.5; %altura do leito de pelotas
  %constantes base do leito
  N=9; %numero de iteracoes para a altura
  
  U=0.028; % kcal/oC*m^2*sec
  Fgas=1.11;
  Yg=0.26;
  y=(0:H/N:H)';
  Tpel=zeros(2,2);
  Tpel(:,1)=1200;
  A=20;
  mi=152;
  Tgas=zeros(2,1);
  Tgas(1,:)=15;
  for j = 2:length(x)
      %calculo da temperatura das pelotas
      k1 = H/N * dtpel(Tpel(j,j-1),Tgas(j-1));
      k2 = H/N * dtpel(Tpel(j,j-1) + k1/2,Tgas(j-1) + k1/2);
      k3 = H/N * dtpel(Tpel(j,j-1) + k2/2,Tgas(j-1) + k2/2);
      k4 = H/N * dtpel(Tpel(j,j-1) + k3/2,Tgas(j-1) + k3);
      Tpel(j,j) = Tpel(j,j-1) + (k1 + 2*k2 + 2*k3 + k4)/6;
  endfor
Tpel=flipud(Tpel)