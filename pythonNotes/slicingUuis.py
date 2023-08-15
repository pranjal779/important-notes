example = [1, 2, 3, 4, 5] # created list
print(example[0:5]) # whole list is printed
print(example[1:5]) # prints [2,3,4,5]
print(example[4:5]) # prints [5]

# Slicing a string
my_string = "Hello, World!"
substring = my_string[7:12]  # Extracts characters from index 7 to 11
print(substring)  # Output: "World"

# Slicing a list
my_list = [1, 2, 3, 4, 5, 6, 7, 8, 9]
sublist = my_list[2:6]  # Extracts elements from index 2 to 5
print(sublist)  # Output: [3, 4, 5, 6]

# Slicing with step
my_string = "Python Programming"
substring = my_string[0:14:2]  # Extracts characters with step of 2
print(substring)  # Output: "Pto rgam"

# Omitting start and end index
my_list = [10, 20, 30, 40, 50, 60]
sublist = my_list[:3]  # Extracts elements from start to index 2
print(sublist)  # Output: [10, 20, 30]

sublist = my_list[3:]  # Extracts elements from index 3 to end
print(sublist)  # Output: [40, 50, 60]

# Negative indexing
my_string = "Hello, World!"
substring = my_string[-6:-1]  # Extracts characters using negative indices
print(substring)  # Output: " Worl"
