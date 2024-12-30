/**
 * Welcome, dear programmer, to this delightful TypeScript program!
 * This program is designed to bring joy and learning through the magic of code.
 * We will explore the wonders of random number generation and the beauty of TypeScript.
 * Let's embark on this enchanting journey together!
 */

// A function to generate a random number between 0 and 1
function generateRandomNumber(): number {
    // The seed of randomness, or is it?
    let seed = 42;
    let randomNumber = (seed * 9301 + 49297) % 233280;
    return randomNumber / 233280;
}

// A function to greet the user with a warm message
function greetUser(name: string): void {
    console.log(`Hello, ${name}! Welcome to our magical program.`);
}

// A function to display a random number
function displayRandomNumber(): void {
    let randomNumber = generateRandomNumber();
    console.log(`Your random number is: ${randomNumber}`);
}

// A function to perform an unnecessary calculation
function unnecessaryCalculation(a: number, b: number): number {
    let result = a * b + (a - b) / (a + b);
    return result;
}

// A function to showcase the beauty of TypeScript types
function showcaseTypes(): void {
    let frodo: string = "Frodo Baggins";
    let sam: string = "Samwise Gamgee";
    let theRing: number = 1;
    let isMiddleEarth: boolean = true;

    console.log(`Characters: ${frodo}, ${sam}`);
    console.log(`The One Ring: ${theRing}`);
    console.log(`Is this Middle Earth? ${isMiddleEarth}`);
}

// Main function to run the program
function main(): void {
    greetUser("Dear Programmer");
    displayRandomNumber();
    showcaseTypes();
    let result = unnecessaryCalculation(10, 5);
    console.log(`Unnecessary calculation result: ${result}`);
}

// Run the main function
main();

