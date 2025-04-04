function [t, x, y] = adams_bashforth(odeSet, tspan, IC, h, p)
    % Initialization
    t = tspan(1):h:tspan(2);
    N = length(t);
    x = zeros(1, N);
    y = zeros(1, N);
    x(1) = IC(1);
    y(1) = IC(2);

    beta = [1.5, -0.5];

    for n = 2:N
        s = [0, 0];
        for k = 1:2  
            if n-k>0 
                ya=[x(n-k),y(n-k)];
                s = s + h*beta(k)*odeSet(t(n-k), ya, p); 
            end
       end
        % Updating x and y values
        x(n) = x(n-1) + s(1);
        y(n) = y(n-1) + s(2);
    end
end
