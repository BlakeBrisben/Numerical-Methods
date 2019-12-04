function[root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, vargin)
%falsePosition.m
%Created on: Sep 30, 2019
%Created By: Blake Brisben
% Description
%   Inputs: 
%       func: The anonymous function that we are finding the roots of, or a
%       string containing the function
%       xl: Lower x bound of the root
%       xu: upper x bound of the root
%       es: Stopping criteria given in percent(
%       maxit: The max number of iterations that will be performed. Deafulted to 200 (make maxit larger for a smaller es)
%   Outputs:
%       root: The calculated root of the function
%       fx: The given function evaluated at the root
%       ea: The approximate error of the root
%       iter: The number of iterations that the function performed

clc

% Intialize vars
root = 0;
xold = 0;
fx = 0;
iter = 0;


% Check num args to make sure there are enough and to set defaults
if nargin < 3
    error('A function and 2 bounds must be inputted');
elseif nargin == 3
    es = 0.0001;
    maxit = 200;
elseif nargin == 4
    maxit = 200;
% else
%   error('Too many inputs')
end

% Check that func is an anonymous function
if isa(func, 'function_handle') || isa(str2func(func),'function_handle')
    if ~strncmp(char(func),'@',1)
        func = makeAnon(func);
        
        %error('Must enter an anonymous function');
    end
else
    error('Must enter an anonymous function');
end

% Plot the function
figure('Name', 'Given Function Graph')
fplot(func,[xl-abs(xl-xu) xu+abs(xl-xu)]);
grid on;

% Check that there is a sign change
if func(xl)*func(xu) > 0
    error('There must be a sign change between bounds. Refer to the plot created to find valid bounds');
end



% loop to find the root
for i = 1:maxit
    % set xr to xold for error calculation
    xold = root;
    
    % calculate root guess using false position formula
    root = xu - ((func(xu)*(xl-xu))/(func(xl) - func(xu)));
    
    % Determine which bound to change
    if func(xu)*func(root) < 0
        xl = root;
    else
        xu = root;
    end
    
    % calculate the error
    if root == 0
        ea = (((root + 1)-(xold+1))/(root+1)) * 100;
    else
        ea = ((root-xold)/root) * 100;
    end
    
    % Checks if error is acceptable
    if abs(ea) < es
        iter = i;
        fx = func(root);
        break;        
    end
end

end
