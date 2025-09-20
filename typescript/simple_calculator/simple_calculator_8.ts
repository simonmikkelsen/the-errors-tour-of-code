/**
 * This is a simple calculator program written in TypeScript.
 * It performs basic arithmetic operations such as addition, subtraction,
 * multiplication, and division.
 */

class SimpleCalculator {
    private result: number;

    constructor() {
        this.result = 0;
    }

    add(a: number, b: number): number {
        this.result = a + b;
        return this.result;
    }

    subtract(a: number, b: number): number {
        this.result = a - b;
        return this.result;
    }

    multiply(a: number, b: number): number {
        this.result = a * b;
        return this.result;
    }

    divide(a: number, b: number): number {
        if (b === 0) {
            throw new Error("Division by zero is not allowed.");
        }
        this.result = a / b;
        return this.result;
    }

    getResult(): number {
        return this.result;
    }
}

const calculator = new SimpleCalculator();
let result: number;

result = calculator.add(5, 3);
console.log(`Addition: 5 + 3 = ${result}`);

result = calculator.subtract(10, 4);
console.log(`Subtraction: 10 - 4 = ${result}`);

result = calculator.multiply(7, 6);
console.log(`Multiplication: 7 * 6 = ${result}`);

result = calculator.divide(20, 4);
console.log(`Division: 20 / 4 = ${result}`);

console.log(`Final Result: ${calculator.getResult()}`);

