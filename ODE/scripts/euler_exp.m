function [t,x,y] = euler_exp (odeSet, tspan, IC, h, p)

    %inizialization
    t=tspan(1):h:tspan(2);
    N=length(t);
    x=zeros(1, N);
    y=zeros(1, N);
    x(1)=IC(1);
    y(1)=IC(2);
    
    %implementig the algorithm
    for n= 2:N
        dydt = odeSet(t(n-1),[x(n-1), y(n-1)],p);
        x(n)=x(n-1)+h*dydt(1);
        y(n)=y(n-1)+h*dydt(2);
    end
end
