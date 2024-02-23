def complicated_function(x, y):
  print(x, y)
  pass

complicated_function(1, 2)
complicated_function(y = 2, x = 1)
complicated_function(1, z = 3, y = 2)

# want to use
# some positional arguments
# and the rest keyword arguments,
# that means that you need to start
# by defining my positional arguments.
# Then you can do the keyword arguments after
# syntaxError: positional argument follows keword argumnet
complicated_function(z = 2, 1, y =3)

# optional parameters in 'def', remoiving none will throw error
complicated_function(x, y, z = None)


# *args
def complicated_function02(x, y, *args):
  print(x, y, args)


complicated_function02(1, 2, 4, 5, 3, 7, 2, 9, 2)

def complicated_function03(*args):
  print(args)


complicated_function03(1, 2, 4, 5, 3, 7, 2, 9, 2)

# kwargs
def complicated_function_kwargs(*args, **kwargs):
  print(args, kwargs)
  pass

complicated_function_kwargs(x = 1, s = "hello", b = True)

# idky I used this:
def complicated_function04(*args):
  print(args)

complicated_function04()

# kwargs2
def complicated_function_kwargs02(*args, **kwargs):
  print(args, kwargs["x"])
  pass

complicated_function_kwargs02(x = 1, s = "hello", b = True)

# kwargs & args with some values
def complicated_function_kwargs_args(*args, **kwargs):
  print(args, kwargs)
  pass

complicated_function_kwargs_args(1, 2, 3, 4, x = 1, s = "hello", b = True)


# kwargs & args with some values in the function call arguments
def complicated_function_kwargs_args(a, b, c = True, d = False):
  print(a, b)
  pass

complicated_function_kwargs_args(*[1, 2], {"c": "hello", "d": "cool"})
