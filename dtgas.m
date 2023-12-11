function dtg = dtgas (Tpel,Tgas)
U=0.028; % coeficiente de transferencia de calor
A=320; % area de transferencia de calor
Fgas=1.11; % fluxo massico de gas
Yg=0.26; % calor especifico do gas
dtgas = (U*A*(Tpel-Tgas))/(Fgas*Yg); %equacao utilizada para determinar a variacao da temperatura do gas
dtg=dtgas;
end
