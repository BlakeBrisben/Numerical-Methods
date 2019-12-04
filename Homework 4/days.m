function nd = days(mo, da, leap)
    % daysPassed.m
    % Created on: September 10, 2019
    % Created by: Blake Brisben
    % Description: Calculates the days that have passed in the year given a
    % date and month
    % Inputs
    %   da: The day of the month 1-30
    %   mo: The month
    %   leap: a 1 if it is a leap year or a 0 if it is not
    % Outputs
    %   days: The number of days that hafve passed

    % Array with the difference in days from the base of 30 days per month
    diffDays = [1,-2,1,0,1,0,1,1,0,1,0,1];

    % initializes days
    nd = 0;
   

    % Checking if input valid
    
    
    if nargin < 2
        error('Must enter a date and month');
    end
    
    if nargin == 2
        leap = 0;
    end
    
    if leap > 1 || leap < 0
        error('The input for leap must be 0 or 1');
    end

    if mo < 0 || mo > 12
        error('Month must be within 1-12');
    end

    if da > 31 || (da > 30 + diffDays(mo)) || da < 1
        error('Date entered was not valid');
    end
    
    
    
    diffDays(2) = diffDays(2) + leap;

    % Adds all days in the full months before partial month
    for i = 1:mo-1
        nd = nd + 30 + diffDays(i);
    end
    
    % Adds the partial month's days
    nd = nd + da;
    

end

