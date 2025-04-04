%initialization
tspan=[0,1];
p=[13,0.14,0.06,13];
x0=520;
y0=30;
IC=[x0,y0];%Initial Conditions
h=0.005;

%calculating the reference value.
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-12);
[t_r, y_r] = ode45(@(t,y) lotka_volterra(t, y, p), tspan, IC, options);

%Solution by euler explicit method
[t_eulE, x_eulE, y_eulE]=euler_exp(@(t,x,y)lotka_volterra(t,[x,y],p),tspan,IC,h,p);

% Adapting the number of points: Every result have to been adapted to the reference

N = length(t_r); % Points by ode45
M = length(t_eulE); % points by Eulero explicit

% Adapting by interpolation 
t_eulE_adapted = interp1(linspace(t_eulE(1), t_eulE(end), M), t_eulE, linspace(t_eulE(1), t_eulE(end), N));
x_eulE_adapted = interp1(t_eulE, x_eulE, t_eulE_adapted);
y_eulE_adapted = interp1(t_eulE, y_eulE, t_eulE_adapted);

N=length(t_eulE_adapted);

%calculation of the error by euler explicit method of x(t)
numerator=0;
denominator=0;
for i=1:N 
    numerator = numerator + (x_eulE_adapted(i)-y_r(i,1))^2;
    denominator = denominator + (y_r(i,1)^2);
end
Delta_eulE_x=numerator/denominator;
disp(Delta_eulE_x);

%calculation of the error by euler explicit method of y(t)
numerator=0;
denominator=0;
for i=1:N 
    numerator = numerator + (y_eulE_adapted(i)-y_r(i,2))^2;
    denominator = denominator + (y_r(i,2)^2);
end
Delta_eulE_y=numerator/denominator;
disp(Delta_eulE_y);
%------------------------------------------------%
%Solution for euler implicit
[t_eulI,x_eulI,y_eulI]=euler_imp(tspan,IC,h,p);
% Adapting the number of points: Every result have to been adapted to the reference

N = length(t_r); % Points by ode45
M = length(t_eulI); % points by Eulero explicit

% Adapting by interpolation 
t_eulI_adapted = interp1(linspace(t_eulI(1), t_eulI(end), M), t_eulI, linspace(t_eulI(1), t_eulI(end), N));
x_eulI_adapted = interp1(t_eulI, x_eulI, t_eulI_adapted);
y_eulI_adapted = interp1(t_eulI, y_eulI, t_eulI_adapted);

N=length(t_eulI_adapted);
%calculation of the error by euler explicit method of x(t)
numerator=0;
denominator=0;
for i=1:N 
    numerator = numerator + (x_eulI_adapted(i)-y_r(i,1))^2;
    denominator = denominator + (y_r(i,1)^2);
end
Delta_eulI_x=numerator/denominator;
disp(Delta_eulI_x);

%calculation of the error by euler explicit method of y(t)
numerator=0;
denominator=0;
for i=1:N 
    numerator = numerator + (y_eulI_adapted(i)-y_r(i,2))^2;
    denominator = denominator + (y_r(i,2)^2);
end
Delta_eulI_y=numerator/denominator;
disp(Delta_eulI_y);
%------------------------------------------------%
%solution by Adams-Bashforth method
[t_AB, x_AB,y_AB]=adams_bashforth(@(t,x,y)lotka_volterra(t,[x,y],p),tspan,IC,h,p);
%Adapting of the points

N = length(t_r); % Points by ode45
M = length(t_AB); % points by Eulero explicit

% Adapting by interpolation 
t_AB_adapted = interp1(linspace(t_AB(1), t_AB(end), M), t_AB, linspace(t_AB(1), t_AB(end), N));
x_AB_adapted = interp1(t_AB, x_AB, t_AB_adapted);
y_AB_adapted = interp1(t_AB, y_AB, t_AB_adapted);

N=length(t_AB_adapted);

%calculation of the error by Adams-Bashforth method of x(t)
numerator=0;
denominator=0;
for i=1:N 
    numerator = numerator + (x_AB_adapted(i)-y_r(i,1))^2;
    denominator = denominator + (y_r(i,1)^2);
end
Delta_AB_x=numerator/denominator;
disp(Delta_AB_x)

%calculation of the error by Adams-Bashforth method of y(t)
numerator=0;
denominator=0;
for i=1:N 
    numerator = numerator + (y_AB_adapted(i)-y_r(i,2))^2;
    denominator = denominator + (y_r(i,2)^2);
end
Delta_AB_y=numerator/denominator;
disp(Delta_AB_y);
