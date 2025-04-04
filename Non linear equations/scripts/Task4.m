f=@(x) 2*[exp(-(x/8 - 1).^6)].^12 +0.001*x.^3 - 2.5;

x_0=[1 , 10];
Delta= 10^(-12);

z0 = fzero(f,x_0);

%calculating the absolute error for Bisection
z1=bisectionMethod(f,x_0,Delta);
AbError1= abs(z1 - z0);

%Absolute error for Regula-falsi method
z2=Regula_FalsiMethod(f,x_0,Delta);
AbError2= abs(z2-z0);

%Absolute error for Newton's method
z3=newtonMethod(f,x_0,Delta);
AbError3=abs(z3-z0);

%Absolute error for Muller's method
z4=mullerMethod(f,x_0,Delta);
AbError4=abs(z4-z0);

%In order to plot everything, I need to put every array at the same length;
len=max([numel(AbError4), numel(AbError3), numel(AbError2), numel(AbError1)]);

%building the array full of zeros to append for each function
App1=zeros(1,len-length(AbError1));
App2=zeros(1,len-length(AbError2));
App3=zeros(1,len-length(AbError3));
App4=zeros(1,len-length(AbError4));

%appending
AbError1 = [AbError1, App1];
AbError2 = [AbError2, App2];
AbError3 = [AbError3, App3];
AbError4 = [AbError4, App4];


%plotting the absolute error

semilogy(AbError1, 'LineWidth', 2);
hold on;
semilogy(AbError2, 'LineWidth', 2);
hold on;
semilogy(AbError3, 'LineWidth', 2);
hold on;
semilogy(AbError4, 'LineWidth', 2);
hold off;

grid on;

title ("Absolute error plot" , 'FontSize', 25, 'Interpreter', 'latex') ;
yticks(10.^(-14:1:2));
legend('Bisection', 'Regula-Falsi', 'Newton', 'Muller');
xlabel (" Number of iterations ", 'FontSize', 25,  'Interpreter', 'latex') ;
ylabel ("$\Delta$" , 'FontSize', 25, 'Interpreter', 'latex') ;
set ( gca ,'FontSize' ,20) ;

