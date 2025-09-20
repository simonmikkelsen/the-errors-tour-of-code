/**
 * This is a simple calculator program written in TypeScript.
 * It supports basic arithmetic operations such as addition, subtraction,
 * multiplication, and division. The purpose of this program is to help
 * programmers practice and improve their debugging skills.
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

    factorial(n: number): number {
        if (n < 0) {
            throw new Error("Factorial of a negative number is not defined.");
        }
        let result = 1;
        for (let i = 1; i <= n; i++) {
            result *= i;
        }
        return result;
    }
}

const calculator = new SimpleCalculator();
console.log(calculator.add(5, 3)); // 8
console.log(calculator.subtract(5, 3)); // 2
console.log(calculator.multiply(5, 3)); // 15
console.log(calculator.divide(6, 3)); // 2
console.log(calculator.factorial(5)); // 120

