function [calling_f, alphas, betas] = goldenSection(f, lambda, a_k, b_k)

% Checking if lambda is positive. If the condition inside assert() is false we cannot continue.
lambda_tester = lambda;
assert(lambda_tester > 0, 'The lambda must be positive (> 0).')  

% Initialization of the arrays that will hold the values of a_k, b_k, x1, x2 with zeros.
alphas = zeros();
betas = zeros();
x1 = zeros();
x2 = zeros();

% Taking the starting and ending point input to the first array index
alphas(1) = a_k;
betas(1) = b_k;

% Determine the "calling_f" variable to count how many times 'f' is calculated.
calling_f = 0;

% This is the golden ratio number.
gamma = 0.618;

% The variable 'k' shows in which iteration we are in.
k = 1;

% Fill the starting values of the x1, x2 arrays.
x1(1) = alphas(1) + (1 - gamma) * (betas(1) - alphas(1));
x2(1) = alphas(1) + (gamma) * (betas(1) - alphas(1));

% Determine the starting values of the fx1, fx2. This needs 2 calculations of f.
fx1 = f(x1(k));
fx2 = f(x2(k));
calling_f = calling_f + 2;

% Implementation of the method.
while (betas(k) - alphas(k) >= lambda)

    if fx1 <= fx2
        alphas(k+1) = alphas(k);
        betas(k+1) = x2(k);
        x2(k+1) = x1(k);
        x1(k+1) = alphas(k+1) + (1 - gamma) * (betas(k+1) - alphas(k+1));
        fx2 = fx1;
        fx1 = f(x1(k+1));
        calling_f = calling_f +1;

    else
        alphas(k+1) = x1(k);
        betas(k+1) = betas(k);
        x2(k+1) = alphas(k+1) + (gamma) * (betas(k+1) - alphas(k+1));
        x1(k+1) = x2(k);
        fx1 = fx2;
        fx2 = f(x2(k+1));
        calling_f = calling_f +1;
    end

    k = k + 1;

end

end