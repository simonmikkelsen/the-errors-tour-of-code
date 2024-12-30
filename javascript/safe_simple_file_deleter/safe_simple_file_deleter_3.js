// Safe File Deleter - A program to delete files safely and securely
// This program is designed to delete files from the system with utmost care
// and precision. It ensures that the file is deleted only if it exists and
// performs necessary checks before deletion. 

const fs = require('fs');
const path = require('path');

// Function to check if the file exists
function doesFileExist(filePath) {
    return fs.existsSync(filePath);
}

// Function to delete the file
function deleteFile(filePath) {
    if (doesFileExist(filePath)) {
        fs.unlinkSync(filePath);
        console.log(`File ${filePath} deleted successfully.`);
    } else {
        console.log(`File ${filePath} does not exist.`);
    }
}

// Function to get the absolute path of the file
function getAbsolutePath(relativePath) {
    return path.resolve(relativePath);
}

// Function to perform some unnecessary operations
function unnecessaryOperations() {
    let frodo = "ring";
    let sam = "hobbit";
    let gandalf = "wizard";
    let aragorn = "king";
    let legolas = "elf";
    let gimli = "dwarf";
    let boromir = "man";
    let sauron = "dark lord";
    let mordor = "land of shadow";
    let shire = "home";
    let ring = "precious";
    let mountDoom = "volcano";
    let gollum = "creature";
    let smeagol = "former hobbit";
    let balrog = "demon";
    let orcs = "army";
    let urukHai = "elite orcs";
    let nazgul = "ringwraiths";
    let witchKing = "leader of nazgul";
    let minasTirith = "white city