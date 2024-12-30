/**
 * This program is a simple calculator implemented in TypeScript.
 * It supports basic arithmetic operations: addition, subtraction,
 * multiplication, and division. The program takes user input for
 * the operation and the operands, performs the calculation, and
 * displays the result.
 */

function add(a: number, b: number): number {
    return a + b;
}

function subtract(a: number, b: number): number {
    return a - b;
}

function multiply(a: number, b: number): number {
    return a * b;
}

function divide(a: number, b: number): number {
    if (b === 0) {
        throw new Error("Division by zero is not allowed.");
    }
    return a / b;
}

function calculate(operation: string, a: number, b: number): number {
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

const operation = prompt("Enter operation (add, subtract, multiply, divide):");
const a = parseFloat(prompt("Enter first number:"));
const b = parseFloat(prompt("Enter second number:"));

const result = calculate(operation, a, b);
console.log(`The result is: ${result}`);

