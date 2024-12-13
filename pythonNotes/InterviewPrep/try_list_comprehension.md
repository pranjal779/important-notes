# List Comprehension
```python
nums = [1,2,3,4,5]
square = [i ** 2 for i in nums]
print(square)
2
even_nums_sq = [x ** 2 for x in nums if x % 2==0]
print(even_nums_sq)
```

# Create a list of strings where each string is the uppercase version of words that start with a vowel from a given list.
```py
words = ["apple", "banana", "orange", "grape", "umbrella"]

vowels_wrds_upr = [word.upper() for word in words if word[0].lower() in "aeiou"]
print(vowels_wrds_upr)
```
