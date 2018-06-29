import argparse
import subprocess
import string
import itertools
# Complete the file with your LNS solution


# Here I am trying to find the local optimal solution by changing the order in which a particular truck visits its customers
# The total distance each truck does is dependent on the order. In my solution I am finding the permutation of customers for each
# truck and get the lowest distance corresponding to each truck. I am getting the constraints and can write them to a file but could
# not run it







def makeConstraint(truck, tlines, cust, cons, cost):
    # Here I am getting all the orders in which a good can be delivered by a particular truck to its customers
    for a in itertools.permutations(cust):
        index = 0
        initial_constraints = cons
        initial_cost = cost
        for i in a:
            for line in tlines:
                tokens =  line.split(',')
                if int(tokens[2]) == i:
                    ambient = tokens[3]
                    chilled = tokens[4]
                    new_constraint = "constraint solution[" + str(truck) + "," + str(i) + ",1]=" + str(ambient) + ";\n"
                    initial_constraints.append(new_constraint)
                    new_constraint = "constraint solution[" + str(truck) + "," + str(i) + ",2]=" + str(chilled) + ";\n"
                    initial_constraints.append(new_constraint)
                    continue
    print("Constraints related to truck {} are : {}".format(truck, initial_constraints))
    return initial_constraints


if __name__ =='__main__':
    startSolution = open("start-solution-4-3.csv", "r")
    print("The initial solution is: ")
    all = startSolution.read()
    print(all)
    lines = all.split("\n")
    del lines[-1]
    firstLine = lines[0]
    firstLineElements = firstLine.split(', ')
    trucks = int(firstLineElements[0])
    total_cost = float(firstLineElements[2])
    length = len(lines)
    command = "minizinc Logistics-sat.mzn Logistics-Q4-4-3.dzn keep.dzn"
    var = 1
    while var != trucks + 1 :
        constraints = []
        truckLines = []
        customers = []
        for i in range(1, length):
            tokens = lines[i].split(",")
            if int(tokens[0]) == var:
                truckLines.append(lines[i])
                customers.append(int(tokens[2]))
        new_constraints = makeConstraint(var, truckLines, customers, constraints, total_cost)
#         combinations = getCombinations(customers)
        file = open("keep.dzn", "w")
        for line in new_constraints:
            file.write(line)
        file.close()
#         result = subprocess.Popen(command,shell=True, stdout=subprocess.PIPE)
#         output = result.stdout.read()
#         str = output.decode("utf-8")
#         lines=str.split("\r\n")
        var = var + 1
