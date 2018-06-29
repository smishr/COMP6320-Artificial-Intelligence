% Problem 1

% Variables
var int: able;
var int: baker;
var int: charlie;
var int: dog;

% Constraints
constraint able>0;
constraint baker<7;
constraint charlie>3;
constraint dog<(able+baker);
constraint (2*dog)>(able+baker+charlie);
constraint (baker-charlie)>able;

solve satisfy;

output ["able=", show(able), "\t baker=", show(baker), 
        "\t charlie=", show(charlie), "\t", "dog=", show(dog)];
