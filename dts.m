function dtpelota = dts(Ts,Tg)
  A=20;
  U=0.028;
  mi=172;
  dts=(U*A*(Tg-Ts))/mi;
dtpelota=dts;
end