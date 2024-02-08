# [Spread syntax (...)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)


<p>The spread (...) syntax allows an iterable, such as an array or string, to be expanded in places where zero or more arguments (for function calls)</p> 
<p>or elements (for array literals) are expected.</p> 
<p>In an object literal, the spread syntax enumerates the properties of an object and adds the key-value pairs to the object being created.</p> 

<p>Spread syntax looks exactly like rest syntax. In a way, spread syntax is the opposite of rest syntax. </p> 
<p>Spread syntax "expands" an array into its elements, while rest syntax collects multiple elements and "condenses" them into a single element.</p> 

```javascript
function sum(x, y, z) {
  return x + y + z;
}

const numbers = [1, 2, 3];

console.log(sum(...numbers));
// Expected output: 6

console.log(sum.apply(null, numbers));
// Expected output: 6
```

/*
Output:
> 6
> 6
*/

// Syntax
```javascript
myFunction(a, ...iterableObj, b)
[1, ...iterableObj, '4', 'five', 6]
{ ...obj, key: 'value' }
```
