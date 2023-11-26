  x=zeros(3,1);
  
  H=0.5; %altura do leito de pelotas
  %constantes base do leito
  N=9; %numero de iteracoes para a altura
  
  U=0.028; % kcal/oC*m^2*sec
  Fg=1.11;
  Yg=0.26;
  y=(0:H/N:H)';
  Ts=zeros(10,1);
  Ts(:,1)=1200;
  A=20;
  Tg=zeros(10,1);
  Tg(1,:)=15;
  %for j = 2:length(x)
    for i = 2:length(y)
      %calculo da temperatura do gas
      k1 = H/N * dtg(Ts(i-1),Tg(i-1));
      k2 = H/N * dtg(Ts(i-1) + k1/2,Tg(i-1) + k1/2);
      k3 = H/N * dtg(Ts(i-1) + k2/2,Tg(i-1) + k2/2);
      k4 = H/N * dtg(Ts(i-1) + k3/2,Tg(i-1) + k3);
      Tg(i) = Tg(i-1) + (k1 + 2*k2 + 2*k3 + k4)/6;
    endfor
  %endfor
  Tg=flipud(Tg);