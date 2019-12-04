


% Solve the system of equations in the form A*x = b
%   10*x1 + 2*x2 - x3 = 27
%   -3*x1 - 6*x2 + 2*x3 = -61.5
%   x1 + x2 + 5*x3 = -21.5
% Set up A for the given system
A = [2 -1 5 1;3 2 2 -6;1 3 3 -1;5 -2 -3 3];
% Set up b
b = [-3 -32 -47 49]';
% Solve for x
x = A\b;

% Test your function
[L, U, P] = luFactorTest(A)

% How can you test the output of your function is correct?

C = L\b;
X = U\C;

if x == X
    disp('Nice');
else 
    disp('Bad');
end