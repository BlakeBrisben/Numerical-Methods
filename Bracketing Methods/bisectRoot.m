function [min, iter, ea, fx] = bisectRoot(func, xl, xu, es, maxit)
% bisectRoot.m
% Created: Oct 11, 2019
% Created By: Blake Brisben
% Description:
%   Inputs:
%       func: The anonymous function that we are finding the minimum of
%       xl: lower x bound
%       xu: Upper x bound
%       es: Stopping criteria (Defaulted to 0.0001%)
%       maxit: The max iterations that the function will go through. Set a
%           larger maxit for a smaller es. Defaults at 200
%   Outputs:
%       min: The minimum in the bounds
%       iter: The number of iterations that were performed
%       ea: The approximate error of the minimum
%       fx: The value of the given function at the min. 
       
% Set defaults
    if nargin < 3
        error('Two bounds and an anonymous function must be inputted.');
    elseif nargin == 3
        es = .000001;
        maxit = 200;
    elseif nargin == 4
        maxit == 200;
    end
        
    % Check that func is an anonymous function
    if isa(func, 'function_handle')
        if ~strncmp(char(func),'@',1)
            error('Must enter an anonymous function');
        end
    else
        error('Must enter an anonymous function');
    end

format long;

min = 0;

% Does bisection method but different bound change 
for i = 0:maxit
    minOld = min;
    
    % Finds minimum guess
    min = (xl + xu)/2;
    
% Code that optimizes to stop if we split the min exactly but ea looks bad
% so I don't like it
    if abs(func(xl)-func(min)) == abs(func(xu) - func(min))
        fx = func(min);
        iter = i;
        ea = 0;
        break;
    end

% Checks the vertical distance from each bound to the guess to see which is
% farther away
% The farther one is the bound that is replaced 
    if abs(func(xl)-func(min)) > abs(func(xu) - func(min))
        xl = min;
    else
        xu = min;
    end
   
    % Check approximate error 
    ea = (min - minOld)/min;
    
    if ea < es
        fx = func(min);
        iter = i;
        break;
    end
    
end
end

