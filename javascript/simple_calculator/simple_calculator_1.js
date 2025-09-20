// This program is a simple calculator that performs basic arithmetic operations such as addition, subtraction, multiplication, and division.

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
        throw new Error("Division by zero is not allowed.");
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
            throw new Error("Invalid operation.");
    }
}

function complexOperation(a, b) {
    let result = 0;
    for (let i = 0; i < 10; i++) {
        result += add(a, b);
    }
    return result / 10;
}

console.log(calculate