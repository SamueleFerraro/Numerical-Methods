function zero = newtonMethod(f, interval, Delta)
    %h is used for the derivative calculation
    h=10^(-12);

    %initializing the initial value
    x_next= interval(2);
    x_curr=interval(1); %note that this is an arbitrary value in order to start the loop
   
    %initializing the output
    zero=[];

    while  abs(x_curr- x_next) > Delta
        %updating the value
        x_curr = x_next;
        
        %calculation of the derivative
        df_curr = (f(x_curr+h) - f(x_curr-h)) / (2*h);
        
        %calculation of the value
        x_next= x_curr - (f(x_curr))/df_curr;
        
        %appending the new approximation 
        zero = [zero , x_curr];
    end
end