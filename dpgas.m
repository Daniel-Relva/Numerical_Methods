function dpg = dpgas (Tgas,Fgas,Pgas,mig)
R=287.05;
epsi=0.4;
dimp=0.012;
rho= Pgas/(R*Tgas);
dpgas = (150*mig*(1-epsi)^2)/(dimp^2*epsi^3*rho)*Fgas+(1.75*mig(1-epsi)/(dimp*epsi*3*rho)*Fgas^2;
dpg=dpgas;
end