function [calling_f, alphas, betas] = bisectionDerivative(f, lambda, a_k, b_k)

% Checking if lambda is positive. If the condition inside assert() is false we cannot continue.
lambda_tester = lambda;
assert(lambda_tester > 0, 'The lambda must be positive (> 0).')   

% Initialization of the arrays that will hold the values of a_k, b_k, x with zeros.
alphas = zeros();
betas = zeros();
x = zeros();

% Determine derivative of the functions.
syms x;
derivative = matlabFunction(diff(f,x));

% Taking the starting and ending point input to the first array index
alphas(1) = a_k;
betas(1) = b_k;

% Determine the "calling_f" variable to count how many times 'f' is calculated.
calling_f = 0;

% Choosing n
i = 0;
while (true)
    if ((1/2)^i) <= lambda / (betas(1) - alphas(1))
        n = i;
        break;
    else
        i = i + 1;
    end
end

% The variable 'k' shows in which iteration we are in.
k = 1;

% Implementation of the method.
while (true)

    x(k) = (alphas(k) + betas(k)) / 2;
    derivative_value = derivative(x(k));
    calling_f = calling_f +1;

    if derivative_value > 0
        alphas(k+1) = alphas(k);
        betas(k+1) = x(k);

    elseif derivative_value < 0
        alphas(k+1) = x(k);
        betas(k+1) = betas(k);

    else
        alphas(k) = x(k);
        betas(k) = x(k);
        break;

    end

    if k == n
        break;
    else
        k = k + 1;
    end

end