%parameters definition
tspan=[0,1];
p=[13,0.14,0.06,13];
x0=520;
y0=30;
IC=[x0,y0];%Initial Conditions


%solving the set of ODE
[t, y] = ode45(@(t,y) lotka_volterra(t, y, p), tspan,IC);

%Taking the x and y function from the solution
x = y(:, 1);
y = y(:, 2);

plot(t, x, 'r', 'LineWidth', 2);  % Plot per x
hold on;
plot(t, y, 'b', 'LineWidth', 2);  % Plot per y
hold off;
grid on;
title('Solution by ode45');
xlabel("$t$", 'FontSize', 25, 'Interpreter', 'latex');
ylabel("$x(t), y(t)$", 'FontSize', 25, 'Interpreter', 'latex');
legend('x', 'y');
yticks ( 0 : 50 : 700  ) ;
xticks ( tspan(1) : 0.05: tspan(2)) ;
set(gca, 'FontSize', 20);
