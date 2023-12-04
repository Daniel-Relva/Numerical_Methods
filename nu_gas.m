function viscosidadedinamicagas = nu_gas(temperatura)
    % Constantes
    C1 = 1.458e-6;  % constante Sutherland
    S = 110.4;      % temperatura Sutherland em kelvin

    % temperatura em kelvin
    T_kelvin = temperatura + 273.15;

    % viscosidade dinamica usando lei de Sutherland
    ViscosidadeDinamica = C1 * T_kelvin^(3/2) / (T_kelvin + S);

end
