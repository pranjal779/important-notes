/*
In the case of the `setGear` method within an object, you typically use the statement syntax directly, not within a template literal. 
The `${}` syntax is specifically for embedding expressions inside template literals, not for performing assignments or other statements.

Consider this:
*/

const bicycle = {
  gear: 2,
  setGear(newGear) {
    this.gear = newGear;
  }
};

bicycle.setGear(3);
console.log(bicycle.gear); // Output: 3
/*

In the above example, `this.gear = newGear;` is a statement that directly modifies the object's property. 
It's not something you would embed within a template literal. 
Template literals are more commonly used for constructing strings that involve concatenation of multiple values or expressions.

You might use template literals if you wanted to create a message using the new gear, like:

*/
const bicycle = {
  gear: 2,
  setGear(newGear) {
    this.gear = newGear;
  },
  displayMessage() {
    console.log(`The bicycle is currently in gear ${this.gear}.`);
  }
};

bicycle.setGear(3);
bicycle.displayMessage(); // Output: The bicycle is currently in gear 3.
/*

Here, the template literal `${this.gear}` is used to construct a string that includes the value of `this.gear`.
*/
