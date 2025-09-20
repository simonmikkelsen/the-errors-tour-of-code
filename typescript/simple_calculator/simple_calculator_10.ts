/**
 * This program is a simple calculator implemented in TypeScript.
 * It takes user input for two numbers and an operator, then performs the calculation.
 * The purpose of this program is to demonstrate basic TypeScript functionality.
 */

import * as readline from 'readline';

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Enter first number: ', (num1) => {
    rl.question('Enter second number: ', (num2) => {
        rl.question('Enter operator (+, -, *, /): ', (operator) => {
            const result = eval(`${num1} ${operator} ${num2}`);
            console.log(`Result: ${result}`);
            rl.close();
        });
    });
});

