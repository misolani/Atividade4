% valores conhecidos
V1 = 12; % Volts
R1 = 10e3; % Ohms
C1 = 10e-3; % Farads

% Vc
t = 0:0.01:2*R1*C1; % Intervalo de 0 - 2*R*C
VC = V1 * (1 - exp(-t / (R1 * C1)));

%  pontos da reta secante
t1 = 0;
t2 = 2 * R1 * C1;
Vc1 = V1 * (1 - exp(-t1 / (R1 * C1)));
Vc2 = V1 * (1 - exp(-t2 / (R1 * C1)));

% reta secante
m = (Vc2 - Vc1) / (t2 - t1);
b = Vc1 - m * t1;
reta_secante = m * t + b;


figure;
plot(t, VC, 'b', 'LineWidth', 2); hold on;
plot([t1 t2], [Vc1 Vc2], 'r--', 'LineWidth', 2);

xlabel('Tempo (s)');
ylabel('Tensão no capacitor (Vc)');
title('Gráfico de Vc(t) e reta secante');
legend('Vc(t)', 'Reta secante');
grid on;
hold off;

