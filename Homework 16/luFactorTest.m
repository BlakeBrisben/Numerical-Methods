function [L, U, P] = luFactor(A)
% Created by:BlakeBrisben
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix



% Get the size of the matrix
[r, c] = size(A);

% Make sure the matrix is square
if r ~= c
    error('The matrix must be square');
end


% Initialize all matricies
P = eye(r);
L = zeros(r);
U = A;

% Loop to go through the matrix
for i = 1:c-1
   
    % Get index of max value
    valid = U(i:r,i);
    [M, I] = max(abs(valid));
    I = I + i - 1;
    
    % Pivot
    if i ~= I
        temp = U(I,:);
        U(I,:) = U(i,:);
        U(i,:) = temp;
        
        tempI = P(I,:);
        P(I,:) = P(i,:);
        P(i,:) = tempI;
        
        tempL = L(I,:);
        L(I,:) = L(i,:);
        L(i,:) = tempL;
         
    end
    
    % Populate the lower triangular matrix in the column i
    L(i+1:r,i) = (U(i+1:r,i)./U(i,i));
    
    % Use the L matrix to calculate the values for the upper triangular
    % matrix
%     for j = i+1:r
%         U(j,i:c) = (U(j,i:c)-(L(j,i)*(U(i,i:c))));
%     end
    U(i+1:r,i:c) = (U(i+1:r,i:c)-(L(i+1:r,i)*(U(i,i:c))));
end




end

