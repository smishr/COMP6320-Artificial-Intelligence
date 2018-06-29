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
array[trucks] of int: centsPerKm;         % Cost of running trucks (in cents per km)
array[customers,customers] of int: D;  	  % Distances between customers (including the depot)


var int: tot_cost;	      	   	  % Total cost of the solution


% Insert your other variables and constraints here
array[trucks, customers, goods] of var 0..MAXCAP: solution;
array[trucks, times] of var 0..C+1: sequence;
array[trucks] of var 0..100000: individualdist;

constraint forall(t in trucks, c in customers)(solution[t,c,chilled]>0->refrig[t]);
constraint forall(t in trucks)(sum(g in goods, c in customers)(solution[t,c,g])<=cap[t]);
constraint forall(c in customers)(sum(t in trucks)(solution[t,c,chilled])=order[chilled,c]);
constraint forall(c in customers)(sum(t in trucks)(solution[t,c,ambient])=order[ambient,c]);

% All trucks start at depot
constraint forall(t in trucks)(sequence[t,0]=0);
% All trucks finish at depot
constraint forall(t in trucks)(sequence[t,C+1]=0);
% If a customer is visited by a truck then then it must be in the times of that truck
constraint forall(t in trucks,c in customers)(sum(g in goods)(solution[t,c,g])>0 -> exists(ti in times where ti>0 /\ ti<C+1)(sequence[t,ti]=c));
% A truck does not visit a customer it does not deliver any goods to
constraint forall(t in trucks,c in customers where c>0)(sum(g in goods)(solution[t,c,g])=0 -> forall(ti in times where ti>0 /\ ti<C+1)(sequence[t,ti]!=c));
% A truck does not return to a customer he has already delivered the goods to
constraint forall(t in trucks, tix, tiy in times where tix>0 /\ tiy>tix)((sequence[t,tix]!=sequence[t,tiy]) \/ sequence[t,tix]=0);
% The individual total distance travelled by each truck is the sum of all the visits he made to different customers
constraint forall(t in trucks)(individualdist[t]=sum(ti in times where ti>0)(D[sequence[t,ti-1],sequence[t,ti]]));
% The total cost is the sum of individual distances travelled by trucks multiplied by their running cost.
constraint tot_cost = sum(t in trucks)(individualdist[t]*centsPerKm[t]);
% In question Q3, we are optimising the total cost
solve minimize tot_cost;


% Write a Minizinc output item to print the solution in the desired format for Q3
output[show(T), ",", show(C), ",", show(tot_cost/100)] ++ ["\n"] ++ 
	[show(t) ++ "," ++ show(ti) ++ "," ++ show(sequence[t,ti]) ++ "," ++ show(solution[t,sequence[t,ti],chilled]) ++ "," ++ show(solution[t,sequence[t,ti],ambient]) ++ "\n"
	| t in trucks, ti in times where (fix(solution[t,sequence[t,ti],chilled]!=0) \/ fix(solution[t,sequence[t,ti],ambient]!=0)) /\ 
	fix(sequence[t,ti])!=fix(sequence[t,ti+1]) /\ ti<C+1];
