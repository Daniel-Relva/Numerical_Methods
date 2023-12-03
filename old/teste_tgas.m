  x=zeros(3,1);
  
  H=0.5; %altura do leito de pelotas
  %constantes base do leito
  N=9; %numero de iteracoes para a altura
  
  U=0.028; % kcal/oC*m^2*sec
  Fgas=1.11;
  Yg=0.26;
  y=(0:H/N:H)';
  Tpel=zeros(10,1);
  Tpel(:,1)=1200;
  A=20;
  Tgas=zeros(10,1);
  Tgas(1,:)=15;
  %for j = 2:length(x)
    for i = 2:length(y)
      %calculo da temperatura do gas
      k1 = H/N * dtgas(Tpel(i-1),Tgas(i-1));
      k2 = H/N * dtgas(Tpel(i-1) + k1/2,Tgas(i-1) + k1/2);
      k3 = H/N * dtgas(Tpel(i-1) + k2/2,Tgas(i-1) + k2/2);
      k4 = H/N * dtgas(Tpel(i-1) + k3/2,Tgas(i-1) + k3);
      Tgas(i) = Tgas(i-1) + (k1 + 2*k2 + 2*k3 + k4)/6;
    endfor
  %endfor
  Tgas=flipud(Tgas)