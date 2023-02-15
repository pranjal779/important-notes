# https://www.geeksforgeeks.org/python-string/

# Integers such as Binary, hexadecimal, etc., and floats can be rounded or displayed in the exponent form with the use of format specifiers. 

# Formatting of Integers
String1 = "{0:b}".format(16)
print("\nBinary representation of 16 is ")
print(String1)

# Formatting of Floats
String1 = "{0:e}".format(165.6458)
print("\nExponent representation of 165.6458 is ")
print(String1)

# Rounding off Integers
String1 = "{0:.2f}".format(1/6)
print("\none-sixth is : ")
print(String1)


----


# A string can be left() or center(^) justified with the use of format specifiers, separated by a colon(:).

# String alignment
String1 = "|{:<10}|{:^10}|{:>10}|".format('Geeks',
										'for',
										'Geeks')
print("\nLeft, center and right alignment with Formatting: ")
print(String1)

# To demonstrate aligning of spaces
String1 = "\n{0:^16} was founded in {1:<4}!".format("GeeksforGeeks",
													2009)
print(String1)
