function  zero = bisectionMethod(f, interval, Delta)

    %setting initial values
    x_min=interval(1);
    x_max=interval(2);

    %inizializing the output
    zero = [];

    while abs(x_max - x_min) > Delta
    %calculating the midpoint
    x_curr= (x_max+x_min)/2;

        if f(x_min) * f(x_curr) < 0
            x_max=x_curr;
        else
            x_min = x_curr;
        end
    
    %appenending the new approximation

    zero = [zero, x_curr];
    end
end
