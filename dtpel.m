function dtpelota = dtpel(Tpel,Tgas,Fgas)
  A=420;
  U=0.1*sqrt(Fgas);
  mi=172;
  dtpel=(U*A*(Tgas-Tpel))/mi;
dtpelota=dtpel
end
