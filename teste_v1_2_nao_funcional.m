  clear;clc
 
  % runge kutta antes estava variando muito porque eu estava
  % pegando os Ks errados (pelota pra gas etc), mas o ajuste com os passos continua errado
  % Essa funcao vai divergir 
  
  L=3; %comprimento da primeira sessao de resfriamento, reduzida neste caso para teste. em m
  dx=0.3; %passo ao longo do comprimento
  x=(0:dx:L); %passos em relacao ao comprimento
  
  H=0.4; %altura do leito de pelotas, em m
  %constantes base do leito
  N=9; %numero de iteracoes para a altura
  dy=H/N; %passos em relacao a altura
  
  U=0.028; % coeficiente de transferencia de calor
  Fgas=1.11; %fluxo massico do gas
  Yg=0.26; %calor especifico do gas
  y=(0:dy:H)'; %vetor dos passos da altura
  Tpel=zeros(length(y),length(x)); %matriz da temperatura das pelotas
  Tpel(:,1)=1200; %valor inicial das pelotas
  Tgas=zeros(length(y),length(x)); %matriz da temperatura do gas
  Tgas(1,:)=15; %valor inicial do gas
  A=320;
  for j = 2:length(x)
    for i = 2:length(y)
      %calculo da temperatura do gas e pelotas por runge-kutta, quarta ordem, com os passos de dx e dy 
      k1gas = dy*dtgas(Tpel(i,j-1),Tgas(i-1,j));
      k1pel = dx*dtpel(Tpel(i,j-1),Tgas(i-1,j));
      k2gas = dy*dtgas(Tpel(i,j-1) + (k1pel*dx)/2,Tgas(i-1,j) + (k1gas*dy)/2);
      k2pel = dx*dtpel(Tpel(i,j-1) + (k1pel*dx)/2,Tgas(i-1,j) + (k1gas*dy)/2);
      k3gas = dy*dtgas(Tpel(i,j-1) + (k2pel*dx)/2,Tgas(i-1,j) + (k2gas*dy)/2);
      k3pel = dx*dtpel(Tpel(i,j-1) + (k2pel*dx)/2,Tgas(i-1,j) + (k2gas*dy)/2);
      k4gas = dy*dtgas(Tpel(i,j-1) + (k3pel*dx),Tgas(i-1,j) + (k3gas*dy));
      k4pel = dx*dtpel(Tpel(i,j-1) + (k3pel*dx),Tgas(i-1,j) + (k3gas*dy));
      Tgas(i,j) = Tgas(i-1,j) + (k1gas + 2*k2gas + 2*k3gas + k4gas)/6;
      Tpel(i,j) = Tpel(i,j-1) + (k1pel + 2*k2pel + 2*k3pel + k4gas)/6;
    endfor
  endfor
  plot (x,Tpel(2,:))