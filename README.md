# Minimization of a Single Variable Convex Function in a Given Interval
The objective of this project is to implement various algorithms to minimize a given convex function f(x) when x ∈ [a, b]. This problem forms the basis for algorithms used to find minimum functions with multiple variables. The implemented algorithms are:

## Minimum Search Methods without Derivatives:

-   **Bisection Method**
-   **Golden Section Method**
-   **Fibonacci Method**

## Minimum Search Methods with Derivatives:

-   **Bisection Method with the use of Derivatives**

In all of the above methods, we start with an initial interval [a, b] in which the minimum x* of f(x) is located. By using a sequential algorithm, we reach an interval [ak bk] with a predetermined accuracy l > 0, i.e., bk - ak ≤ l.

## Functions to Minimize:

-   **Function 1**: f(x) = (x - 2)^2^ + x ln(x+3), where [-1, 3] is the initial interval.
-   **Function 2**: f(x) = 5^x^ + (2 - cos(x))^2^, where [-1, 3] is the initial interval.
-   **Function 3**: f(x) = e^x^(x^3^-1) + (x-1)sin(x), where [-1, 3] is the initial interval.
