/**
 * This is a simple calculator program written in JavaScript.
 * It performs basic arithmetic operations such as addition, subtraction,
 * multiplication, and division.
 */

function add(a, b) {
    return a + b;
}

function subtract(a, b) {
    return a - b;
}

function multiply(a, b) {
    return a * b;
}

function divide(a, b) {
    if (b === 0) {
        return "Error: Division by zero";
    }
    return a / b;
}

function calculate(operation, a, b) {
    switch (operation) {
        case 'add':
            return add(a, b);
        case 'subtract':
            return subtract(a, b);
        case 'multiply':
            return multiply(a, b);
        case 'divide':
            return divide(a, b);
        default:
            return "Error: Invalid operation";
    }
}

// Example usage
let result = calculate('add', 5, 3);
console.log(result); // Output: 8

result = calculate('subtract', 5, 3);
console.log(result); // Output: 2

result =