# Write a dictionary comprehension to count the occurrences of each character in a given string.
```python
text = "Gukesh vs Ding World Chess Championship Game 14 highlights: Gukesh becomes World Chess Champion “I was dreaming this moment for last 10 years. Happy I realised this dream,” says D. Gukesh after his World Chess Championship triumph"

char_count = {char: text.count(char) for char in set(text)}
print(char_count)
```


#  Create a dictionary where keys are numbers from 1 to 5, and values are their cubes.
```python
cubes_key = {x: x ** 3 for x in range(1, 6)}
print(cubes_key)
```

# Given list of tuples
```py
data = [("a", 5), ("b", 15), ("c", 8), ("d", 20)]
```

# Dictionary comprehension for filtering
```python
filtered_dict = {key: value for key, value in data if value > 10}
print(filtered_dict)
```
# Output: 

{'b': 15, 'd': 20}

{'D': 2, 'k': 3, 't': 7, 'd': 6, 'm': 10, 'c': 1, '“': 1, '4': 1, 'n': 6, 'C': 6, 'H': 1, 'w': 1, '”': 1, 'l': 6, 's': 23, 'r': 10, ',': 1, 'e': 16, 'f': 2, 'h': 18, ':': 1, 'W': 3, 'p': 8, 'u': 4, '.': 2, '1': 2, '0': 1, 'v': 1, 'g': 4, ' ': 36, 'b': 1, 'o': 9, 'i': 14, 'y': 3, 'a': 13, 'I': 2, 'G': 4}  

{1: 1, 2: 8, 3: 27, 4: 64, 5: 125}  

[(2, 4), (7, -1)]  

{'b': 15, 'd': 20}

