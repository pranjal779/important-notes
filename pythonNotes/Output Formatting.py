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


-----

"""Formatting output using the String method : 
This output is formatted by using string slicing and concatenation operations. 
The string type has some methods that help in formatting output in a fancier way. 
Some methods which help in formatting an output are str.ljust(), str.rjust(), and str.centre()"""

cstr = "I love coding"
   
# Printing the center aligned 
# string with fillchr
print ("Center aligned string with fillchr: ")
print (cstr.center(40, '#'))
 
# Printing the left aligned 
# string with "-" padding 
print ("The left aligned string is : ")
print (cstr.ljust(40, '-'))
 
# Printing the right aligned string
# with "-" padding 
print ("The right aligned string is : ")
print (cstr.rjust(40, '-'))


-----

# Python program to demonstrate ternary operator
a, b = 10, 20
  
# Use tuple for selecting an item
# (if_test_false,if_test_true)[test]
# if [a<b] is true it return 1, so element with 1 index will print
# else if [a<b] is false it return 0, so element with 0 index will print
print( (b, a) [a < b] )
  
# Use Dictionary for selecting an item
# if [a < b] is true then value of True key will print
# else if [a<b] is false then value of False key will print 
print({True: a, False: b} [a < b])
  
# lambda is more efficient than above two methods
# because in lambda  we are assure that
# only one expression will be evaluated unlike in
# tuple and Dictionary
print((lambda: b, lambda: a)[a < b]())


----
