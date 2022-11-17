function fib = fibonacciSequenceDynamic(n)

% Fibonacci Series using Dynamic Programming

%Declare an array to store Fibonacci numbers. 1 extra to handle case, n = 0
f = zeros();   
 
% 0th and 1st number of the series are 0 and 1*/
f(1) = 0;
f(2) = 1;
 
for i = 3: +1 : (n)

% Add the previous 2 numbers in the series and store it.
f(i) = f(i-1) + f(i-2);
end

fib = f(n);
return