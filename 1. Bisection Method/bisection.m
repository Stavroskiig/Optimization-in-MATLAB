function [alphas, betas, calling_f] = bisection(f, epsilon, lambda, a_k, b_k)

% Initialization of the arrays that will hold the values of a_k and b_k with zeros.
alphas = zeros(1, 50);
betas = zeros(1, 50);

% Initialization of the arrays that will hold the values of x1 and x2 with zeros.
x1 = zeros(1, 50);
x2 = zeros(1, 50);

% Taking the starting and ending point input to the first array index
alphas(1) = a_k;
betas(1) = b_k;

% Determine the "calling_f" variable to count how many times 'f' is calculated.
calling_f = 0;

% The variable 'k' shows in which iteration we are in.
k = 1;

% Implementation of the method.
while (betas(k) - alphas(k) >= lambda )
   
    x1(k) = (alphas(k) + betas(k))/2 - epsilon;
    x2(k) = (alphas(k) + betas(k))/2 + epsilon;
    
    if f(x1(k)) < f(x2(k))
        alphas(k+1) = alphas(k);
        betas(k+1) = x2(k);   
    else
        alphas(k+1) = x1(k);
        betas(k+1) = betas(k);
    end

    calling_f = calling_f + 2;
    k = k + 1;

end

% Emptying the zero elements of the arrays.
alphas = nonzeros(alphas);
betas = nonzeros(betas);
x1 = nonzeros(x1);
x2 = nonzeros(x2);

end