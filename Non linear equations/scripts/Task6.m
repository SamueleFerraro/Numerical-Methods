Delta=[10.^(-15:1:-1)];
f=@(x) 2*[exp(-(x/8 - 1).^6)].^12 +0.001*x.^3 - 2.5;
x_0=[1 , 10];

%Initializing I
I=zeros(size(Delta));

%Calculation according to the formula
I = ceil(log2((abs(x_0(2)-x_0(1)))./Delta));

%Calculation of the iterations by Task 5;
It1=zeros(size(Delta));
for i = 1:numel(Delta)
    z= bisectionMethod(f,x_0, Delta(i));
    It1(i) = numel(z);
end


semilogx(Delta, It1, 'ro-', 'LineWidth', 2, 'MarkerFaceColor', 'r', 'MarkerSize', 6);

hold on;
semilogx(Delta,I,'m', 'LineWidth', 2);
hold off;
grid on;

title ("Number of iteration by method" , 'FontSize', 25, 'Interpreter', 'latex') ;
legend('Iterative calculation', 'Formula Calculation' );
xlabel ("  $\Delta$ ", 'FontSize', 25,  'Interpreter', 'latex') ;
ylabel ("Number of iterations" , 'FontSize', 25, 'Interpreter', 'latex') ;

set ( gca ,'YTick', 0:2:60, 'XTick', 10.^(-15:1:-1), 'FontSize' ,18) ;