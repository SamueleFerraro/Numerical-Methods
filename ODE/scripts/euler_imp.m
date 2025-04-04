function [t, x, y] = euler_imp(tspan, IC, h, p)
    % Initialization
    t = tspan(1):h:tspan(2);
    N = length(t);
    x = zeros(1, N);
    y = zeros(1, N);
    x(1) = IC(1);
    y(1) = IC(2);

    % Method implementation
    for n = 2:N
        % Current value definition
        y_curr=y(n-1);
        x_curr=x(n-1);

        %y_n equation that have to be solved 
        f = @(y_next) y_curr + h*( p(3)*y_next*((x_curr)/(1-h*(p(1)-p(2)*y_next))) - p(1)*y_next)- y_next;

        %solutio of y_n
        y_next=fzero(f,y_curr);
        
        %calculation of x_next
        x_next= (x_curr)/(1-h*(p(1)-p(2)*y_next));
        

        % updating values
        x(n) = x_next;
        y(n) = y_next;
    end
end
