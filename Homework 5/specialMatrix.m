function [A] = specialMatrix(n,m)
    % This function should return a matrix A as described in the problem statement
    % Inputs n is the number of rows, and m the number of columns
    % It is recomended to first create the matrxix A of the correct size, filling it with zeros to start with is not a bad choice
   
    % Create the nxm matrix
    A = zeros(n,m);

    % Set the first row
    for i = 1:n
        A(i,1) = i;
    end

    % Set the first column
    for i = 1:m
       A(1,i) = i;
    end

    % Now the real challenge is to fill in the correct values of A
    
    % Go through the matrix adding the left element and the above element
    % to create a special Matrix
   
    for i = 2:n
       for j = 2:m
          A(i,j) = A(i-1,j) + A(i,j-1); 
       end
    end
    


end
% Things beyond here are outside of your function
