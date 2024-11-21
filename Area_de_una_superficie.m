function area = calcular_area_superficie_parametrizada(r, ulim, vlim)
    % Parámetros de entrada:
    % r: función vectorial de la superficie como handle @(u, v)
    % ulim: límites del parámetro u [umin, umax]
    % vlim: límites del parámetro v [vmin, vmax]

    syms u v
    r_vec = r(u, v); % Superficie parametrizada como vector
    
    % Derivadas parciales
    ru = diff(r_vec, u); % Derivada respecto a u
    rv = diff(r_vec, v); % Derivada respecto a v
    
    % Producto cruz
    cruz = cross(ru, rv);
    
    % Norma del producto cruz
    integrando = norm(cruz);
    
    % Realizar la integración
    area = double(int(int(integrando, u, ulim(1), ulim(2)), v, vlim(1), vlim(2)));
end

% Prueba de la función
r = @(u, v) [v * cos(u); v * sin(u); v]; % Superficie parametrizada: z = u^2 + v^2
ulim = [0, 2*pi]; % Límites de u
vlim = [0,10]; % Límites de v

% Cálculo del área
area = calcular_area_superficie_parametrizada(r, ulim, vlim);
disp(['El área calculada es: ', num2str(area)]);
