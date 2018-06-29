int: C;					  % Number of customers
int: T;                     		  % Number of trucks
int: G;                     		  % Number of goods types 
int: MAXCAP;                		  % Upper bound on truck capacity

set of int: trucks = 1..T;    	     	  % Set of trucks
set of int: customers = 0..C;        	  % Set of customers. Includes depot as customer 0
set of int: goods = 1..G;            	  % Set of goods types
int: chilled = 1;  int: ambient = 2; 	  % Good types

array[trucks] of int: cap;	     	  % Capacity of trucks
array[trucks] of bool: refrig;	     	  % Whether or not trucks are refrigerated
array[goods,customers] of int: order;	  % Number of units of goods types ordered by customers





% Insert your variables and constraints here
% Making a three dimensional array
array[trucks, customers, goods] of var 0..MAXCAP: solution;

% If a truck delivers a chilled good then it has to be a refrigerated truck
constraint forall(t in trucks, c in customers)(solution[t, c, chilled]>0 -> refrig[t]);

% Sum of all goods delivered to all the customers for a particular truck must be less than or equal to irs capacity
constraint forall(t in trucks)(sum(g in goods, c in customers)(solution[t,c,g])<=cap[t]);

% The chilled goods delivered to a customer by all the trucks should equal to how many he/she needs
constraint forall(c in customers)(sum(t in trucks)(solution[t,c,chilled])=order[chilled,c]);

% The ambient goods delivered to a customer by all the trucks should equal to how many he/she needs
constraint forall(c in customers)(sum(t in trucks)(solution[t,c,ambient])=order[ambient,c]);

% In question Q1, we are only finding a satisfying solution
solve satisfy;


% Write a Minizinc output item to print the solution in the desired format for Q1
output[show(T), ",", show(C)] ++ ["\n"] ++ 
	[show(t) ++ "," ++ show(c) ++ "," ++ show(solution[t,c,chilled]) ++ "," ++ show(solution[t,c,ambient]) ++ "\n"
	| t in trucks, c in customers where fix(solution[t,c,chilled]!=0) \/ fix(solution[t,c,ambient]!=0)];