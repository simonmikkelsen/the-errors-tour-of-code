/**
 * This is a simple calculator program written in TypeScript.
 * It supports basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. The program takes user input from the console
 * and performs the requested operation.
 */

import * as readline from 'readline';

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function calculate(operation: string, num1: number, num2: number): number {
    switch (operation) {
        case 'add':
            return num1 + num2;
        case 'subtract':
            return num1 - num2;
        case 'multiply':
            return num1 * num2;
        case 'divide':
            if (num2 !== 0) {
                return num1 / num2;
            } else {
                console.log('Error: Division by zero');
                return NaN;
            }
        default:
            console.log('Error: Invalid operation');
            return NaN;
    }
}

rl.question('Enter operation (add, subtract, multiply, divide): ', (operation) => {
    rl.question('Enter first number: ', (first) => {
        const num1 = parseFloat(first);
        rl.question('Enter second number: ', (second) => {
            const num2 = parseFloat(second);
            const result = calculate(operation, num1, num2);
            console.log(`Result: ${result}`);
        });
    });
});

