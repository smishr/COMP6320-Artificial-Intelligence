% Problem2

% Variables
enum person = {A, B, C, D, E, F};
%int: A = 1;
array[person] of var 1..2: floor;
array[person] of var 1..3: roomNumber;

% Constraints
constraint roomNumber[A] = roomNumber[B];
constraint floor[A] = floor[B] + 1;
constraint roomNumber[B] = roomNumber[D] + 1 \/ roomNumber[D] = roomNumber[B] + 1;
constraint floor[D] = floor[B];
constraint roomNumber[E] < roomNumber[F];
constraint roomNumber[C] = roomNumber[F] + 1 \/ roomNumber[F] = roomNumber[C] + 1;
constraint forall (i,j in person where i!=j) (floor[i]!=floor[j] \/ roomNumber[i]!=roomNumber[j]);
%constraint forall(i in person, j in person where i<j)(
	%floor[i] != floor[j] /\ roomNumber[i] != roomNumber[j]);

solve satisfy;

output [show(floor), "  ", show(roomNumber)];

% predicate adjacent(person:p, person q)
%	=floor[p] = floor[q] /\ abs(roomNumber[p]-roomNumber[q])=1;