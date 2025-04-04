f=@(x) 2*[exp(-(x/8 - 1).^6)].^12 +0.001*x.^3 - 2.5;

%defining limits 
x_0=[1 , 10]; 

%calculating the zero
z=fzero(f, x_0);
disp(z);

x = linspace(x_0(1) , x_0(2), 10000);
y=f(x);

lvl_zero= zeros(1, length(x));

%plotting
plot (x ,y ,'r', 'LineWidth', 2);
hold on;
plot(x, lvl_zero, 'b', 'Linewidth', 2, 'LineStyle','-');
grid on;

title ("$f(x)$ plot" , 'FontSize', 25, 'Interpreter', 'latex') ;
yticks(-2.5 :0.25 :max(y));
xticks(x_0(1) : 0.5 : x_0(2));
xlabel (" $x$ ", 'FontSize', 25,  'Interpreter', 'latex') ;
ylabel ("$f(x)$" , 'FontSize', 25, 'Interpreter', 'latex') ;
set ( gca ,'FontSize' ,20) ;
