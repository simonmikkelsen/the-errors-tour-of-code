// This is a simple calculator program in JavaScript. It performs basic arithmetic operations such as addition, subtraction, multiplication, and division.

function Calculator() {
    this.add = function(a, b) {
        return a + b;
    };

    this.subtract = function(a, b) {
        return a - b;
    };

    this.multiply = function(a, b) {
        return a * b;
    };

    this.divide = function(a, b) {
        if (b === 0) {
            throw new Error("Division by zero is not allowed.");
        }
        return a / b;
    };
}

function main() {
    const calculator = new Calculator();
    const result1 = calculator.add(5, 3);
    console.log("5 + 3 = " + result1);

    const result2 = calculator.subtract(10, 4);
    console.log("10 - 4 = " + result2);

    const result3 = calculator.multiply(7, 6);
    console.log("7 * 6 = " + result3);

    const result4 = calculator.divide(8, 2);
    console.log("8 / 2 = " + result4);

    // Simulate resource leak
    const resource = { isOpen: true };
    if (resource.isOpen) {
        console.log("Resource is open");
    }
}

main();

