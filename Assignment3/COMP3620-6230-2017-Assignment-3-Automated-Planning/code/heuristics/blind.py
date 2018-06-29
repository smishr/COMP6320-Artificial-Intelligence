

from planning_task import Action, Task
from heuristics.heuristic_base import Heuristic


class BlindHeuristic(Heuristic):
    """
    Implements a simple blind heuristic for convenience.
    It returns 0 if the goal was reached and 1 otherwise.
    """
    def __init__(self, task):
        super(BlindHeuristic, self).__init__()
        self.goals = task.goals

    def __call__(self, node):
        if all([(fact in node.state) for fact in self.goals]):
            return 0
        else:
            return 1
