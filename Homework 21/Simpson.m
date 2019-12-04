function [I] = Simpson(x, y)
% numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced incdependent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

%% ERROR CHECK  

% Checking number of arguements
if nargin < 2
    error("Need a set of independent and dependent data");
end

% Checking the data is the same size
[~, nc] = size(x);
[~, yc] = size(y);
if nc ~= yc
    error("The independent and dependent matricies need to be the same size");
end

%CHecking that there is enough data
if nc < 2
    error("The data set entered is too small");
end

%% Checking the spacing between each element a bunch of ways
difference = diff(x);
[~, c2] = size(difference);
split = difference(1);
check = (split + 2*eps) > difference;

if sum(check) < c2
    error("Independent data needs to be evenly spaced");
end


if sum(linspace(min(x), max(x), size(x,2)) == x) ~= size(x,2)
    error("Independent data needs to be evenly spaced");
end


if sum(diff(x,2)) ~= 0
    error("Independent data needs to be evenly spaced");
end


%% Calculationcs

% Setting the spacing
h = diff(x);

% Getting the sum of each point with no trapezoid needed
if nc == 2
    warning("Using the trapezoidal Rule");
    I = ((y(nc-1) + y(nc))/2) * h(1);
elseif rem(nc,2) == 1
    evenPieces = 4*(sum(y(1, 2:2:nc)));
    if nc ~= 3    
        oddPieces = 2*(sum(y(1, 3:2:nc)));
    else
        oddPieces = 0;
    end
    
    I = (y(1) + evenPieces + oddPieces + y(nc)) * (h(1)/3);

% Getting the sum of each point and a trapezoid
else
    warning("Using the Trapeoidal Rule");
    evenPieces = 4*(sum(y(1, 2:2:nc-1)));
    oddPieces = 2*(sum(y(1, 3:2:nc-1)));
    
    I = (y(1) + evenPieces + oddPieces + y(nc-1)) * (h(1)/3);
    
    trap = ((y(nc-1) + y(nc))/2) * h(1);
    
    I = I + trap;
end
end
