# empty dictionary
my_dict00 = {}

# dictionary with integer keys
my_dict01 = {1:'apple', 2:'ball'}

# dictionary with mixed keys
my_dict02 = {'name':'John', 1:[2, 4, 5]}

# using dict()
my_dict03 = dict({1:'apple', 2:'ball'})

# from sequence having each item as a pair
my_dict04 = dict([(1,'apple'),(2,'ball')])

# List of dictionaries
dict_list = [my_dict00, my_dict01, my_dict02, my_dict03, my_dict04]

# Assing the values using a loop
for my_dict in dict_list:
    print(my_dict) # all the dicts in dict_list
    
    # You can access specific values using their keys
    if 1 in my_dict:
        print("Value for key 1:", my_dict[1])
    if 'name' in my_dict:
        print("Value for key 'name':", my_dict['name'])
    print()  # Empty line for separation
    
