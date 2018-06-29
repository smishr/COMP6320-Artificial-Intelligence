|        	| Blocks gb with hff 	| Blocks gb without hff 	| Logistics gb with hff 	| Logistics gb without hff 	|
|--------	|--------------------	|-----------------------	|-----------------------	|--------------------------	|
| task01 	| 10, 0.0110, 12     	| 6, 0.0036, 79         	| 20, 0.068, 21         	| 20, 0.83, 11180          	|
| task02 	| 10, 0.0093, 12     	| 10, 0.0029, 67        	| 19, 0.067, 23         	| 19, 0.66, 9352           	|
| task03 	| 06, 0.0042, 08     	| 6, 0.0029, 64         	| 15, 0.044, 18         	| 15, 0.37, 4930           	|
| task04 	| 12, 0.0130, 18     	| 12, 0.018, 467        	| 27, 0.14, 31          	| 27, 9.50, 110178         	|
| task05 	| 18, 0.0410, 45     	| 10, 0.027, 554        	| 17, 0.083, 21         	| 17, 2.20, 25926          	|
| task06 	| 20, 0.0520, 38     	| 16, 0.024, 768        	| 8, 0.038, 9           	| 8, 0.072, 797            	|
| task07 	| 12, 0.0420, 29     	| 12, 0.110, 2020       	| 25, 0.11, 28          	| 25, 49, 463134           	|
| task08 	| 18, 0.0700, 43     	| 10, 0.230, 4878       	| 14, 0.061, 16         	| 14, 2.8, 27056           	|
| task09 	| 32, 0.095, 60      	| 20, 0.310, 6502       	| 25, 0.14, 28          	| 25, 3.80, 35000          	|
| task10 	| 22, 0.095, 36      	| 20, 2.2, 36646        	| 24, 0.13, 28          	| 24, 45, 430945           	|
| task11 	| 30, 0.180, 75      	| 22, 3.8, 63461        	| 37, 0.54, 45          	| Over 4 min               	|
| task12 	| 38, 0.340, 154     	| 20, 3.5, 58219        	| 45, 0.7, 59           	| Over 4 min               	|
| task13 	| 42, 1.200, 368     	| 18, 68, 494568        	| 34, 0.5, 41           	| Over 4 min               	|
| task14 	| 32, 0.500, 170     	| 20, 50, 628423        	| 45, 0.79, 53          	| Over 4 min               	|
| task15 	| 26, 0.230, 067     	| 16, 34, 435468        	| 36, 0.59, 43          	| Over 4 min               	|

# The values are in order Plan length, clock time, nodes expanded
# It can be noted that hff in general improves the result of the search whereas not using it worsens it as we move to bigger problems. The number of nodes explored goes exponential if hff is not used. For the logistics problem, time taken for tasks 11 and beyond take more than 4 minutes and this is because it is considering all possible moves which is very large. Heurisitc on the other hand tell us how far the goal is from the current search. The number of nodes expanded is a better way of telling why it is taking so long for a particular method. A node is expaned each time it is popped from the tree.