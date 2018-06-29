
"""
COMP3620-6320 Artificial Intelligence 2017 - Planning Assignment Q1
Classes for representing a STRIPS planning task and capturing its semantics

Enter your details below:

Name:
Student Code:
email:


Implements the Greedy Best First Search (GBFS) search algorithm for planning.

Method to be implemented is gbfs.

We provide imports for some basic data-structure that can be useful to tackle the problem. In particular have a look at heapq that
is an efficient implementation of a priority queue using heap
"""



import heapq
import logging

from search import searchspace
from planning_task import Task
from heuristics import BlindHeuristic
def gbfs(task, heuristic=BlindHeuristic):
    """
    Searches for a plan in the given task using Greedy Best First Search search.

    @param task The task to be solved
    @param heuristic  A heuristic callable which computes the estimated steps
                      from a search node to reach the goal.
    """

    raise NotImplementedError
