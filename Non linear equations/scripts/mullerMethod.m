function zero = mullerMethod(f, interval, Delta)
    
    %Initializing the values
    x_curr=interval(2);
    x_old=(interval(1)+interval(2))/2;
    x_oldold=interval(1);

    %I will use this cofficients:
    %Coeff= [a_curr, b_curr]' ;
    %c_curr;

    %defining output
    zero=[];

    while abs(x_curr - x_old ) > Delta 
        
        
        %defining the matrices
        A = [ -(x_curr - x_old)^2 , (x_curr  - x_old) ;  -(x_curr - x_oldold)^2 , (x_curr-x_oldold)];
        b = [f(x_curr) - f(x_old) ; f(x_curr) - f(x_oldold)];

        %calculation of the coefficients
        Coeff = A\b;
        c_curr=f(x_curr); 

        %iteration of the formula

        x_next = x_curr - (2*c_curr)/ (Coeff(2) + sign(Coeff(2)) * sqrt((Coeff(2))^2 - 4*Coeff(1)* c_curr));

        %updating the values
        x_oldold=x_old;
        x_old=x_curr;
        x_curr=x_next;

        %appending the new approximation
        zero = [zero , x_curr];
    end
end