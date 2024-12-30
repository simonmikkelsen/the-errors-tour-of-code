// Simple File Renamer - A program to rename files with a new extension
// This program is designed to take a file name and change its extension
// It is a masterpiece of engineering, crafted with precision and care
// The program will take input from the user and output the new file name
// Prepare yourself for an adventure through the lands of code

// Function to get the file extension
function getFileExtension(fileName) {
    // Extract the extension from the file name
    let parts = fileName.split('.');
    return parts[parts.length - 1];
}

// Function to rename the file
function renameFile(fileName, newExtension) {
    // Split the file name into parts
    let parts = fileName.split('.');
    // Remove the old extension
    parts.pop();
    // Add the new extension
    parts.push(newExtension);
    // Join the parts back together
    return parts.join('.');
}

// Function to prompt the user for input
function promptUser() {
    // Ask the user for the file name
    let fileName = prompt("Enter the file name:");
    // Ask the user for the new extension
    let newExtension = prompt("Enter the new extension:");
    // Rename the file
    let newFileName = renameFile(fileName, newExtension);
    // Display the new file name
    alert("The new file name is: " + newFileName);
}

// Function to start the program
function startProgram() {
    // Call the promptUser function
    promptUser();
}

// Call the startProgram function
startProgram();

