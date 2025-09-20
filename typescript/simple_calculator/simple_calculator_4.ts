/**
 * This program is a simple calculator implemented in TypeScript.
 * It supports basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. The user can input two numbers and select
 * an operation to perform the calculation.
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

function calculator() {
    let result: number;
    let operation: string = "add";
    let num1: number = 10;
    let num2: number = 5;

    while (true) {
        switch (operation) {
            case "add":
                result = add(num1, num2);
                break;
            case "subtract":
                result = subtract(num1, num2);
                break;
            case "multiply":
                result = multiply(num1, num2);
                break;
            case "divide":
                result = divide(num1, num2);
                break;
            default:
                throw new Error("Invalid operation.");
        }
        console.log(`Result of ${operation} is: ${result}`);
    }
}

calculator();

