% Define problem constants
g = 9.81;
mu = 0.55;
F = 150;
m = 25;

format longe;

% Define the function to be solved for. Is the angle specified in radians or degrees?
f =@(t) (mu*m*g)./(cosd(t) + mu.*sind(t)) - F;
clc
% THINK, what makes range sense for angle?

tl = 0;
tu = 90;
range = tl:tu;
% Plot your function. Does plotting give you an idea about where the root is?
t = linspace(tl, tu, 500);

figure('Name', 'Given Function')
plot(t, f(t))
grid on;

% or

figure('Name', 'fplot attempt')
fplot(f, [0 90])
grid on;

% Finaly solve for the root using the bisection script given to you
[angle, fx, ea, iter] = bisect(f,60,70);

% These variables will be checked for your final answer
% angle =  % the angle in degree that solves this problem
% fx =     % the function value at your solved angle
% ea =     % the bisection error estimate
% iter =   % the number of bisection iterations

fprintf('Angle: %.3f\nfx: %.3f\nea: %.3f\niter: %.0f\n', angle, fx, ea, iter);

