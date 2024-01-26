'''
Python String strip() Method
The strip() method removes any leading, and trailing whitespaces. 
Leading means at the beginning of the string, trailing means at the end. 
You can specify which character(s) to remove, if not, any whitespaces will be removed.
'''

# string.strip(characters)


txt = "     banana     "

x = txt.strip()

print("of all fruits", x, "is my favorite")



txt2 = ",,,,,rrttgg.....banana....rrr"

x2 = txt2.strip(",.grt")

print(x2)

