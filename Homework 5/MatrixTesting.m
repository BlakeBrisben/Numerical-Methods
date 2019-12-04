%% Matrix testing
clear
clc
close all

%% Random test stuff
n = 3;
m = 3;


N = 1:n;
M = 1:m;
E = zeros(n,m);

A = [1,2,3;2,0,0;3,0,0];
i = A;
i(2:m);
A(2:n);
D = A(1:N)+A(1:M);

% Current Attempt
%generally ueless next 3 lines but whatever
E(1:3) = A(1:3);
E = E';
E(1:3) = A(1:3);

E

%current attempt at solving for the matrix
tic
E(2:n,2:m) = E(1:n-1,2:m) + E(2:n,M(1))
toc
F = [1 2]
F(3,3) = 'e'

%F(3,3) = 0



%current Output
%{
E =

     1     2     3
     2     4     3
     3     3     0
%}