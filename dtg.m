function dtgas = dtg (Ts,Tg)
A=20;
U=0.028;
Fg=1.11;
Yg=0.26;
dtg = (U*A*(Ts-Tg))/(Fg*Yg);
dtgas=dtg;
end