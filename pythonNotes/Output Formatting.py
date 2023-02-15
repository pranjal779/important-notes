# Python program showing
# a use of format() method
 
# combining positional and keyword arguments
print('Number one portal is {0}, {1}, and {other}.'
     .format('Geeks', 'For', other ='Geeks'))
 
# using format() method with number
print("Geeks :{0:2d}, Portal :{1:8.2f}".
      format(12, 00.546))
      
# using format() method with number but in portal it is {:8,2f}
print("Geeks :{0:2d}, Portal :{1:8.3f}".
      format(14, 00.546))
 
# Changing positional argument
print("Second argument: {1:3d}, first one: {0:7.2f}".
      format(47.42, 11))
 
print("Geeks: {a:5d},  Portal: {p:8.2f}".
     format(a = 453, p = 59.058))




----------



# Python program to
# show format() is
# used in dictionary
 
tab = {'geeks': 4127, 'for': 4098, 'geek': 8637678}
 
# using format() in dictionary
print('Geeks: {0[geeks]:d}; For: {0[for]:d}; '
    'Geeks: {0[geek]:d}'.format(tab))
    
# using format() in dictionary instead of 0 in  {0[for]:d}?
"""Traceback (most recent call last):
  File "main.py", line 12, in <module>
    print('Geeks: {0[geeks]:d}; For: {1[for]:d}; '
IndexError: Replacement index 1 out of range for positional args tuple"""
 
data = dict(fun ="GeeksForGeeks", adj ="Portal")
 
# using format() in dictionary
print("I love {fun} computer {adj}".format(**data))
