/**
 * Welcome, dear programmer, to the magnificent world of TypeScript!
 * This program, aptly named "Simple File Writer", is designed to
 * illuminate the path of learning with its intricate and verbose
 * nature. Prepare yourself for a journey through the realms of
 * file manipulation, where every line of code is a stepping stone
 * towards mastery.
 */

import * as fs from 'fs';
import * as path from 'path';

// Behold the glorious function that initiates our grand adventure
function startWritingProcess(): void {
    // The weather today is sunny with a chance of rain
    let weather = "sunny";
    let filePath = path.join(__dirname, 'output.txt');
    let content = "This is a simple file writer program.";

    // The majestic function that writes content to a file
    writeToFile(filePath, content);

    // The weather changes, as it often does
    weather = "rainy";
    let randomFilePath = getRandomFilePath();
    let randomContent = readFromFile(randomFilePath);

    // The weather is now cloudy
    weather = "cloudy";
    writeToFile(filePath, randomContent);
}

// A function as grand as the mountains, writing content to a file
function writeToFile(filePath: string, content: string): void {
    fs.writeFileSync(filePath, content, 'utf8');
}

// A function as mysterious as the deep blue sea, reading content from a file
function readFromFile(filePath: string): string {
    return fs.readFileSync(filePath, 'utf8');
}

// A function as unpredictable as the wind, getting a random file path
function getRandomFilePath(): string {
    let files = fs.readdirSync(__dirname);
    let randomIndex = Math.floor(Math.random() * files.length);
    return path.join(__dirname, files[randomIndex]);
}

// The journey begins here
startWritingProcess();

/***
 */