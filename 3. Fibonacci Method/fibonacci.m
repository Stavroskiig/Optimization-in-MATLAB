function [calling_f, alphas, betas] = fibonacci(f, epsilon, lambda, a_k, b_k)

% Checking if lambda is positive. If the condition inside assert() is false we cannot continue.
lambda_tester = lambda;
assert(lambda_tester > 0, 'The lambda must be positive (> 0).') 

% Checking if epsilon is positive. If the condition inside assert() is false we cannot continue.
epsilon_tester = epsilon;
assert(epsilon_tester > 0, 'The epsilon must be positive (> 0).')  

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

% Choosing n
i = 1;
while(true)
    if fibonacciSequenceDynamic(i) > ceil((betas(1) - alphas(1)) / lambda)
        break;
    end
    i = i + 1;
end
n = i;

%Matlab uses as first array index the array[1]. So we need to fix this with this way.
function fix = F(n)
    fix = fibonacciSequenceDynamic(n+1);
end

% The variable 'k' shows in which iteration we are in.
k = 1;

% Fill the starting values of the x1, x2 arrays.
x1(k) = alphas(k) + (F(n-2) / F(n)) * (betas(k) - alphas(k));
x2(k) = alphas(k) + (F(n-1) / F(n)) * (betas(k) - alphas(k));

% Determine the starting values of the fx1, fx2. This needs 2 calculations of f.
fx1 = f(x1(k));
fx2 = f(x2(k));
calling_f = calling_f + 2;

% Implementation of the method.
while (true)
    if  fx1 <= fx2
        alphas(k+1) = alphas(k);
        betas(k+1) = x2(k);
        x2(k+1) = x1(k);
        x1(k+1) = alphas(k+1) + (betas(k+1) - alphas(k+1)) * F(n-k-2) / F(n-k);
        fx2 = fx1;
        fx1 = f(x1(k+1));
        calling_f = calling_f +1;
            
    else
        alphas(k+1) = x1(k);
        betas(k+1) = betas(k);
        x1(k+1) = x2(k);
        x2(k+1) = alphas(k+1) + (betas(k+1) - alphas(k+1)) * F(n-k-1) / F(n-k);
        fx1 = fx2;
        fx2 = f(x2(k+1));
        calling_f = calling_f +1;
    end

    if k == n-2
        x1(n) = x1(n-1);
        x2(n) = x1(n-1) + epsilon;

        if f(x1(n)) > f(x2(n))
            alphas(n) = x1(n);
            betas(n) = betas(n-1);
            
        else
            alphas(n) = alphas(n-1);
            betas(n) = x1(n);
            
        end
        break;

    else
        k = k + 1;
    end
end
end