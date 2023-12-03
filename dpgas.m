function dpg = dpgas (Fgas,mug,rho)
R=287.05;
epsi=0.4;
dimp=0.012;
dpgas = (150*mug*(1-epsi)^2)/(dimp^2*epsi^3*rho)*Fgas+(1.75*mug(1-epsi)/(dimp*epsi*3*rho)*Fgas^2;
dpg=dpgas;
end