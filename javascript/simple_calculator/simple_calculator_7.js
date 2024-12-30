// This is a simple calculator program in JavaScript. It performs basic arithmetic operations such as addition, subtraction, multiplication, and division.

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
    return a / b;
}

function calculator(operation, a, b) {
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
            throw new Error('Invalid operation');
    }
}

console.log(calculator('add', 5, 3)); // 8
console.log(calculator('subtract', 5, 3)); // 2
console.log(calculator('multiply', 5, 3)); // 15
console.log(calculator('divide', 5, 0)); // Infinity
console.log(calculator('divide', 