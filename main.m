%+++++++++++++++++++++++++++
% Variávies Leito
%+++++++++++++++++++++++++++
L=33; %comprimento da primeira seção de resfriamento
dx=0.3; %passo ao longo do comprimento
H=0.5; %altura do leito de pelotas

%+++++++++++++++++++++++++++
% Variáveis Pelotas
%+++++++++++++++++++++++++++
A= 420; %Área de transferencia de calor por unidade
dp = 0.012 %Diametro medio das pelotas
Tpel_0 = 1200; %Temperatura inicial das pelotas

%+++++++++++++++++++++++++++
% Variáveis Gás
%%+++++++++++++++++++++++++++
Fgas=1.11; %fluxo de gás 
Yg=0.26; %calor especifico do gás
U=0.028; % kcal/oC*m^2*sec
Tgas_0 = 15; %Temperatura inicial do gás

%+++++++++++++++++++++++++++
% Variáveis Simulação
%+++++++++++++++++++++++++++
N=9; %numero de iteracoes para a altura
dy=H/N; %passos em relação a altura

%+++++++++++++++++++++++++++
% Inicialização dos vetores
%+++++++++++++++++++++++++++
x=(0:dx:L); %passos em relação ao comprimento
y=(0:dy:H)'; %vetor dos passos da altura

%+++++++++++++++++++++++++++
% Inicialização das matrizes
%+++++++++++++++++++++++++++
Tpel=zeros(length(y),length(x)); %matriz da temperatura das pelotas
Tgas=zeros(length(y),length(x)); %matriz da temperatura do gas



Tgas(1,:)= Tgas_0; %valor inicial do gas
Tpel(:,1)= Tpel_0; %valor inicial das pelotas

