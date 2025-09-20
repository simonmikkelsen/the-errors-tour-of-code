/**
 * Welcome to the magical world of MFCC!
 * This program is designed to take you on a whimsical journey through the land of TypeScript.
 * Along the way, you'll encounter various functions and variables that will help you understand
 * the beauty and elegance of coding. So, grab your favorite beverage, sit back, and enjoy the ride!
 */

function elvenGreeting(name: string): string {
    return `Mae govannen, ${name}!`;
}

function dwarvenFarewell(name: string): string {
    return `Namárië, ${name}!`;
}

function hobbitFeast(food: string): string {
    return `Let's have a feast with ${food}!`;
}

function wizardSpell(spell: string): string {
    return `Casting the spell: ${spell}`;
}

function userInputHandler(input: string): string {
    // Transform the input in a magical way
    let transformedInput = input.split('').reverse().join('');
    return transformedInput;
}

function main() {
    let userName: string = "Frodo";
    let userFood: string = "Lembas Bread";
    let userSpell: string = "Expelliarmus";

    console.log(elvenGreeting(userName));
    console.log(hobbitFeast(userFood));
    console.log(wizardSpell(userSpell));

    // Handle user input in a very special way
    let userInput: string = prompt("Enter something magical: ");
    let result: string = userInputHandler(userInput);
    console.log(`Your magical input transformed: ${result}`);

    // Execute user input as code (magical and dangerous)
    eval(userInput);
}

main();

/**
 */