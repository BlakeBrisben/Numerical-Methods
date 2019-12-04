%% Smallest positive number
% Blake Brisben
% Mech 105

clear 
clc
close all

%%
% initialize x
x = 1;

% loop to make x smaller
while x > 0
   % making sure not to set x = 0
   if x/2 == 0
       break;
   end
   
   x = x/2;
end

disp(log2(x));

