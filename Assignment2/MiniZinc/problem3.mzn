% Problem 3
include "alldifferent.mzn";
%include "magic4.dzn";

% Variables
int: N;
int: V;
int: square;
square = N*N;
V = (N*N*N + N) div 2;
set of int: size = 1..N;
array[size, size] of var int: magic;
var int: corners;

% Constraints
% Sum of all rows are equal
constraint forall(i in size)(sum(j in size)(magic[i,j]) = V);
% Sum of all columns are equal
constraint forall(i in size)(sum(j in size)(magic[j,i]) = V);
constraint forall(i,j in size)(magic[i,j] <= square /\ magic[i,j] >= 1);
constraint sum(x in size)(magic[x, x]) = V;
constraint sum(x in size)(magic[x, N+1-x]) = V;
constraint alldifferent([magic[i,j] | i,j in size]);
constraint corners = magic[1, 1] + magic[1, N]
					+magic[N, 1] + magic[N, N];


solve minimize corners;
output [ show(magic[i,j]) ++
	if j == N then "\n" else " " endif |
	i in size, j in size
];