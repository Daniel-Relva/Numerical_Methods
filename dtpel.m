function dtpelota = dtpel(Tpel,Tgas)
  A=320;
  U=0.028;
  mi=172; %capacidade calorifica do volume de pelotas
  dtpel=(U*A*(Tgas-Tpel))/mi;
dtpelota=dtpel;
end