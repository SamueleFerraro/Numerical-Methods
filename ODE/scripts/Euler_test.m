%parameters definition
tspan=[0,1];
p=[13, 0.14, 0.06, 13];
x0=520;
y0=30;
IC=[x0,y0];%Initial Conditions
h=0.005;


[t,x,y]=euler_exp(@(t,x,y)lotka_volterra(t,[x,y],p),tspan,IC,h,p);


plot(t, x, 'r', 'LineWidth', 2);  % Plot x
hold on;
plot(t, y, 'b', 'LineWidth', 2);  % Plot y
hold off;
grid on;
title('Solution by Euler explicit');
xlabel("$t$", 'FontSize', 25, 'Interpreter', 'latex');
ylabel("$x(t), y(t)$", 'FontSize', 25, 'Interpreter', 'latex');
legend('x', 'y');
yticks ( 0 : 50 : 900 ) ;
xticks ( tspan(1) : 0.05: tspan(2)) ;
set(gca, 'FontSize', 20);
