  clear;clc
 
  %resolvido: runge kutta, antes estava variando muito porque eu estava
  % pegando os Ks errados (pelota pra gas etc), agora está tudo na moral
  % mas agora, so o A de 320 que faz algum sentido, com o fluxo constante
  
  L=33; %comprimento da primeira sessao de resfriamento
  dx=0.3; %passo ao longo do comprimento
  x=(0:dx:L); %passos em relacao ao comprimento
  
  H=0.4; %altura do leito de pelotas
  %constantes base do leito
  N=9; %numero de iteracoes para a altura
  dy=H/N; %passos em relacao£o a altura
  
  U=0.028; % coeficiente de transferencia de calor
  Fgas=1.11; % fluxo massico de gas
  Yg=0.26; % calor especifico do gas
  y=(0:dy:H)'; %vetor dos passos da altura
  Tpel=zeros(length(y),length(x)); %matriz da temperatura das pelotas
  Tpel(:,1)=1200; %valor inicial das pelotas
  Tgas=zeros(length(y),length(x)); %matriz da temperatura do gas
  Tgas(1,:)=15; %valor inicial do gas
  A=320; % area de transferencia de calor 
  for j = 2:length(x)
    for i = 2:length(y)
      %calculo da temperatura dos gÃ¡s e pelotas por runge-kutta, quarta ordem
      k1gas = dy*dtgas(Tpel(i,j-1),Tgas(i-1,j),A);
      k1pel = dx*dtpel(Tpel(i,j-1),Tgas(i-1,j),A);
      k2gas = dy*dtgas(Tpel(i,j-1) + k1pel/2,Tgas(i-1,j) + k1gas/2,A);
      k2pel = dx*dtpel(Tpel(i,j-1) + k1pel/2,Tgas(i-1,j) + k1gas/2,A);
      k3gas = dy*dtgas(Tpel(i,j-1) + k2pel/2,Tgas(i-1,j) + k2gas/2,A);
      k3pel = dx*dtpel(Tpel(i,j-1) + k2pel/2,Tgas(i-1,j) + k2gas/2,A);
      k4gas = dy*dtgas(Tpel(i,j-1) + k3pel,Tgas(i-1,j) + k3gas,A);
      k4pel = dx*dtpel(Tpel(i,j-1) + k3pel,Tgas(i-1,j) + k3gas,A);
      Tgas(i,j) = Tgas(i-1,j) + (k1gas + 2*k2gas + 2*k3gas + k4gas)/6;
      Tpel(i,j) = Tpel(i,j-1) + (k1pel + 2*k2pel + 2*k3pel + k4gas)/6;
    endfor
  endfor
  plot (x,Tpel(2,:))
