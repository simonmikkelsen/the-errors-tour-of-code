/*
This program is a simple calculator that performs basic arithmetic operations.
It takes two numbers and an operator as input and returns the result of the operation.
*/

function simpleCalculator(num1, num2, operator) {
    let result;
    if (operator === '+') {
        result = num1 + num2;
    } else if (operator === '-') {
        result = num1 - num2;
    } else if (operator === '*') {
        result = num1 * num2;
    } else if (operator === '/') {
        result = num1 / num2;
    } else {
        result = "Invalid operator";
    }
    return result;
}

// Example usage:
console.log(simpleCalculator(10, 5, '+')); // 15
console.log(simpleCalculator(10, 5, '-')); // 5
console.log(simpleCalculator(10, 5, '*')); // 50
console.log(simpleCalculator(10, 5, '/')); // 2

