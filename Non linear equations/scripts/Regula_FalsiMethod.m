function zero = Regula_FalsiMethod(f, interval, Delta)
    
    %setting initial values
    x_0=interval(1);
    x_curr=interval(2);
    
    %initializing the previous approximation with x_0: it is done only for
    %the first iteration.
    x_prev=x_0;

    %initializing output vector
    zero=x_curr;

    while abs(x_curr- x_prev) > Delta 
        x_next = x_curr - (f(x_curr)) *  (x_curr-x_0)/(f(x_curr)-f(x_0));
        
        %saving the previous approximation in order to calculate the error
        x_prev=x_curr;

        %updating the approximation
        x_curr = x_next;
       
        %appending the approximation 
        zero=[zero, x_curr];

    end
    
end