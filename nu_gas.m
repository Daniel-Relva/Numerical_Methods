function nu = nu_gas(Tgas)
  % Constantes
  T0 = 273.15; % Temperatura de referência em Kelvin (0 graus Celsius)
  nu0 = 1.458e-6; % Viscosidade cinemática do ar a T0 em m^2/s
  C = 110.4; % Constante de Sutherland em Kelvin
  T = Tgas + 273.15;
  
  % Calcular viscosidade cinemática usando a fórmula de Sutherland
  nu = nu0 * ((T0 + C) / (T + C)) * ((T) / T0)^1.5;
end
