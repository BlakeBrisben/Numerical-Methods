#falsePosition.m
##Created on: Sep 30, 2019
##Created By: Blake Brisben
 Description
   Inputs: 
       func: The anonymous function that we are finding the roots of, or a
       string containing the function
       xl: Lower x bound of the root
       xu: upper x bound of the root
       es: Stopping criteria given in percent(
       maxit: The max number of iterations that will be performed. Deafulted to 200 (make maxit larger for a smaller es)
   Outputs:
       root: The calculated root of the function
       fx: The given function evaluated at the root
       ea: The approximate error of the root
       iter: The number of iterations that the function performed


