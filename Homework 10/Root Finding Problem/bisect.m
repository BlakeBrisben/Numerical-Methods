function[root, fx, ea,iter] = bisect(func, xl, xu, es, maxit)
% bisect.m
% Created: Oct 2, 2019
% Created By: Blake Brisben
% Description:
%   Inputs:
%       func: The anonymous function that we are finding the roots of
%       xl: lower x bound
%       xu: Upper x bound
%       es: Stopping criteria (Defaulted to 0.0001%)
%       maxit: The max iterations that the function will go through. Set a
%           larger maxit for a smaller es.
%   Outputs:
%       root: The root in the bounds
%       fx: The value of the given function at the root. Should be 0. If
%           not give a larger maxit
%       ea: The approximate error of the root
%       iter: The number of iterations that were performed

    root = 0;
    fx = 0;
    ea = 0;
    iter = 0;
    
    % Set defaults
    if nargin < 3
        error('Two bounds and an anonymous function must be inputted.');
    elseif nargin == 3
        es = .0001;
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

    % Check that there is a sign change
    if func(xl)*func(xu) > 0
        error('There must be a sign change between bounds. Refer to the plot created to find valid bounds');
    end
    
    for i = 0:maxit
       xold = root;
       root = (xu + xl)/2;
       
       if func(xu)*func(root) < 0 
           xl = root;
       else
           xu = root;
       end
       
       ea = (root - xold)/root * 100;
       
       if abs(ea) < es
           iter = i;
           fx = func(root);
           break
       end
    end

end