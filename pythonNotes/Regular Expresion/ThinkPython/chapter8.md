## Regular Expressions ( pdf page 133 | book page 113)

```python
import re

result = re.search(pattern, text)
result
```


- re.search()
- result.string
- result.group()
- result.span()
- re.search()
- find_first('^Dracula')
- find_first('Harker$')

## Debugging
- !head pg345_cleaned.txt
- !tail pg345_cleaned.txt
- !head pg345_cleaned.txt > pg345_cleaned_10_lines.txt
- !head -100 pg345_cleaned.txt > pg345_cleaned_100_lines.txt



```python
result = re.search('Count', text)
print(result)
```

```python
def find_first(pattern):
    for line in open('pg345_cleaned.txt'):
        result = re.search(pattern, line)
            if result != None:
                return result
```

```python
result = find_first('Harker')
result.string
```

```python
pattern = r'Mina|Murray'
result = find_first(pattern)
result.string
```

```python
def count_matches(pattern):
    count = 0
    for line in open('pg345_cleaned.txt'):
        result = re.search(pattern, line)
        if result != None:
            count += 1
    return count


count_matches('Mina|Murray')
````

```python
result = find_first('^Dracula')
result.string
```

```python
result = find_first('Harker$')
result.string
```

## String Substitution


```python
result = find_first(pattern)
result.string



pattern = 'colou?r'
```

```python
result = find_first(pattern)
line = result.string
line
```

```python
re.sub(pattern, 'color', line)
```

## Debugging

