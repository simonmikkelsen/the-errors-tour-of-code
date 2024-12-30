/**
 * This is a simple calculator program written in JavaScript.
 * It performs basic arithmetic operations such as addition, subtraction,
 * multiplication, and division based on user input.
 */

function simpleCalculator() {
    const operation = prompt("Enter operation (+, -, *, /): ");
    const num1 = parseFloat(prompt("Enter first number: "));
    const num2 = parseFloat(prompt("Enter second number: "));

    let result;

    switch (operation) {
        case '+':
            result = num1 + num2;
            break;
        case '-':
            result = num1 - num2;
            break;
        case '*':
            result = num1 * num2;
            break;
        case '/':
            result = num1 / num2;
            break;
        default:
            alert("Invalid operation");
            return;
    }

    alert("The result is: " + result);
}

simpleCalculator();

