#bisect.m
##Created: Oct 2, 2019
##Created By: Blake Brisben
Description:
  Inputs:
      func: The anonymous function that we are finding the roots of
      xl: lower x bound
      xu: Upper x bound
      es: Stopping criteria (Defaulted to 0.0001%)
      maxit: The max iterations that the function will go through. Set a
          larger maxit for a smaller es.
  Outputs:
      root: The root in the bounds
      fx: The value of the given function at the root. Should be 0. If
          not give a larger maxit
      ea: The approximate error of the root
      iter: The number of iterations that were performed

