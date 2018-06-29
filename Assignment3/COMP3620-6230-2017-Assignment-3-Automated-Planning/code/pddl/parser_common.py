#!/usr/bin/python3


"""
This module contains methods that carry out the tokenization of the pddl input.
Since we directly parse our tokens from the input string in-place a token is
uniquely identified by its start and end position.
"""

# define the set of special characters
whiteSpace = set([' ', '\n', '\t'])
comment = set([';'])
reserved = set([':', ')', '(']).union(comment)
