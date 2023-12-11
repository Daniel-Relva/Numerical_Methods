function dtpelota = dtpel(Tpel,Tgas)
  A=320; % area de transferencia de calor
  U=0.028; % coeficiente de transferencia de calor
  mi=172; %capacidade calorifica do volume de pelotas
  dtpel=(U*A*(Tgas-Tpel))/mi; %equacao diferencial para calcular a variacao da temperatura das pelotas
dtpelota=dtpel;
end
