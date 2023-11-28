  L=3; %comprimento da primeira seção de resfriamento
  dx=0.3; %passo ao longo do comprimento
  x=(0:dx:L); %passos em relação ao comprimento
  
  H=0.5; %altura do leito de pelotas
  %constantes base do leito
  N=9; %numero de iteracoes para a altura
  dy=H/N; %passos em relação a altura
  
  U=0.028; % kcal/oC*m^2*sec
  Fgas=1.11;
  Yg=0.26;
  y=(0:dy:H)'; %vetor dos passos da altura
  Tpel=zeros(length(y),length(x)); %matriz da temperatura das pelotas
  Tpel(:,1)=1200; %valor inicial das pelotas
  A=20;
  Tgas=zeros(length(y),length(x)); %matriz da temperatura do gas
  Tgas(1,:)=15; %valor inicial do gas
  for j = 2:length(x)
    for i = 2:length(y)
      %calculo da temperatura dos gás e pelotas por runge-kutta, quarta ordem
      k1gas = dy * dtgas(Tpel(i,j-1),Tgas(i-1,j));
      k1pel = dx * dtpel(Tpel(i,j-1),Tgas(i-1,j));
      k2gas = dy * dtgas(Tpel(i,j-1) + k1/2,Tgas(i-1,j) + k1/2);
      k2pel = dx * dtpel(Tpel(i,j-1) + k1/2,Tgas(i-1,j) + k1/2);
      k3gas = dy * dtgas(Tpel(i,j-1) + k2/2,Tgas(i-1,j) + k2/2);
      k3pel = dx * dtpel(Tpel(i,j-1) + k2/2,Tgas(i-1,j) + k2/2);
      k4gas = dx * dtgas(Tpel(i,j-1) + k3/2,Tgas(i-1,j) + k3);
      k4pel = dx * dtpel(Tpel(i,j-1) + k3/2,Tgas(i-1,j) + k3);
      Tgas(i,j) = Tgas(i-1,j) + (k1gas + 2*k2gas + 2*k3gas + k4gas)/6;
      Tpel(i,j) = Tpel(i,j-1) + (k1pel + 2*k2pel + 2*k3pel + k4pel)/6;
    endfor
  endfor
