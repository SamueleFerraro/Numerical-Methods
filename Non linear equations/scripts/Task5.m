Delta=[10.^(-15:1:-1)];

f=@(x) 2*[exp(-(x/8 - 1).^6)].^12 +0.001*x.^3 - 2.5;
x_0=[1 , 10];

%Number of iteration of a bisection method

%initializing the array where I want to put the result of each iteration of the for loop
It1=zeros(size(Delta));
for i = 1:numel(Delta)
    z= bisectionMethod(f,x_0, Delta(i));
    It1(i) = numel(z);
end

%Number of iteration for Regula-falsi method
It2=zeros(size(Delta));
for i = 1:numel(Delta)
    z= Regula_FalsiMethod(f,x_0, Delta(i));
    It2(i) = numel(z);
end

%Number of iteration for Newton's Method
It3=zeros(size(Delta));
for i = 1:numel(Delta)
    z= newtonMethod(f,x_0, Delta(i));
    It3(i) = numel(z);
end

%Number of iteration for Muller's method
It4=zeros(size(Delta));
for i = 1:numel(Delta)
    z = mullerMethod(f,x_0, Delta(i));
    It4(i) = numel(z);
end

%plotting the results

semilogx( Delta, It1,'r', 'LineWidth', 2);
hold on;
semilogx( Delta, It2, 'b', 'LineWidth', 2);
hold on;
semilogx( Delta, It3,'m', 'LineWidth', 2);
hold on;
semilogx( Delta, It4,'g',  'LineWidth', 2);
hold on;
grid on;

title ("Number of iteration by method" , 'FontSize', 25, 'Interpreter', 'latex') ;
legend('Bisection', 'Regula-Falsi', 'Newton', 'Muller');
xlabel ("  $\Delta$ ", 'FontSize', 25,  'Interpreter', 'latex') ;
ylabel ("Number of iterations" , 'FontSize', 25, 'Interpreter', 'latex') ;

set ( gca ,'YTick', 0:2:60, 'XTick', 10.^(-15:1:-1), 'FontSize' ,18) ;

