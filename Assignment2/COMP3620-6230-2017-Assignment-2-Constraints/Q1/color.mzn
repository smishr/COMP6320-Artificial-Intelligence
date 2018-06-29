set of int: Colors = 1..3;
int: red = 1;
int: yellow = 2;
int: blue = 3;
array[Colors] of string: name = ["red", "yellow", "blue"];
var Colors: x;
constraint x != red;
solve satisfy;
output [ name[fix(x)] ];