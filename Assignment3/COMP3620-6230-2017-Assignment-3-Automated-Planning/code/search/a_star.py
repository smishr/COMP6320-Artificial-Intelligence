
"""
COMP3620-6320 Artificial Intelligence 2017 - Planning Assignment Q2

Enter your details below:

Name:
Student Code:
email:


Implements the A* (a-star) search algorithm for planning.

Method to be implemented is a_star.

We import some basic data-structure that can be useful to tackle the problem. 
Have a look at *heapq* that is an efficient implementation of a priority queue using a heap data-structure
Have a look at searchspace that gives you an implementation of a searchnode. In particular look at make_root_node and make_child_node
"""

import heapq
import logging

from search import searchspace
from planning_task import Task
from heuristics import BlindHeuristic



def a_star(task, heuristic=BlindHeuristic):
    """
    Searches for a plan in the given task using A* search.

    @param task The task to be solved
    @param heuristic  A heuristic callable which computes the estimated steps
                      from a search node to reach the goal.
    """
    raise NotImplementedError
