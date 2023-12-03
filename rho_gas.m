function rho = rho_gas(Tgas, P)
  % Constantes
  R = 287.05; % Constante específica do ar em J/(kg·K)
  T = Tgas + 273.15;
  % Calcular densidade do ar
  rho = P / (R * T);
end
