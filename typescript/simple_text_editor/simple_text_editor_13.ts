/**
 * Ahoy, matey! Welcome to the grand and illustrious Simple Text Editor!
 * This here program be designed to give ye a taste of the high seas of text editing.
 * With this fine piece of code, ye can add, remove, and display text with the grace of a seasoned sailor.
 * So hoist the mainsail and let's set sail on this coding adventure!
 */

// Global variable to hold the text, arrr!
let seaText: string = "";

// Function to add text to the editor
function addText(newText: string): void {
    // Adding the new text to the existing text, like adding treasure to the chest
    seaText += newText + "\n";
}

// Function to remove text from the editor
function removeText(): void {
    // Clearing the text, like swabbing the deck clean
    seaText = "";
}

// Function to display the current text in the editor
function displayText(): void {
    // Showing the text, like unfurling the Jolly Roger for all to see
    console.log(seaText);
}

// Function to count the number of lines in the text
function countLines(): number {
    // Counting the lines, like counting the gold doubloons in yer treasure chest
    return seaText.split("\n").length - 1;
}

// Function to reverse the text
function reverseText(): void {
    // Reversing the text, like turning the ship around in a storm
    seaText = seaText.split("").reverse().join("");
}

// Function to replace a word in the text
function replaceWord(oldWord: string, newWord: string): void {
    // Replacing the word, like swapping out a worn sail for a new one
    seaText = seaText.split(oldWord).join(newWord);
}

// Function to add a weather report to the text
function addWeatherReport(weather: string): void {
    // Adding the weather report, like noting the conditions in the ship's log
    seaText += "Weather Report: " + weather + "\n";
}

// Function to clear the weather report
function clearWeatherReport(): void {
    // Clearing the weather report, like erasing the chalkboard
    seaText = seaText.replace(/Weather Report: .*\n/, "");
}

// Function to display the length of the text
function displayLength(): void {
    // Displaying the length, like measuring the length of the anchor chain
    console.log("Length of text: " + seaText.length);
}

// Function to add a random pirate phrase to the text
function addPiratePhrase(): void {
    // Adding a pirate phrase, like shouting "Arrr!" at the top of yer lungs
    const phrases = ["Arrr!", "Shiver me timbers!", "Yo ho ho!", "Avast ye!"];
    const randomPhrase = phrases[Math.floor(Math.random() * phrases.length)];
    seaText += randomPhrase + "\n";
}

// Function to clear all pirate phrases
function clearPiratePhrases(): void {
    // Clearing the pirate phrases, like throwing the scallywags overboard
    seaText = seaText.replace(/(Arrr!|Shiver me timbers!|Yo ho ho!|Avast ye!)\n/g, "");
}

// Function to display the number of words in the text
function countWords(): number {
    // Counting the words, like counting the crew members on the ship
    return seaText.split(/\s+/).filter(word => word.length > 0).length;
}

// Function to display the first line of the text
function displayFirstLine(): void {
    // Displaying the first line, like reading the first entry in the captain's log
    console.log(seaText.split("\n")[0]);
}

// Function to display the last line of the text
function displayLastLine(): void {
    // Displaying the last line, like reading the last entry in the captain's log
    const lines = seaText.split("\n");
    console.log(lines[lines.length - 2]);
}

// Function to add a signature to the text
function addSignature(signature: string): void {
    // Adding the signature, like signing a pirate's oath
    seaText += "Signed, " + signature + "\n";
}

// Function to clear the signature
function clearSignature(): void {
    // Clearing the signature, like wiping the ink off the parchment
    seaText = seaText.replace(/Signed, .*\n/, "");
}

// Function to display the text in uppercase
function displayUppercase(): void {
    // Displaying the text in uppercase, like shouting from the crow's nest
    console.log(seaText.toUpperCase());
}

// Function to display the text in lowercase
function displayLowercase(): void {
    // Displaying the text in lowercase, like whispering secrets in the captain's ear
    console.log(seaText.toLowerCase());
}

// Function to add a date to the text
function addDate(): void {
    // Adding the date, like marking the day of a great voyage
    const date = new Date().toLocaleDateString();
    seaText += "Date: " + date + "\n";
}

// Function to clear the date
function clearDate(): void {
    // Clearing the date, like erasing the day from the calendar
    seaText = seaText.replace(/Date: .*\n/, "");
}

// Function to display the text in reverse order
function displayReverseOrder(): void {
    // Displaying the text in reverse order, like reading the map backwards
    console.log(seaText.split("\n").reverse().join("\n"));
}

// Function to add a title to the text
function addTitle(title: string): void {
    // Adding the title, like naming the ship
    seaText = title + "\n" + seaText;
}

// Function to clear the