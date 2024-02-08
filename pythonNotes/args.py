'''
The *args
 inside a function is a parameter that takes in a variable number of arguments. It is used to pass a non-keyworded, variable-length argument list. The syntax is to use the symbol * to take in a variable number of arguments; by convention, it is often used with the word args.
For example, the following function takes in a variable number of arguments and prints them all out:
'''
def print_all_args(*args):
  for arg in args:
    print(arg)

print_all_args(1, 2, 3, 4, 5)
# Use code with caution.
# Learn more
# This will print the following output:
# 1
# 2
# 3
# 4
# 5
# Use code with caution.
# Learn more
# *args can be used to make functions more flexible and reusable. For example, the following function can be used to calculate the sum of any number of numbers:
def sum_all_args(*args):
  sum = 0
  for arg in args:
    sum += arg
  return sum

print(sum_all_args(1, 2, 3, 4, 5))
# Use code with caution.
# Learn more
# This will print the following output:
# 15
# Use code with caution.
# Learn more
# *args can also be used to pass in a list of arguments to a function. For example, the following function can be used to print all of the elements in a list:
def print_all_elements_in_list(list_of_elements):
  for element in list_of_elements:
    print(element)

print_all_elements_in_list([1, 2, 3, 4, 5])
# Use code with caution.
# Learn more
# This will print the following output:
# 1
# 2
# 3
# 4
# 5
# Use code with caution.
# Learn more
# *args is a powerful tool that can be used to make functions more flexible and reusable.

# https://www.geeksforgeeks.org/args-kwargs-python/
