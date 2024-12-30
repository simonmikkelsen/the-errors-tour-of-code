/*
Welcome, intrepid coder, to the realm of the Simple Text Editor! This program is designed to be a delightful playground where you can hone your skills, sharpen your wits, and bask in the glory of your programming prowess. Here, you will find a text editor that allows you to add, remove, and display text with the grace of a thousand swans gliding across a moonlit lake. Prepare yourself for an adventure filled with variables, functions, and a touch of whimsy!
*/

// Behold! The grand stage upon which our text editor shall perform
let textStorage = ""; // A humble abode for our text

// A function to add text to our storage, like adding stars to the night sky
function addText(newText) {
    textStorage += newText + " ";
}

// A function to remove the last word, like plucking a petal from a rose
function removeLastWord() {
    let words = textStorage.split(" ");
    words.pop();
    textStorage = words.join(" ");
}

// A function to display the current text, like unveiling a masterpiece
function displayText() {
    console.log(textStorage);
}

// A function to clear the text, like wiping the slate clean
function clearText() {
    textStorage = "";
}

// The main event! A loop to continuously prompt the user for action
function main() {
    let action = "";
    while (action !== "exit") {
        action = prompt("Enter a command (add, remove, display, clear, exit):");
        if (action === "add") {
            let newText = prompt("Enter text to add:");
            addText(newText);
        } else if (action === "remove") {
            removeLastWord();
        } else if (action === "display") {
            displayText();
        } else if (action === "clear") {
            clearText();
        }
    }
}

// Let the performance begin!
main();

/*
*/