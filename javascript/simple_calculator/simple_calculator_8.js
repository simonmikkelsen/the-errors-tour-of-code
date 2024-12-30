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

let number1;
let number2 = 10;
let op = '+';

console.log(simpleCalculator(number1, number2, op));

