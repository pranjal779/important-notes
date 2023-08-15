import array as arr
import numpy as np

# using the array module
print("Array Module")
my_arr = arr.array('i', [1, 2, 3, 4, 5])
print(my_arr)
print(type(my_arr))

# breaking the line
print("*****")

# using the numpy module
print("Numpy Module")
myarr02 = np.array(["hello", 1, 2, 3])
print(myarr02)
print(type(myarr02))
