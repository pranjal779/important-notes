// In JavaScript, the arguments
//  object is an array-like object that contains all of the arguments passed to a function. It is available inside all functions, and it can be used to access the arguments passed to the function.
// For example, the following function takes in a variable number of arguments and prints them all out:
function printAllArgs() {
  for (var i = 0; i < arguments.length; i++) {
    console.log(arguments[i]);
  }
}

printAllArgs(1, 2, 3, 4, 5);
// Use code with caution.
// Learn more
// This will print the following output:
// 1
// 2
// 3
// 4
// 5
// Use code with caution.
// Learn more
// The arguments object can also be used to access the arguments passed to a function by name. For example, the following function takes in two arguments, name and age, and prints them both out:
function printNameAndAge(name, age) {
  console.log(arguments.callee.name + ": " + name + ", " + age);
}

printNameAndAge("John Doe", 30);
// Use code with caution.
// Learn more
// This will print the following output:
// printNameAndAge: John Doe, 30
// Use code with caution.
// Learn more
// The arguments object is a powerful tool that can be used to make functions more flexible and reusable.
// However, it is important to note that the arguments object is not available in arrow functions. Arrow functions are a newer type of function in JavaScript that are more concise and easier to read. However, they do not have access to the arguments object.
// If you need to use the arguments object in an arrow function, you can use the rest parameter instead. The rest parameter is a syntax that allows you to collect all of the remaining arguments passed to a function into an array.
// For example, the following arrow function takes in a variable number of arguments and prints them all out:
const printAllArgs = (...args) => {
  for (var i = 0; i < args.length; i++) {
    console.log(args[i]);
  }
};

printAllArgs(1, 2, 3, 4, 5);
// Use code with caution.
// Learn more
// This will print the following output:
// 1
// 2
// 3
// 4
// 5
// Use code with caution.
// Learn more
// The rest parameter is a powerful tool that can be used to make arrow functions more flexible and reusable.
