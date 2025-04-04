f=@(x) 2*[exp(-(x/8 - 1).^6)].^12 +0.001*x.^3 - 2.5;

x_0=[1 , 10];
Delta=[10.^(-15:1:-1)];

%in order to change the starting point of the Newton's algorithm, I create 
% a x_1 vector which cointains the boundaries of the interval in reversed
%order.

x_1=[10,1];

%calculating the number of iterations with x=10 as a starting point
It1=zeros(size(Delta));
for i = 1:numel(Delta)
    z= newtonMethod(f,x_0, Delta(i));
    It1(i) = numel(z);
end

%calculating the number of iterations with x=1 as a starting point
It2=zeros(size(Delta));
for i = 1:numel(Delta)
    z= newtonMethod(f,x_1, Delta(i));
    It2(i) = numel(z);
end

semilogx( Delta, It1,'r', 'LineWidth', 2);
hold on;
semilogx( Delta, It2, 'b', 'LineWidth', 2);
hold off;
grid on;

title ("Number of iteration by different starting points for Newton's Method" , 'FontSize', 25, 'Interpreter', 'latex') ;
legend('x=10 as a starting point', 'x=1 as a starting point');
xlabel ("  $\Delta$ ", 'FontSize', 25,  'Interpreter', 'latex') ;
ylabel ("Number of iterations" , 'FontSize', 25, 'Interpreter', 'latex') ;

set ( gca ,'YTick', 0:1:22,  'XTick', 10.^(-15:1:-1), 'FontSize' ,18) ;
