  clear;clc
 
  %variaveis do leito, constroem as matrizes usadas para calcular e guardar os valores da temperatura do gas e pelotas
  L=33; %comprimento da primeira sessao de resfriamento
  dx=0.3; %passo ao longo do comprimento
  x=(0:dx:L); %passos em relacao ao comprimento
  H=0.4; %altura do leito de pelotas
  N=9; %numero de iteracoes para a altura
  dy=H/N; %passos em relacao a altura
  y=(0:dy:H)'; %vetor dos passos da altura
  Tpel=zeros(length(y),length(x)); %matriz da temperatura das pelotas
  Tpel(:,1)=1200; %valor inicial das pelotas
  Tgas=zeros(length(y),length(x)); %matriz da temperatura do gas
  Tgas(1,:)=15; %valor inicial do gas
  
  %variaveis do gas e pelotas, estao nas equacoes diferenciais. Apenas aqui para informar o valor das constantes usadas
  U=0.028; % coeficiente de transferencia de calor
  Fgas=1.11; % fluxo massico de gas
  Yg=0.26; % calor especifico do gas
  A=320; % area de transferencia de calor 
  mi=172; %capacidade calorifica do volume de pelotas
  % os loops constroem primeiro as colunas das temperaturas, e depois progridem a linha, para simular a progressao das pelotas pelo leito 
  % o valor de Tpel depende da coluna anterior(para simular como elas se deslocam na grelha movel) 
  % e Tgas depende da linha anterior, pois seu fluxo vem de baixo do leito e e ascendente. A matriz de temperaturas esta de cabeca pra baixo em relacao a realidade
  for j = 2:length(x)
    for i = 2:length(y)
      %calculo da temperatura dos gas e pelotas por runge-kutta, quarta ordem.
      k1gas = dy*dtgas(Tpel(i,j-1),Tgas(i-1,j));
      k1pel = dx*dtpel(Tpel(i,j-1),Tgas(i-1,j));
      k2gas = dy*dtgas(Tpel(i,j-1) + k1pel/2,Tgas(i-1,j) + k1gas/2);
      k2pel = dx*dtpel(Tpel(i,j-1) + k1pel/2,Tgas(i-1,j) + k1gas/2);
      k3gas = dy*dtgas(Tpel(i,j-1) + k2pel/2,Tgas(i-1,j) + k2gas/2);
      k3pel = dx*dtpel(Tpel(i,j-1) + k2pel/2,Tgas(i-1,j) + k2gas/2);
      k4gas = dy*dtgas(Tpel(i,j-1) + k3pel,Tgas(i-1,j) + k3gas);
      k4pel = dx*dtpel(Tpel(i,j-1) + k3pel,Tgas(i-1,j) + k3gas);
      Tgas(i,j) = Tgas(i-1,j) + (k1gas + 2*k2gas + 2*k3gas + k4gas)/6;
      Tpel(i,j) = Tpel(i,j-1) + (k1pel + 2*k2pel + 2*k3pel + k4gas)/6;
    endfor
  endfor

  % construcao dos plots, sao usados tres conjuntos de valores para fim de comparacao
  plot (x,Tpel(2,:),x,Tpel(6,:),x,Tpel(10,:)) 
  title('Perfil de temperatura do leito')
  xlabel('Comprimento (m)')
  ylabel('Temperatura das pelotas')
  legend('Fundo','Meio','Topo','Location','southwest')
  legend('boxoff')
