function dtg = dtgas (Tpel,Tgas)
U=0.028;
A=320;
Fgas=1.11;
Yg=0.26;
dtgas = (U*A*(Tpel-Tgas))/(Fgas*Yg);
dtg=dtgas;
end