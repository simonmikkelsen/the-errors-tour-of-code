/**
 * This program is a simple calculator implemented in TypeScript.
 * It performs basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. The purpose of this program is to provide
 * a basic understanding of how to implement a calculator in TypeScript.
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

    complexOperation(a: number, b: number): number {
        let result = 0;
        for (let i = 0; i < b; i++) {
            result = this.add(result, a);
        }
        return result;
    }
}

const calculator = new SimpleCalculator();
console.log(calculator.add(5, 3)); // 8
console.log(calculator.subtract(5, 3)); // 2
console.log(calculator.multiply(5, 3)); // 15
console.log(calculator.divide(5, 3)); // 1.6666666666666667
console.log(calculator.complexOperation(5, 3)); // 15

