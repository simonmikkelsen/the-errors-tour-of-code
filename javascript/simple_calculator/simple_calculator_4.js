// This is a simple calculator program that performs basic arithmetic operations.
// The program takes two numbers and an operator as input and returns the result.

function calculator(num1, num2, operator) {
    switch (operator) {
        case '+':
            return num1 + num2;
        case '-':
            return num1 - num2;
        case '*':
            return num1 * num2;
        case '/':
            if (num2 !== 0) {
                return num1 / num2;
            } else {
                return 'Error: Division by zero';
            }
        default:
            return 'Error: Invalid operator';
    }
}

function getInput() {
    let num1 = parseFloat(prompt("Enter the first number:"));
    let num2 = parseFloat(prompt("Enter the second number:"));
    let operator = prompt("Enter the operator (+, -, *, /):");
    return { num1, num2, operator };
}

while (true) {
    let { num1, num2, operator } = getInput();
    let result = calculator(num1, num2, operator);
    console.log(`Result: ${result}`);
}

