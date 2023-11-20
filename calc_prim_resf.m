function T = calc_prim_resf (Tg0,To)
  %Variaveis de entrada, prototipo do codigo da primeira parte do resfriamento
  %To=1200; temperatura da pelota
  %tg0=15; temperatura do gas
  %x=33; tamanho da primeira sessao de resfriamento
  %H=0.5; temperatura do leito de pelotas
  %constantes base
  U=0.028; % kcal/oC*m^2*sec
  Fg=1.11;
  Yg=0.26;
  R=2*10^-2;
  Lmbds=o.14*10^-3;
  ps=3500;
  Ys=0.20;
  epsi=0.4;
  dp=0.012;
  %para as grelhas
  A=20;
  mi=172;
  %constantes condicionais
  Ulinha= 0.1*sqrt(fg);
  minovo=634*(1-epsi)*H
  V=(1-epsi)*3.5*H;
  A=6*V/dp;
  %equacoes
  Tg=Tg0;
  Ts=To;
  dts=(Ulinha*A(Tg-Ts)/minovo;
  dtg=(Ulinha*A(Ts-Tg)/Fg*Yg;  
  T=[dts;dtg];