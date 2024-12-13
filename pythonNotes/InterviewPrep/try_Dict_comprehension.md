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

{'C': 6, '”': 1, 'n': 6, 'D': 2, ',': 1, 'a': 13, 'b': 1, 'v': 1, 'y': 3, 'g': 4, ' ': 36, 'h': 18, 'l': 6, 'i': 14, '.': 2, 'I': 2, ':': 1, 'k': 3, '4': 1, 'c': 1, '0': 1, 'e': 16, 'p': 8, 's': 23, 'd': 6, '1': 2, 'u': 4, 'W': 3, 'H': 1, 'f': 2, 'r': 10, 'G': 4, 'm': 10, 'o': 9, 't': 7, 'w': 1, '“': 1}
{1: 1, 2: 8, 3: 27, 4: 64, 5: 125}

