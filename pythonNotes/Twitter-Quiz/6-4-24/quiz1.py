list1 = [1, 5, 3]
list2 = list1
list1.append(list2)
print(list1)

# Ouput:
# 1) [1, 5, 3, 1, 5, 3]
# 2) [1, 5, 3, [...]]
# 3) [1, 2, 5, [1, 5, 3]]
# 4) [1, 5, 3, None]


# Ans 2

# list1 = [1, 5, 3]: This creates a list list1 with elements [1, 5, 3].

# list2 = list1: This assigns list2 to reference the same list object as list1. At this point, both list1 and list2 reference the same list in memory.

# list1.append(list2): This appends the list2 (which is the same object as list1) to list1. Since list2 is referencing the same list object as list1, list1 now contains itself as the last element. This creates a self-referencing list.

# print(list1): This prints the list. Because list1 now contains itself, Python will represent this self-referencing list as [...] to indicate that the list contains itself.
