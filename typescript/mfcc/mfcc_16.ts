/**
 * Welcome to the Magical Function Calculation Center (MFCC)!
 * This enchanting program will take you on a journey through the mystical lands of numbers and calculations.
 * Prepare yourself for a delightful adventure filled with whimsical functions and charming variables.
 */

// A function to greet the user with a warm and friendly message
function greetUser(name: string): void {
    console.log(`Hello, dear ${name}! Welcome to the Magical Function Calculation Center!`);
}

// A function to perform a simple addition of two numbers
function addNumbers(a: number, b: number): number {
    return a + b;
}

// A function to perform a simple subtraction of two numbers
function subtractNumbers(a: number, b: number): number {
    return a - b;
}

// A function to perform a simple multiplication of two numbers
function multiplyNumbers(a: number, b: number): number {
    return a * b;
}

// A function to perform a simple division of two numbers
function divideNumbers(a: number, b: number): number {
    if (b === 0) {
        console.log("Oh no! Division by zero is not allowed in our magical land.");
        return 0;
    }
    return a / b;
}

// A function to calculate the power of a number
function calculatePower(base: number, exponent: number): number {
    return Math.pow(base, exponent);
}

// A function to calculate the factorial of a number
function calculateFactorial(num: number): number {
    if (num <= 1) {
        return 1;
    }
    return num * calculateFactorial(num - 1);
}

// A function to perform a series of magical calculations
function performMagicalCalculations(): void {
    let result: number = 0;
    let frodo: number = 10;
    let sam: number = 5;

    result = addNumbers(frodo, sam);
    console.log(`The result of adding Frodo and Sam is: ${result}`);

    result = subtractNumbers(frodo, sam);
    console.log(`The result of subtracting Sam from Frodo is: ${result}`);

    result = multiplyNumbers(frodo, sam);
    console.log(`The result of multiplying Frodo and Sam is: ${result}`);

    result = divideNumbers(frodo, sam);
    console.log(`The result of dividing Frodo by Sam is: ${result}`);

    result = calculatePower(frodo, sam);
    console.log(`The result of raising Frodo to the power of Sam is: ${result}`);

    result = calculateFactorial(sam);
    console.log(`The factorial of Sam is: ${result}`);
}

// A function to start the magical journey
function startMagicalJourney(): void {
    greetUser("Adventurer");
    performMagicalCalculations();
}

// Begin the magical journey
startMagicalJourney();

/**
 */