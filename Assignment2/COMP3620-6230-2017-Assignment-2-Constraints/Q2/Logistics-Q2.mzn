int: C;					  % Number of customers
int: T;                     		  % Number of trucks
int: G;                     		  % Number of goods types 
int: MAXCAP;                		  % Upper bound on truck capacity

set of int: trucks = 1..T;    	     	  % Set of trucks
set of int: customers = 0..C;        	  % Set of customers. Includes depot as customer 0
set of int: goods = 1..G;            	  % Set of goods types
int: chilled = 1;  int: ambient = 2; 	  % Good types
set of int: times = 0..C+1;            	  % Enough times to visit each customer once and depot twice if needed

array[trucks] of int: cap;	     	  % Capacity of trucks
array[trucks] of bool: refrig;	     	  % Whether or not trucks are refrigerated
array[goods,customers] of int: order;	  % Number of units of goods types ordered by customers




% Insert your variables and constraints here
% This is the three dimensional array that tell how much of each good each truck delivers to each customer
array[trucks, customers, goods] of var 0..MAXCAP: solution;

% This is the two dimensional array that tell when a particular customer is delivered a good
array[trucks, times] of var 0..C+1: sequence;

% If a truck delivers a chilled good then it has to be a refrigerated truck
constraint forall(t in trucks, c in customers)(solution[t,c,chilled]>0->refrig[t]);
% Sum of all goods delivered to all the customers for a particular truck must be less than or equal to irs capacity
constraint forall(t in trucks)(sum(g in goods, c in customers)(solution[t,c,g])<=cap[t]);
% The chilled goods delivered to a customer by all the trucks should equal to how many he/she needs
constraint forall(c in customers)(sum(t in trucks)(solution[t,c,chilled])=order[chilled,c]);
% The ambient goods delivered to a customer by all the trucks should equal to how many he/she needs
constraint forall(c in customers)(sum(t in trucks)(solution[t,c,ambient])=order[ambient,c]);

% All trucks start at depot
constraint forall(t in trucks)(sequence[t,0]=0);
% All trucks finish at depot
constraint forall(t in trucks)(sequence[t,C+1]=0);
% If a customer is visited by a truck then then it must be in the times of that truck
constraint forall(t in trucks,c in customers)(sum(g in goods)(solution[t,c,g])>0 -> exists(ti in times where ti>0 /\ ti<C+1)(sequence[t,ti]=c));
% A truck does not visit a customer it does not deliver any goods to
constraint forall(t in trucks,c in customers)(sum(g in goods)(solution[t,c,g])=0 -> forall(ti in times where ti>0 /\ ti<C+1)(sequence[t,ti]!=c));
% In question Q2, we are only finding a satisfying solution
solve satisfy;


% Write a Minizinc output item to print the solution in the desired format for Q2
output[show(T), ",", show(C)] ++ ["\n"] ++ 
	[show(t) ++ "," ++ show(ti) ++ "," ++ show(sequence[t,ti]) ++ "," ++ show(solution[t,sequence[t,ti],chilled]) ++ "," ++ show(solution[t,sequence[t,ti],ambient]) ++ "\n"
	| t in trucks, ti in times where (fix(solution[t,sequence[t,ti],chilled]!=0) \/ fix(solution[t,sequence[t,ti],ambient]!=0)) /\ 
	fix(sequence[t,ti])!=fix(sequence[t,ti+1]) /\ ti<C+1];
	
