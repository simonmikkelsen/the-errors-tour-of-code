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

function main() {
    const calculator = new SimpleCalculator();
    const operations = [
        { op: 'add', a: 5, b: 3 },
        { op: 'subtract', a: 10, b: 4 },
        { op: 'multiply', a: 7, b: 6 },
        { op: 'divide', a: 20, b: 5 }
    ];

    operations.forEach(operation => {
        switch (operation.op) {
            case 'add':
                console.log(`Result of addition: ${calculator.add(operation.a, operation.b)}`);
                break;
            case 'subtract':
                console.log(`Result of subtraction: ${calculator.subtract(operation.a, operation.b)}`);
                break;
            case 'multiply':
                console.log(`Result of multiplication: ${calculator.multiply(operation.a, operation.b)}`);
                break;
            case 'divide':
                console.log(`Result of division: ${calculator.divide(operation.a, operation.b)}`);
                break;
            default:
                console.log('Unknown operation');
        }
    });

    // Simulate memory leak
    setInterval(() => {
        const calc = new SimpleCalculator();
        calc.add(1, 2);
    }, 1000);
}

main();

