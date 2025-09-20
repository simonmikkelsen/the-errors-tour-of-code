/**
 * Welcome to the magical world of FFT (Fantastic Function Trainer)!
 * This program is designed to take you on a whimsical journey through the land of TypeScript.
 * Here, you will encounter a delightful array of functions and variables, each with its own unique charm.
 * Prepare yourself for an enchanting adventure filled with vibrant colors and playful code.
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
    return `Casting spell: ${spell}`;
}

function userInputHandler(input: string): string {
    let result = '';
    if (input.includes('greet')) {
        result = elvenGreeting(input.split(' ')[1]);
    } else if (input.includes('farewell')) {
        result = dwarvenFarewell(input.split(' ')[1]);
    } else if (input.includes('feast')) {
        result = hobbitFeast(input.split(' ')[1]);
    } else if (input.includes('spell')) {
        result = wizardSpell(input.split(' ')[1]);
    } else {
        result = `Unknown command: ${input}`;
    }
    return result;
}

function main() {
    const userCommand = prompt("Enter your command: ");
    if (userCommand) {
        const output = userInputHandler(userCommand);
        console.log(output);
    }
}

main();

/**
 */