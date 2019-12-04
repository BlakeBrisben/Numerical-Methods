function[f] = makeAnon(func, IV)
% makeAnon.m
% Created: Oct 2, 2019
% Created By: Blake Brisben
% Description:
%   Inputs: 
%       func: The given function in the form of a string
%       IV: The independent variable. Defaults to 'x'
%   Outputs:
%       f: The returned anonymous function

% Set defaults and make sure there are enough inputs
if nargin == 0
    error('Must enter a function to be made anonymous');
elseif nargin == 1
    IV = 'x';
end

% Find all instances of iv in the given function
ivInstances = strfind(func, IV);

% Check that the iv is in the function
if size(ivInstances) == 0
    error('There must be an instance of IV in the given function');
end

% Add the anonymous function handle to the given string
f = ['@(' IV ')' func];

% Make the string an executable function
f = str2func(f);

end