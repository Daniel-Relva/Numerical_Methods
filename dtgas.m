function dtg = dtgas (Tpel,Tgas,Fgas)
A=20;
U=0.028;
Fgas=1.11;
Yg=0.26;
dtgas = (U*A*(Tpel-Tgas))/(Fgas*Yg);
dtg=dtgas
end