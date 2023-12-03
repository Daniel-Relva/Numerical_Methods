function rho = rho_gas(T, P)
  % Constantes
  R = 287.05; % Constante específica do ar em J/(kg·K)
  
  % Calcular densidade do ar
  rho = P / (R * T);
end