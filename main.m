
L=18; %comprimento da primeira seção de resfriamento
dx=0.3; %passo ao longo do comprimento
x=(0:dx:L); %passos em relação ao comprimento

H=0.5; %altura do leito de pelotas
%constantes base do leito
N=9; %numero de iteracoes para a altura
dy=H/N; %passos em relação a altura
U=0.028; % kcal/oC*m^2*sec
Fgas=1.11;
Yg=0.26;
y=(0:dy:H)'; %vetor dos passos da altura