function dtpelota = dtpel(Tpel,Tgas)
  A=20;
  U=0.028;
  mi=172;
  dtpel=(U*A*(Tgas-Tpel))/mi;
dtpelota=dtpel
end