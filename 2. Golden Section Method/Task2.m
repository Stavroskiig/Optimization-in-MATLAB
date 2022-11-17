% Clear command history and all variables
clear;             
clc; close all;     

% Defining the functions under study.
func1 = @(x) (x-2)^2 + (x)*(log(x+3));
func2 = @(x) 5^x + ((2-cos(x))^2);
func3 = @(x) exp(x)*((x^3)-1) + (x-1)*(sin(x));

% Creating a variable to select which figure to use.
plot_number = 1;


% SUBTASK 1: CHANGING LAMBDA AND FIND NUMBER OF CALCULATIONS OF FUNCTIONS


% Initializing zero arrays to count how many times each function is calculated. 
calling_f1 = zeros();
calling_f2 = zeros();
calling_f3 = zeros();

% Choosing the values of "lambda" that I will use.
lambda_values = [0.01 0.05 0.25 1.25 6.25];

% Changing "lambda".
for i = 1 : length(lambda_values)
    
    %  Fill the calculations arrays of our functions
    [calling_f1(i),~,~] = goldenSection(func1, lambda_values(i), -1, 3);
    [calling_f2(i),~,~] = goldenSection(func2, lambda_values(i), -1, 3);
    [calling_f3(i),~,~] = goldenSection(func3, lambda_values(i), -1, 3);

end

% Plot for calculations of f1
figure(plot_number);
hold on;
plot(calling_f1);
title(sprintf('f1 Calculations: Golden Section'));
ylabel(sprintf('f1 Calculations'));
xlabel('lambda');
set(gca,'XTick',1:length(lambda_values));
set(gca,'XTickLabel',lambda_values);
plot_number = plot_number + 1;

% Plot for calculations of f2
figure(plot_number);
hold on;
plot(calling_f2);
title(sprintf('f2 Calculations: Golden Section'));
ylabel(sprintf('f2 Calculations'));
xlabel('lambda');
set(gca,'XTick',1:length(lambda_values));
set(gca,'XTickLabel',lambda_values);
plot_number = plot_number + 1;

% Plot for calculations of f2
figure(plot_number);
hold on;
plot(calling_f3);
title(sprintf('f3 Calculations: Golden Section'));
ylabel(sprintf('f3 Calculations'));
xlabel('lambda');
set(gca,'XTick',1:length(lambda_values));
set(gca,'XTickLabel',lambda_values);
plot_number = plot_number + 1;


% SUBTASK 2: CHANGING LAMBDA AND FIND EDGES OF RANGE FOR EACH FUNCTION 


% Choosing the values of "lambda" that I will use.
lambda_values = [0.001 0.1];
%lambda_values = [0.0001 0.001 0.001 0.1];

% Generating the plots
for i = 1 : length(lambda_values)
    
    [~, alphas1, betas1] = goldenSection(func1, lambda_values(i), -1, 3);
    [~, alphas2, betas2] = goldenSection(func2, lambda_values(i), -1, 3);
    [~, alphas3, betas3] = goldenSection(func3, lambda_values(i), -1, 3);

    % Plot for edges of range for f1
    figure(plot_number);
    plot(alphas1);
    hold on;
    figure(plot_number);
    plot(betas1);
    title(sprintf('f1 edges of range for lambda = %f: Golden Section', lambda_values(i)));
    ylabel(sprintf('f1 edges of range'));
    xlabel('Iteration k');    
    plot_number = plot_number + 1;

    % Plot for edges of range for f2
    figure(plot_number);
    plot(alphas2);
    hold on;
    figure(plot_number);
    plot(betas2);
    title(sprintf('f2 edges of range for lambda = %f: Golden Section', lambda_values(i)));
    ylabel(sprintf('f2 edges of range'));
    xlabel('lambda');
    plot_number = plot_number + 1;
    
    % Plot for edges of range for f3
    figure(plot_number);
    plot(alphas3);
    hold on;
    figure(plot_number);
    plot(betas3);
    title(sprintf('f3 edges of range for lambda = %f: Golden Section', lambda_values(i)));
    ylabel(sprintf('f3 edges of range'));
    xlabel('lambda');
    plot_number = plot_number + 1;

    fprintf("For goldenSection a-b is %f\n",alphas1(end)-betas1(end));

end