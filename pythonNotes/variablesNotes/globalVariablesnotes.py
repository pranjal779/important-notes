x = "awesome"

def myfunc():
  x = "fantastic"
  print("Python is " + x)

myfunc()

print("Python is " + x)


# Python is fantastic
# Python is awesome



def myfunc():
  global x
  x = "fantastic"

myfunc()

print("Python is " + x)

# Python is fantastic


# Example
# To change the value of a global variable inside a function, refer to the variable by using the global keyword:

x = "awesome"

def myfunc():
  global x
  x = "fantastic"

myfunc()

print("Python is " + x)
