# Doctest

- we used a docstring to document a function
- It is also possible to use a docstring to test a function.
- Here’s a version of uses_any with a docstring that includes tests:
  ```py
  def uses_any(word, letters):
  """Checks if a word uses any of a list of letters.
      >>> uses_any('banana', 'aeiou')
      True
      >>> uses_any('apple', 'xyz')
      False
      """
  for letter in word.lower():
    if letter in letters.lower():
      return True
  return False
  ```
  
- Each test begins with >>>, which is used as a prompt in some Python environments to indicate where the user can type code.
- In a doctest, the prompt is followed by an expression, usually a function call.
- The following line indicates the value the expression should have if the function works correctly.
- In the first example, 'banana' uses 'a', so the result should be True. In the second example, 'apple' does not use any of 'xyz', so the result should be False.
- To run these tests, we have to import the doctest module and run a function called run_docstring_examples. To make this function easier to use, I wrote the following function, which takes a function object as an argument:
  ```py
  from doctest import run_docstring_examples

  def run_doctests(func):
    run_docstring_examples(func, globals(), name=func.__name__)
  ```

  ```py
  run_doctests(uses_any)
  ```

- run_doctests finds the expressions in the docstring and evaluates them. If the result is the expected value, the test passes. Otherwise it fails.
- If all tests pass, run_doctests displays no output—in that case, no news is good news. To see what happens when a test fails, here’s an incorrect version of uses_any:
  ```py
  def uses_any_incorrect(word, letters):
      """Checks if a word uses any of a list of letters.
      >>> uses_any_incorrect('banana', 'aeiou')
      True
      >>> uses_any_incorrect('apple', 'xyz')
      False
      """
      for letter in word.lower():
        if letter in letters.lower():
            return True
        else:
            return False     # INCORRECT!
  ```

- And here’s what happens when we test it:
  ```py
  run_doctests(uses_any_incorrect)
  ```

  ```sh
  **********************************************************************
  File "__main__", line 4, in uses_any_incorrect
  Failed example:
      uses_any_incorrect('banana', 'aeiou')
  Expected:
      True
  Got:
      False
  ```

















  
