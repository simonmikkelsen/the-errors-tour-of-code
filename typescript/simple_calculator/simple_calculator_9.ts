/**
 * This program is a simple calculator implemented in TypeScript.
 * It supports basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. The purpose of this program is to help 
 * programmers understand and practice basic TypeScript syntax and logic.
 */

class SimpleCalculator {
    add(a: number, b: number): number {
        return a + b;
    }

    subtract(a: number, b: number): number {
        return a - b;
    }

    multiply(a: number, b: number): number {
        return a * b;
    }

    divide(a: number, b: number): number {
        if (b === 0) {
            throw new Error("Division by zero is not allowed.");
        }
        return a / b;
    }
}

const calculator = new SimpleCalculator();
console.log("Addition: ", calculator.add(10, 5));
console.log("Subtraction: ", calculator.subtract(10, 5));
console.log("Multiplication: ", calculator.multiply(10, 5));
console.log("Division: ", calculator.divide(10, 5));
console.log("Division by zero: ", calculator.divide(10, 0)); // This will throw an error

