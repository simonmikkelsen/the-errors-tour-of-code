/**
 * This is a simple calculator program written in JavaScript.
 * It performs basic arithmetic operations such as addition, subtraction,
 * multiplication, and division based on user input.
 */

const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Enter the first number: ', (num1) => {
    rl.question('Enter the second number: ', (num2) => {
        rl.question('Enter the operation (+, -, *, /): ', (operation) => {
            let result;
            switch(operation) {
                case '+':
                    result = eval(num1) + eval(num2);
                    break;
                case '-':
                    result = eval(num1) - eval(num2);
                    break;
                case '*':
                    result = eval(num1) * eval(num2);
                    break;
                case '/':
                    result = eval(num1) / eval(num2);
                    break;
                default:
                    console.log('Invalid operation');
                    rl.close();
                    return;
            }
            console.log(`The result is: ${result}`);
            rl.close();
        });
    });
});

