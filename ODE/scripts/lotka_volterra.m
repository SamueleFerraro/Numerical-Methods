function dydt = lotka_volterra(t,y,p)
    x=y(1);
    y=y(2);

    %Set implementation
    dxdt = p(1)*x-p(2)*x*y;
    dydt = p(3)*x*y-p(4)*y;

    %output
    dydt=[dxdt;dydt];
end